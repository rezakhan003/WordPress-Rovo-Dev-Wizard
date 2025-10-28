#!/bin/bash

# Export WordPress site from LocalWP
set -e

echo "================================================"
echo "Exporting WordPress from LocalWP"
echo "================================================"

# Check if .env exists
if [ ! -f .env ]; then
    echo "❌ .env file not found. Please copy .env.example to .env and configure it."
    exit 1
fi

# Load environment variables
export $(cat .env | grep -v '^#' | xargs)

# Validate required variables
if [ -z "$LOCAL_SITE_PATH" ]; then
    echo "❌ LOCAL_SITE_PATH not set in .env"
    echo "Please set your LocalWP site path, e.g.:"
    echo "  Mac: /Users/username/Local Sites/sitename/app/public"
    echo "  Windows: C:/Users/username/Local Sites/sitename/app/public"
    exit 1
fi

# Check if site path exists
if [ ! -d "$LOCAL_SITE_PATH" ]; then
    echo "❌ LocalWP site path not found: $LOCAL_SITE_PATH"
    echo "Please verify the path in your .env file"
    exit 1
fi

# Create export directory
EXPORT_DIR="./wordpress-export"
EXPORT_TIMESTAMP=$(date +%Y%m%d_%H%M%S)
EXPORT_NAME="wordpress_export_${EXPORT_TIMESTAMP}"

echo "Creating export directory..."
mkdir -p "$EXPORT_DIR"
cd "$EXPORT_DIR"
mkdir -p "$EXPORT_NAME"

echo "1. Exporting WordPress files..."

# Copy WordPress core files (excluding wp-content initially)
echo "   - Copying WordPress core files..."
rsync -av --progress \
    --exclude 'wp-content' \
    --exclude '.git' \
    --exclude 'node_modules' \
    --exclude '.DS_Store' \
    "$LOCAL_SITE_PATH/" "$EXPORT_NAME/" 2>/dev/null || {
    echo "   ⚠️  Warning: Some files couldn't be copied (this is normal)"
}

# Copy wp-content (themes, plugins, uploads)
echo "   - Copying wp-content (themes, plugins, uploads)..."
mkdir -p "$EXPORT_NAME/wp-content"
rsync -av --progress \
    --exclude 'cache' \
    --exclude 'upgrade' \
    --exclude '.git' \
    "$LOCAL_SITE_PATH/wp-content/" "$EXPORT_NAME/wp-content/" 2>/dev/null || {
    echo "   ⚠️  Warning: Some wp-content files couldn't be copied"
}

echo "2. Exporting database..."

# Determine the path to LocalWP's WP-CLI
# Try to find the LocalWP app path
LOCALWP_PATH=""
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    LOCALWP_PATH="/Applications/Local.app"
    WP_CLI_PATH="$LOCAL_SITE_PATH"
elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
    # Windows
    LOCALWP_PATH="$LOCALAPPDATA/Programs/local"
    WP_CLI_PATH="$LOCAL_SITE_PATH"
else
    # Linux
    LOCALWP_PATH="/opt/Local"
    WP_CLI_PATH="$LOCAL_SITE_PATH"
fi

# Export database using wp-cli if available
DB_EXPORT_SUCCESS=false
if command -v wp &> /dev/null; then
    echo "   - Using WP-CLI to export database..."
    cd "$WP_CLI_PATH"
    wp db export "$EXPORT_DIR/$EXPORT_NAME/database.sql" --allow-root 2>/dev/null && DB_EXPORT_SUCCESS=true || {
        echo "   ⚠️  WP-CLI export failed, trying alternative method..."
    }
    cd - > /dev/null
fi

