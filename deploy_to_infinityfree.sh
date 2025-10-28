#!/bin/bash

# Deploy WordPress to InfinityFree via FTP
set -e

echo "================================================"
echo "Deploying WordPress to InfinityFree"
echo "================================================"

# Check if .env exists
if [ ! -f .env ]; then
    echo "❌ .env file not found. Please copy .env.example to .env and configure it."
    exit 1
fi

# Load environment variables
export $(cat .env | grep -v '^#' | xargs)

# Validate required variables
REQUIRED_VARS=("FTP_HOST" "FTP_USER" "FTP_PASS" "FTP_REMOTE_DIR" "SITE_URL")
for var in "${REQUIRED_VARS[@]}"; do
    if [ -z "${!var}" ]; then
        echo "❌ $var not set in .env file"
        exit 1
    fi
done

# Set FTP port if not specified
FTP_PORT=${FTP_PORT:-21}

# Find the latest export
EXPORT_DIR="./wordpress-export"
if [ ! -d "$EXPORT_DIR" ]; then
    echo "❌ No export found. Please run ./export_from_localwp.sh first"
    exit 1
fi

LATEST_EXPORT=$(ls -t "$EXPORT_DIR" | grep "wordpress_export_" | head -1)
if [ -z "$LATEST_EXPORT" ]; then
    echo "❌ No export found in $EXPORT_DIR"
    echo "Please run ./export_from_localwp.sh first"
    exit 1
fi

EXPORT_PATH="$EXPORT_DIR/$LATEST_EXPORT"
echo "Using export: $LATEST_EXPORT"
echo ""

# Check if lftp is available (for automated FTP)
if ! command -v lftp &> /dev/null; then
    echo "⚠️  lftp not found. Installing is recommended for automated deployment."
    echo ""
    echo "To install lftp:"
    echo "  Mac: brew install lftp"
    echo "  Ubuntu/Debian: sudo apt-get install lftp"
    echo "  CentOS/RHEL: sudo yum install lftp"
    echo ""
    echo "Alternatively, you can use FileZilla:"
    echo "  1. Open FileZilla"
    echo "  2. Import settings from ftp-config.json"
    echo "  3. Upload files from: $EXPORT_PATH"
    echo "  4. Upload to: $FTP_REMOTE_DIR"
    echo ""
    exit 1
fi

echo "1. Preparing wp-config.php for InfinityFree..."

# Check if InfinityFree database credentials are provided
if [ -n "$INFINITY_DB_HOST" ] && [ -n "$INFINITY_DB_NAME" ] && [ -n "$INFINITY_DB_USER" ] && [ -n "$INFINITY_DB_PASS" ]; then
    # Update wp-config.php with InfinityFree database credentials
    WP_CONFIG="$EXPORT_PATH/wp-config.php"
    if [ -f "$WP_CONFIG" ]; then
        cp "$WP_CONFIG" "$WP_CONFIG.bak"
        
        # Update database credentials
        sed -i.tmp "s/define( *'DB_NAME'.*/define( 'DB_NAME', '$INFINITY_DB_NAME' );/" "$WP_CONFIG"
        sed -i.tmp "s/define( *'DB_USER'.*/define( 'DB_USER', '$INFINITY_DB_USER' );/" "$WP_CONFIG"
        sed -i.tmp "s/define( *'DB_PASSWORD'.*/define( 'DB_PASSWORD', '$INFINITY_DB_PASS' );/" "$WP_CONFIG"
        sed -i.tmp "s/define( *'DB_HOST'.*/define( 'DB_HOST', '$INFINITY_DB_HOST' );/" "$WP_CONFIG"
        
        rm -f "$WP_CONFIG.tmp"
        echo "   ✓ wp-config.php updated with InfinityFree database credentials"
    else
        echo "   ⚠️  wp-config.php not found in export"
    fi
else
    echo "   ⚠️  InfinityFree database credentials not in .env"
    echo "   You'll need to update wp-config.php manually after upload"
fi

echo ""
echo "2. Updating database URLs..."

# Update database URLs
DB_FILE="$EXPORT_PATH/database.sql"
if [ -f "$DB_FILE" ]; then
    # Create backup
    cp "$DB_FILE" "$DB_FILE.bak"
    
    # Replace localhost URLs with InfinityFree URL
    # This handles various localhost formats
    sed -i.tmp "s|http://localhost|$SITE_URL|g" "$DB_FILE"
    sed -i.tmp "s|https://localhost|$SITE_URL|g" "$DB_FILE"
    sed -i.tmp "s|http://.*\.local|$SITE_URL|g" "$DB_FILE"
    sed -i.tmp "s|https://.*\.local|$SITE_URL|g" "$DB_FILE"
    
    rm -f "$DB_FILE.tmp"
    echo "   ✓ Database URLs updated to: $SITE_URL"
else
    echo "   ⚠️  database.sql not found. You'll need to import it manually."
fi

echo ""
echo "3. Connecting to InfinityFree FTP..."
echo "   Host: $FTP_HOST"
echo "   User: $FTP_USER"
echo "   Remote Dir: $FTP_REMOTE_DIR"

