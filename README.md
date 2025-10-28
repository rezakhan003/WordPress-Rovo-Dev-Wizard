# WordPress Rovo Dev Wizard 🚀

Automated WordPress development and deployment pipeline for InfinityFree. Develop locally with LocalWP, deploy to free hosting with one command.

## Features

- **LocalWP Development**: Fast, powerful local WordPress environment
- **Custom Theme**: Ready-to-develop theme in `wp-content/themes/my-custom-theme/`
- **Custom Post Types Plugin**: Portfolio and Testimonials CPTs
- **One-Click Deployment**: Automated FTP migration to InfinityFree
- **Free Hosting**: Deploy to InfinityFree with zero hosting costs
- **FileZilla Integration**: Easy FTP configuration included


## Quick Start

### 1. Setup LocalWP Environment

1. **Download and Install LocalWP**
   - Visit [LocalWP.com](https://localwp.com/) and download for your OS
   - Install LocalWP on your computer
   - Launch LocalWP application

2. **Create New Site**
   - Click "+" to create a new site
   - Site name: Choose your project name (e.g., "my-wordpress-site")
   - Environment: Select "Preferred" (PHP 8.3, MySQL 8.0)
   - WordPress: Latest version
   - Username/Password: Set your admin credentials

3. **Clone Repository to Site Folder**
   ```bash
   # Navigate to your LocalWP site folder
   # On Mac: ~/Local Sites/[site-name]/app/public/
   # On Windows: C:\Users\[username]\Local Sites\[site-name]\app\public\
   
   # Clone this repository
   git clone https://github.com/YOUR_USERNAME/wordpress-rovo-dev-wizard.git temp
   
   # Copy wp-content files
   cp -r temp/wp-content/* wp-content/
   
   # Copy configuration files
   cp temp/.htaccess .
   cp temp/.env.example .env
   
   # Clean up
   rm -rf temp
   ```

4. **Configure Environment**
   ```bash
   # Edit .env file
   nano .env
   
   # Add your InfinityFree FTP credentials
   ```

### 2. Local Development

1. **Access Your Site**
   - In LocalWP, click "Open Site" to view in browser
   - Click "Admin" to access WordPress dashboard
   - Default URL: `http://my-wordpress-site.local`

2. **Activate Theme and Plugins**
   - Go to Appearance > Themes
   - Activate "My Custom Theme"
   - Go to Plugins
   - Activate "Custom Post Types"

3. **Start Developing**
   - Theme files: `wp-content/themes/my-custom-theme/`
   - Plugin files: `wp-content/plugins/custom-post-types/`
   - Changes are reflected immediately

### 3. Setup InfinityFree Hosting

1. **Create Free Account**
   - Visit [InfinityFree.net](https://infinityfree.net/)
   - Sign up for a free account
   - Create a new hosting account

2. **Get FTP Credentials**
   - Login to InfinityFree Control Panel
   - Go to "FTP Accounts" or "FTP Details"
   - Note your FTP details:
     - FTP Server (e.g., ftpupload.net)
     - FTP Username (e.g., epiz_xxxxx)
     - FTP Password
     - FTP Port (usually 21)

3. **Update .env File**
   ```bash
   # Edit .env with your InfinityFree details
   FTP_HOST=ftpupload.net
   FTP_USER=epiz_xxxxx
   FTP_PASS=your_password
   FTP_PORT=21
   FTP_REMOTE_DIR=/htdocs
   SITE_URL=http://yoursite.infinityfreeapp.com
   ```

### 4. Deploy to InfinityFree

```bash
# Export your LocalWP site
./export_from_localwp.sh

# Deploy to InfinityFree via FTP
./deploy_to_infinityfree.sh

# Your site will be live in 5-10 minutes
```

## Development Workflow

### Working with LocalWP

**Advantages of LocalWP:**
- Lightning-fast local development
- One-click SSL
- Built-in database management (Adminer)
- Email testing with MailHog
- Easy site cloning and blueprints
- Live Links for sharing

**LocalWP Features:**
- **Site Shell**: Command-line access to your site
- **Database**: Direct access via Adminer
- **Logs**: View PHP and server logs
- **SSL**: One-click HTTPS for local development

### Working on Your Custom Theme

- Theme files: `wp-content/themes/my-custom-theme/`
- Changes are reflected immediately (no restart needed)
- Use LocalWP's Live Reload for instant updates

### Working on Custom Post Types

- Plugin files: `wp-content/plugins/custom-post-types/`
- After activation, you'll see Portfolio and Testimonials in the admin menu

## InfinityFree Deployment

### Deployment Process

1. **Export LocalWP Site**: Creates a package with all files and database
2. **FTP Upload**: Automated upload via FileZilla/lftp
3. **Database Import**: SQL file uploaded and imported
4. **URL Updates**: Automatically updates all URLs to match InfinityFree domain
5. **Permalink Flush**: Ensures clean URLs work properly

### Post-Deployment

After deployment:
1. Your site is live at `http://yoursite.infinityfreeapp.com`
2. Login at `http://yoursite.infinityfreeapp.com/wp-admin`
3. Point your custom domain to InfinityFree nameservers (optional)
4. InfinityFree provides:
   - Free subdomain
   - Unlimited bandwidth
   - Unlimited disk space
   - Free SSL certificate (via InfinityFree control panel)

## File Structure

```
.
├── .env.example                    # FTP and site configuration
├── .htaccess                       # Apache rewrite rules
├── export_from_localwp.sh          # LocalWP export script
├── deploy_to_infinityfree.sh       # FTP deployment script
├── ftp-config.json                 # FileZilla configuration
├── localwp-setup-guide.md          # Detailed LocalWP setup
├── ROVO.md                         # Rovo Dev workflow guide
├── wp-content/
│   ├── themes/
│   │   └── my-custom-theme/        # Your custom theme
│   └── plugins/
│       └── custom-post-types/      # CPT plugin
└── .rovo/                          # Rovo Dev's workflow memory
```

## LocalWP Database Access

**Via Adminer (Built-in):**
1. Right-click site in LocalWP
2. Click "Database" > "Open Adminer"
3. Automatically logged in

**Via Command Line:**
1. Right-click site in LocalWP
2. Click "Open Site Shell"
3. Run: `wp db export backup.sql`

## FileZilla Setup (Optional)

If you prefer using FileZilla GUI:

1. Open FileZilla
2. Go to File > Site Manager
3. New Site > Name it "InfinityFree - My Site"
4. Enter your FTP credentials:
   - Protocol: FTP
   - Host: ftpupload.net
   - Port: 21
   - Encryption: Use explicit FTP over TLS
   - Logon Type: Normal
   - User: epiz_xxxxx
   - Password: your_password
5. Save and Connect

Or import the included `ftp-config.json` configuration.

## Requirements

- **LocalWP**: Latest version from [LocalWP.com](https://localwp.com/)
- **InfinityFree Account**: Free at [InfinityFree.net](https://infinityfree.net/)
- **FTP Client**: FileZilla or built-in lftp (Linux/Mac)
- **Git**: For version control (optional but recommended)

## Security Notes

- Change all default passwords in production
- Use strong passwords for InfinityFree control panel
- Keep WordPress, themes, and plugins updated
- InfinityFree provides free SSL - enable it in control panel
- Never commit your `.env` file to Git (already in .gitignore)

## How It Works

1. **LocalWP** provides a complete local WordPress environment
2. **Export script** packages your site files and database
3. **FTP deployment** uploads everything to InfinityFree
4. **Automated setup** handles database import and URL updates
5. **Free hosting** gives you a production site at zero cost

From local development to live production in minutes - completely free!

## InfinityFree Limitations (Free Plan)

- No email sending (use SMTP plugin with Gmail/SendGrid)
- Daily hits limit (check InfinityFree documentation)
- No SSH access (use FTP for file management)
- PhpMyAdmin for database management
- Cannot use some WordPress plugins that require specific PHP extensions

## Upgrading to Paid Hosting

When your site grows, you can:
1. Export your site from InfinityFree
2. Import to any paid hosting (SiteGround, Cloudways, etc.)
3. Update DNS to point to new host
4. Continue using this workflow for development

## Troubleshooting

### LocalWP Issues

```bash
# Site not starting
- Check LocalWP logs: Right-click site > View Logs
- Restart site: Stop and Start
- Restart LocalWP application

# Database connection error
- Verify site is running in LocalWP
- Check database credentials in wp-config.php
```

### InfinityFree Issues

```bash
# FTP connection failed
- Verify credentials in .env
- Check InfinityFree control panel for FTP status
- Try connecting with FileZilla to verify credentials

# Site showing errors
- Check PHP error logs in InfinityFree control panel
- Verify database was imported successfully
- Check file permissions (should be 644 for files, 755 for folders)

# URLs not working
- Verify .htaccess was uploaded
- Check permalink settings in WordPress admin
- Go to Settings > Permalinks and click "Save Changes"
```

## 🎯 Complete Workflow Summary

1. **Setup LocalWP** → Install and create new site
2. **Clone repo** → Get theme and plugins
3. **Develop** → Build your site locally
4. **Export** → Package everything with one command
5. **Deploy** → Upload to InfinityFree via FTP
6. **Live** → Free production WordPress site!

## 💡 Key Features This Provides

- **Zero DevOps knowledge required** - Just LocalWP + FTP
- **Free hosting forever** - InfinityFree free plan
- **Complete WordPress control** - Full admin access, all features
- **No hosting costs** - Perfect for testing and learning
- **Easy deployment** - One-command FTP upload
- **No credit card needed** - Completely free setup
- **Custom domain support** - Point your domain to InfinityFree
- **Version controlled** - Everything in Git
- **Instant local development** - LocalWP is blazing fast
- **Professional workflow** - Local → Production pipeline

## 🚨 Important Notes

- Always test locally before deploying
- Keep backups of your database (LocalWP auto-backups)
- Use strong passwords in production
- Update WordPress, themes, and plugins regularly
- InfinityFree may show ads (upgrade to remove)
- Free hosting has limitations - review InfinityFree terms

## 🔄 Updating Production Site

To update your production site after local changes:

```bash
# Make changes in LocalWP
# Test everything locally

# Re-export and deploy
./export_from_localwp.sh
./deploy_to_infinityfree.sh

# Your InfinityFree site is now updated
```

This is a complete local-to-production WordPress development and deployment pipeline using free, modern tools!

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

MIT License - Feel free to use this for your projects!