# If WP-CLI failed or not available, provide manual instructions
if [ "$DB_EXPORT_SUCCESS" = false ]; then
    echo "   ⚠️  Automatic database export not available"
    echo ""
    echo "   Please export the database manually using one of these methods:"
    echo ""
    echo "   Method 1 - LocalWP GUI:"
    echo "   1. Right-click your site in LocalWP"
    echo "   2. Select 'Database' > 'Open Adminer'"
    echo "   3. Click 'Export' and download the SQL file"
    echo "   4. Save it as: $EXPORT_DIR/$EXPORT_NAME/database.sql"
    echo ""
    echo "   Method 2 - LocalWP Shell:"
    echo "   1. Right-click your site in LocalWP"
    echo "   2. Select 'Open Site Shell'"
    echo "   3. Run: wp db export /tmp/database.sql"
    echo "   4. Copy to: $EXPORT_DIR/$EXPORT_NAME/database.sql"
    echo ""
    read -p "   Press Enter when you've exported the database manually..."
    
    if [ ! -f "$EXPORT_NAME/database.sql" ]; then
        echo "   ❌ Database file not found. Please export manually and run this script again."
        exit 1
    fi
fi

echo "3. Creating deployment package..."

# Create a compressed archive
cd ..
tar -czf "${EXPORT_NAME}.tar.gz" "$EXPORT_NAME"

echo "4. Generating deployment instructions..."

# Create deployment instructions
cat > "$EXPORT_NAME/DEPLOY.txt" << EOF
WordPress Deployment Package
============================

Created: $(date)
LocalWP Site: $LOCAL_SITE_PATH

Files Included:
- Complete WordPress installation
- All themes and plugins
- Database export (database.sql)
- Media uploads

Deployment Instructions:
========================

For InfinityFree (Automated):
----------------------------
1. Ensure .env file is configured with FTP credentials
2. Run: ./deploy_to_infinityfree.sh
3. Wait 5-10 minutes for deployment to complete

For InfinityFree (Manual via FileZilla):
----------------------------------------
1. Connect to InfinityFree FTP (see ftp-config.json)
2. Upload all files to /htdocs directory
3. Go to InfinityFree control panel
4. Open phpMyAdmin
5. Import database.sql
6. Update wp-config.php with InfinityFree database credentials:
   - DB_HOST: sql###.infinityfreeapp.com
   - DB_NAME: epiz_#####_wp###
   - DB_USER: epiz_#####
   - DB_PASSWORD: (from InfinityFree panel)
7. Update site URLs in database:
   UPDATE wp_options SET option_value = 'http://yoursite.infinityfreeapp.com' 
   WHERE option_name IN ('siteurl', 'home');
8. Clear browser cache and visit your site

For Other Hosting:
-----------------
1. Upload files via FTP/SFTP to public_html or www directory
2. Create MySQL database in hosting control panel
3. Import database.sql via phpMyAdmin
4. Update wp-config.php with database credentials
5. Update site URLs in database
6. Set file permissions: 644 for files, 755 for directories

Important Notes:
---------------
- Backup your database before importing
- Update wp-config.php with correct database credentials
- Change WordPress salts for security
- Set proper file permissions
- Enable SSL after deployment

Need Help?
---------
See README.md and ROVO.md for detailed instructions
EOF

echo ""
echo "================================================"
echo "✅ Export Complete!"
echo "================================================"
echo "Export Location: $EXPORT_DIR/$EXPORT_NAME"
echo "Archive Created: $EXPORT_DIR/${EXPORT_NAME}.tar.gz"
echo ""
echo "Export includes:"
echo "  - All WordPress files"
echo "  - All themes and plugins"
echo "  - All media uploads"
if [ "$DB_EXPORT_SUCCESS" = true ]; then
    echo "  - Database export (database.sql)"
else
    echo "  - Database export (needs manual completion)"
fi
echo ""
echo "Next Steps:"
echo "  1. Configure .env with InfinityFree FTP credentials"
echo "  2. Run: ./deploy_to_infinityfree.sh"
echo ""
echo "Or upload manually using FileZilla (see ftp-config.json)"
echo "================================================"

# Return to original directory
cd ../..