# Test FTP connection
echo "   Testing connection..."
lftp -u "$FTP_USER,$FTP_PASS" -e "set ftp:ssl-allow no; ls; quit" "$FTP_HOST" > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "   ✓ FTP connection successful"
else
    echo "   ❌ FTP connection failed"
    echo "   Please check your credentials in .env"
    exit 1
fi

echo ""
echo "4. Uploading files to InfinityFree..."
echo "   This may take 10-30 minutes depending on file size and connection speed"
echo ""

# Create lftp script for batch upload
LFTP_SCRIPT=$(mktemp)
cat > "$LFTP_SCRIPT" << EOF
set ftp:ssl-allow no
set net:timeout 30
set net:max-retries 3
set net:reconnect-interval-base 5

open -u "$FTP_USER,$FTP_PASS" "$FTP_HOST"
cd $FTP_REMOTE_DIR

# Upload files with progress
mirror --reverse --delete --verbose --parallel=2 "$EXPORT_PATH" .

# Verify critical files
ls -la wp-config.php
ls -la index.php
ls -la .htaccess

bye
EOF

# Execute upload
echo "   Starting upload..."
lftp -f "$LFTP_SCRIPT"

# Clean up
rm -f "$LFTP_SCRIPT"

echo ""
echo "   ✓ Files uploaded successfully"

echo ""
echo "5. Post-deployment steps..."

# Create a SQL script to update URLs
SQL_UPDATE_SCRIPT="$EXPORT_PATH/update_urls.sql"
cat > "$SQL_UPDATE_SCRIPT" << EOF
-- Update WordPress site URLs
UPDATE wp_options SET option_value = '$SITE_URL' WHERE option_name = 'siteurl';
UPDATE wp_options SET option_value = '$SITE_URL' WHERE option_name = 'home';

-- Update post GUIDs
UPDATE wp_posts SET guid = REPLACE(guid, 'http://localhost', '$SITE_URL');
UPDATE wp_posts SET guid = REPLACE(guid, 'https://localhost', '$SITE_URL');

-- Update post content
UPDATE wp_posts SET post_content = REPLACE(post_content, 'http://localhost', '$SITE_URL');
UPDATE wp_posts SET post_content = REPLACE(post_content, 'https://localhost', '$SITE_URL');

-- Update post meta
UPDATE wp_postmeta SET meta_value = REPLACE(meta_value, 'http://localhost', '$SITE_URL');
UPDATE wp_postmeta SET meta_value = REPLACE(meta_value, 'https://localhost', '$SITE_URL');

-- Update options
UPDATE wp_options SET option_value = REPLACE(option_value, 'http://localhost', '$SITE_URL');
UPDATE wp_options SET option_value = REPLACE(option_value, 'https://localhost', '$SITE_URL');
EOF

echo "   ✓ URL update script created: $SQL_UPDATE_SCRIPT"

echo ""
echo "================================================"
echo "✅ Deployment Complete!"
echo "================================================"
echo ""
echo "Files have been uploaded to InfinityFree."
echo ""
echo "⚠️  IMPORTANT: Complete these manual steps in InfinityFree Control Panel:"
echo ""
echo "1. Import Database:"
echo "   - Go to InfinityFree Control Panel"
echo "   - Open phpMyAdmin"
echo "   - Select your database"
echo "   - Click 'Import'"
echo "   - Upload: $EXPORT_PATH/database.sql"
echo "   - Click 'Go' to import"
echo ""
echo "2. Run URL Update (Optional but recommended):"
echo "   - In phpMyAdmin, click 'SQL' tab"
echo "   - Copy contents from: $SQL_UPDATE_SCRIPT"
echo "   - Paste and execute"
echo ""
echo "3. Verify wp-config.php:"
if [ -n "$INFINITY_DB_HOST" ]; then
    echo "   ✓ Database credentials already updated"
else
    echo "   - Edit wp-config.php via FTP or File Manager"
    echo "   - Update DB_HOST, DB_NAME, DB_USER, DB_PASSWORD"
    echo "   - Get credentials from InfinityFree control panel"
fi
echo ""
echo "4. Test Your Site:"
echo "   - Visit: $SITE_URL"
echo "   - Login: $SITE_URL/wp-admin"
echo "   - Check all pages and functionality"
echo ""
echo "5. Enable SSL (Recommended):"
echo "   - In InfinityFree Control Panel"
echo "   - Go to 'SSL Certificates'"
echo "   - Install free SSL certificate"
echo "   - Update SITE_URL in .env to use https://"
echo ""
echo "6. Set Permalinks:"
echo "   - Go to Settings > Permalinks in WordPress admin"
echo "   - Click 'Save Changes' to flush rewrite rules"
echo ""
echo "Your site should be live at: $SITE_URL"
echo "================================================"

# Provide FileZilla instructions as backup
echo ""
echo "If you prefer using FileZilla:"
echo "  1. Open FileZilla"
echo "  2. Import settings from: ftp-config.json"
echo "  3. Connect to InfinityFree"
echo "  4. Navigate to: $FTP_REMOTE_DIR"
echo "  5. Upload files from: $EXPORT_PATH"
echo ""

echo "Deployment logs and scripts saved in: $EXPORT_PATH"
echo ""
