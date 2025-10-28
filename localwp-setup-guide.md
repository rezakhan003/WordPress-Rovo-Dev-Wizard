# LocalWP Setup Guide - Detailed Instructions

## What is LocalWP?

LocalWP (formerly Local by Flywheel) is a powerful, free local WordPress development environment that makes it incredibly easy to develop WordPress sites on your computer.

### Why LocalWP?

- **Lightning Fast**: Instant site creation and blazing performance
- **One-Click Everything**: SSL, database access, email testing
- **Built-in Tools**: WP-CLI, Adminer, MailHog, and more
- **Blueprint System**: Save and reuse site configurations
- **Live Links**: Share your local site with clients
- **Cross-Platform**: Works on Mac, Windows, and Linux

## Installation

### Step 1: Download LocalWP

1. Visit [https://localwp.com/](https://localwp.com/)
2. Click "Download" button
3. Choose your operating system:
   - Mac: Download .dmg file
   - Windows: Download .exe file
   - Linux: Download .deb or .rpm file

### Step 2: Install LocalWP

**Mac:**
1. Open the downloaded .dmg file
2. Drag LocalWP to Applications folder
3. Open LocalWP from Applications
4. Grant necessary permissions when prompted

**Windows:**
1. Run the downloaded .exe installer
2. Follow installation wizard
3. Accept default installation location
4. Launch LocalWP when installation completes

**Linux (Debian/Ubuntu):**
```bash
# Install .deb package
sudo dpkg -i local-*.deb
sudo apt-get install -f

# Or install .rpm (Fedora/CentOS)
sudo rpm -i local-*.rpm

# Launch
local-by-flywheel
```

### Step 3: Initial Setup

1. Launch LocalWP for the first time
2. Accept the terms of service
3. Choose whether to send error reports (optional)
4. LocalWP will perform initial setup
5. You'll see the main window with "Create a new site" option

## Creating Your First WordPress Site

### Method 1: New Site from Scratch

1. **Click the "+" button** in LocalWP
2. **Enter site details:**
   - Site name: `my-wordpress-site` (lowercase, no spaces)
   - Advanced options (optional):
     - Local site domain: `my-wordpress-site.local`
     - Site path: (default is fine)

3. **Choose environment:**
   - **Preferred** (Recommended):
     - PHP: 8.3.x (latest)
     - Web Server: nginx
     - Database: MySQL 8.0
   - **Custom**: Choose specific versions if needed
   - **Blueprint**: Use saved configuration

4. **WordPress Setup:**
   - Username: `admin` (or your choice)
   - Password: Create strong password
   - Email: your@email.com

5. **Click "Add Site"**
   - LocalWP will download and install WordPress
   - Takes 1-2 minutes
   - Site will be ready when "Started" status appears

### Method 2: Import This Repository's Theme

After creating a new site in LocalWP:

1. **Locate your site folder:**
   ```bash
   # Mac
   cd ~/Local\ Sites/my-wordpress-site/app/public/
   
   # Windows
   cd C:\Users\YourUsername\Local Sites\my-wordpress-site\app\public\
   
   # Linux
   cd ~/Local Sites/my-wordpress-site/app/public/
   ```

2. **Copy theme and plugins:**
   ```bash
   # Navigate to the site folder
   cd ~/Local\ Sites/my-wordpress-site/app/public/
   
   # Copy this repository's wp-content
   cp -r /path/to/wordpress-rovo-dev-wizard/wp-content/themes/my-custom-theme wp-content/themes/
   cp -r /path/to/wordpress-rovo-dev-wizard/wp-content/plugins/custom-post-types wp-content/plugins/
   
   # Copy .htaccess
   cp /path/to/wordpress-rovo-dev-wizard/.htaccess .
   ```

3. **Activate in WordPress:**
   - Click "WP Admin" in LocalWP
   - Go to Appearance > Themes
   - Activate "My Custom Theme"
   - Go to Plugins
   - Activate "Custom Post Types"

## Understanding LocalWP Interface

### Site Overview
- **Site Domain**: Click to open site in browser
- **WP Admin**: Quick link to WordPress dashboard
- **Buttons**:
  - **Start/Stop**: Control site status
  - **Restart**: Restart site services
  - **Open Site Shell**: Command-line access

### Database Tab
- **Adminer**: One-click database management
- **Credentials**: View database connection details
- **Backup/Restore**: (LocalWP Pro feature)

### SSL Tab
- **Trust Certificate**: One-click SSL setup
- **Certificate Info**: View SSL details
- Site will be available at `https://mysite.local`

### Tools & Addons Tab
- **MailHog**: Test email sending locally
- **Image Optimizer**: (LocalWP Pro)
- **Connect to Flywheel**: Deploy to Flywheel hosting

### Logs Tab
- View PHP errors
- Check site logs
- Debug issues

## Working with LocalWP

### Accessing Your Site

**View Site in Browser:**
- Click "Open Site" button in LocalWP
- Or visit: `http://my-wordpress-site.local`
- With SSL: `https://my-wordpress-site.local`

**WordPress Admin:**
- Click "WP Admin" button in LocalWP
- Or visit: `http://my-wordpress-site.local/wp-admin`
- Login with credentials you set during creation

### Editing Files

**Option 1: Code Editor**
```bash
# Open site folder in VS Code
cd ~/Local\ Sites/my-wordpress-site/app/public/
code .

# Or Sublime Text
subl .

# Or any other editor
```

**Option 2: Direct File Access**
- Mac: Finder > Go > Go to Folder > `~/Local Sites/`
- Windows: File Explorer > `C:\Users\YourUsername\Local Sites\`
- Navigate to: `site-name/app/public/`

### Key Directories
```
my-wordpress-site/
├── app/
│   ├── public/                 # WordPress root (edit here)
│   │   ├── wp-content/
│   │   │   ├── themes/         # Your themes
│   │   │   ├── plugins/        # Your plugins
│   │   │   └── uploads/        # Media files
│   │   ├── wp-config.php       # WordPress config
│   │   └── .htaccess           # Rewrite rules
│   └── sql/                    # Database backups
├── conf/                       # Server configuration
└── logs/                       # Error and access logs
```

## Using LocalWP Features

### 1. Site Shell (WP-CLI)

**Access Shell:**
1. Right-click site in LocalWP
2. Select "Open Site Shell"
3. Command prompt opens in site directory

**Common WP-CLI Commands:**
```bash
# Site info
wp --info

# Create pages
wp post create --post_type=page --post_title='About' --post_status=publish

# Install plugins
wp plugin install contact-form-7 --activate

# Export database
wp db export backup.sql

# Search and replace URLs
wp search-replace 'http://old-site.com' 'http://new-site.com'

# Update WordPress
wp core update

# List all posts
wp post list

# Create user
wp user create john john@example.com --role=editor

# Flush rewrite rules
wp rewrite flush
```

### 2. Database Management with Adminer

**Access Adminer:**
1. Right-click site in LocalWP
2. Select "Database" > "Open Adminer"
3. Automatically logged in

**Common Tasks:**
- **Browse Tables**: Click table name to view data
- **SQL Query**: Execute custom queries
- **Export**: Download database as SQL
- **Import**: Upload SQL file
- **Search**: Find data across all tables

### 3. Email Testing with MailHog

**Enable MailHog:**
1. Go to site in LocalWP
2. Click "Tools & Addons" tab
3. Enable MailHog addon

**Test Emails:**
1. Trigger email from WordPress (e.g., password reset)
2. Click "MailHog" button in LocalWP
3. View captured emails in browser

### 4. Live Links

**Share Local Site:**
1. Right-click site in LocalWP
2. Select "Live Link"
3. Click "Enable" to generate public URL
4. Share URL with clients/team
5. Valid for 15 minutes (can refresh)

### 5. Blueprints

**Save Site as Blueprint:**
1. Right-click site
2. Select "Save as Blueprint"
3. Name your blueprint
4. Choose what to include

**Create Site from Blueprint:**
1. Click "+" to create new site
2. Select "Create from Blueprint"
3. Choose your saved blueprint
4. Site created with all settings

## LocalWP Pro Features (Optional)

LocalWP is free, but Pro version adds:
- **Instant Backups**: One-click backup/restore
- **Image Optimizer**: Compress images automatically
- **Priority Support**: Direct help from LocalWP team
- **More Add-ons**: Extended functionality

Free version is perfect for development!

## Troubleshooting LocalWP

### Site Won't Start

**Check Port Conflicts:**
```bash
# Check if port 80 is in use
lsof -i :80

# Check if port 443 is in use
lsof -i :443
```

**Solutions:**
- Stop other web servers (Apache, nginx)
- Change site ports in LocalWP settings
- Restart LocalWP application

### Database Connection Error

1. Check site is running (green status)
2. View database credentials:
   - Right-click site > Database > Show Credentials
3. Verify wp-config.php has correct credentials
4. Restart site

### Site Loads Slowly

- Check available disk space
- Ensure no resource-heavy processes running
- Increase PHP memory limit in LocalWP settings
- Consider using "Preferred" environment instead of Custom

### SSL Certificate Issues

1. Click "SSL" tab in LocalWP
2. Click "Trust" to trust certificate
3. Restart browser
4. Clear browser cache

### White Screen of Death

1. Open site logs (Logs tab in LocalWP)
2. Check PHP error log
3. Disable plugins via database:
   ```sql
   UPDATE wp_options SET option_value = '' WHERE option_name = 'active_plugins';
   ```
4. Switch to default theme

### Can't Access Site Shell

- Make sure site is running
- Try closing and reopening LocalWP
- On Windows, run LocalWP as Administrator

## LocalWP vs Docker

### LocalWP Advantages:
- ✅ Easy GUI interface
- ✅ One-click setup
- ✅ Built-in tools (Adminer, MailHog, WP-CLI)
- ✅ No command-line knowledge needed
- ✅ Perfect for beginners
- ✅ Live Links for sharing

### Docker Advantages:
- ✅ More customizable
- ✅ Identical to production
- ✅ Version-controlled configuration
- ✅ Multiple services easily
- ✅ CI/CD integration

**Recommendation**: Use LocalWP for development, Docker for advanced needs.

## Best Practices with LocalWP

### 1. Organize Your Sites
```
Local Sites/
├── client-sites/
│   ├── client1-website/
│   └── client2-website/
├── personal-projects/
│   ├── blog/
│   └── portfolio/
└── testing/
    ├── plugin-testing/
    └── theme-testing/
```

### 2. Regular Backups
- Export database regularly: `wp db export backup.sql`
- Keep wp-content in version control (Git)
- Use LocalWP Pro for automated backups

### 3. Use Blueprints
- Create blueprint for base setup
- Include favorite plugins and theme
- Reuse for new projects

### 4. Version Control
```bash
cd ~/Local\ Sites/my-site/app/public/

# Initialize Git
git init

# Add .gitignore
cat > .gitignore << EOF
wp-config.php
.htaccess
wp-content/uploads/
*.log
.DS_Store
EOF

# Commit
git add .
git commit -m "Initial commit"
```

### 5. Keep WordPress Updated
```bash
# Update WordPress core
wp core update

# Update plugins
wp plugin update --all

# Update themes
wp theme update --all
```

## Integration with This Repository

### Setup Workflow

1. **Install LocalWP** and create new site
2. **Copy files** from this repository:
   ```bash
   cd ~/Local\ Sites/my-site/app/public/
   cp -r /path/to/repo/wp-content/themes/my-custom-theme wp-content/themes/
   cp -r /path/to/repo/wp-content/plugins/custom-post-types wp-content/plugins/
   ```
3. **Activate** theme and plugins in WordPress admin
4. **Develop** your site locally
5. **Export** when ready: `./export_from_localwp.sh`
6. **Deploy** to InfinityFree: `./deploy_to_infinityfree.sh`

### Development Loop

```
LocalWP → Develop → Test → Export → Deploy → Repeat
   ↑                                           ↓
   └───────────── Update Local ────────────────┘
```

## Resources

- **Official Website**: https://localwp.com/
- **Documentation**: https://localwp.com/help-docs/
- **Community Forum**: https://localwp.com/community/
- **Video Tutorials**: Search "LocalWP tutorials" on YouTube
- **Support**: help@localwp.com

## Quick Reference

### Essential Commands
```bash
# Start site shell
Right-click site > Open Site Shell

# Export database
wp db export ~/Desktop/backup.sql

# Import database
wp db import ~/Desktop/backup.sql

# Search replace URLs
wp search-replace 'old.com' 'new.com'

# Clear cache
wp cache flush

# Regenerate thumbnails
wp media regenerate
```

### File Paths
- **Site Root**: `~/Local Sites/[site-name]/app/public/`
- **Theme**: `~/Local Sites/[site-name]/app/public/wp-content/themes/`
- **Plugins**: `~/Local Sites/[site-name]/app/public/wp-content/plugins/`
- **Uploads**: `~/Local Sites/[site-name]/app/public/wp-content/uploads/`
- **Logs**: `~/Local Sites/[site-name]/logs/`

### Database Access
- **Host**: localhost
- **Port**: Varies by site (check in LocalWP)
- **Database**: local
- **User**: root
- **Password**: root

---

This guide should get you up and running with LocalWP! For more advanced topics, refer to the official LocalWP documentation or ROVO.md for Rovo Dev-specific workflows.
