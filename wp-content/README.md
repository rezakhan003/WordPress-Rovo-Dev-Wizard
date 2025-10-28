# WordPress Content Directory

This directory contains all customizable WordPress content including themes, plugins, and uploads.

## Structure

```
wp-content/
├── themes/              # WordPress themes
│   └── my-custom-theme/ # Custom theme starter
├── plugins/             # WordPress plugins
│   └── custom-post-types/ # Custom post types plugin
├── uploads/             # Media uploads (gitignored)
└── mu-plugins/          # Must-use plugins (optional)
```

## Custom Theme

### my-custom-theme/

A starter theme ready for development with:
- Clean, semantic HTML5 structure
- Responsive design foundation
- WordPress best practices
- Easy to customize

**Files:**
- `style.css` - Theme stylesheet and metadata
- `functions.php` - Theme functions and features
- `index.php` - Main template file
- `header.php` - Header template
- `footer.php` - Footer template

**To customize:**
1. Edit `style.css` for design
2. Modify `functions.php` for functionality
3. Create new template files as needed
4. Follow WordPress template hierarchy

**Template files you can add:**
- `single.php` - Single post template
- `page.php` - Page template
- `archive.php` - Archive template
- `category.php` - Category archive
- `tag.php` - Tag archive
- `search.php` - Search results
- `404.php` - Not found page
- `sidebar.php` - Sidebar template

## Custom Plugins

### custom-post-types/

Adds custom post types to WordPress:
- Portfolio items
- Testimonials

**Features:**
- Clean code structure
- Easy to extend
- Admin UI integration
- Custom taxonomies support

**To add more post types:**
Edit `custom-post-types.php` and add new `register_post_type()` calls.

## Development Tips

### LocalWP Integration

When using LocalWP:
1. Copy this wp-content folder to your LocalWP site
2. Activate theme in Appearance > Themes
3. Activate plugins in Plugins menu
4. Start customizing!

### Version Control

**What to commit:**
- ✅ Custom themes
- ✅ Custom plugins
- ✅ Configuration files

**What NOT to commit:**
- ❌ uploads/ directory (media files)
- ❌ cache/ directories
- ❌ backup files
- ❌ WordPress core files

### File Permissions

**Recommended permissions:**
- Directories: `755`
- PHP files: `644`
- wp-config.php: `644` or `440`

```bash
# Set correct permissions
find wp-content -type d -exec chmod 755 {} \;
find wp-content -type f -exec chmod 644 {} \;
```

## Adding New Themes

```bash
cd wp-content/themes/
mkdir new-theme
cd new-theme

# Create style.css with theme header
cat > style.css << 'EOF'
/*
Theme Name: My New Theme
Theme URI: http://example.com
Author: Your Name
Author URI: http://example.com
Description: A custom WordPress theme
Version: 1.0
License: GNU General Public License v2 or later
License URI: http://www.gnu.org/licenses/gpl-2.0.html
Text Domain: new-theme
*/
EOF

# Create index.php (required)
cat > index.php << 'EOF'
<?php get_header(); ?>
<main>
    <?php if (have_posts()) : while (have_posts()) : the_post(); ?>
        <article>
            <h2><?php the_title(); ?></h2>
            <?php the_content(); ?>
        </article>
    <?php endwhile; endif; ?>
</main>
<?php get_footer(); ?>
EOF

# Create functions.php
touch functions.php header.php footer.php
```

## Adding New Plugins

```bash
cd wp-content/plugins/
mkdir new-plugin
cd new-plugin

# Create main plugin file
cat > new-plugin.php << 'EOF'
<?php
/**
 * Plugin Name: My New Plugin
 * Plugin URI: http://example.com
 * Description: Custom WordPress plugin
 * Version: 1.0
 * Author: Your Name
 * Author URI: http://example.com
 * License: GPL2
 */

// Plugin code here
EOF
```

## Using LocalWP with This Content

### Method 1: Copy Files

```bash
# Navigate to LocalWP site
cd ~/Local\ Sites/my-site/app/public/

# Copy theme
cp -r /path/to/repo/wp-content/themes/my-custom-theme wp-content/themes/

# Copy plugins
cp -r /path/to/repo/wp-content/plugins/custom-post-types wp-content/plugins/

# Activate in WordPress admin
```

### Method 2: Symbolic Links (Advanced)

```bash
# Create symlinks for development
cd ~/Local\ Sites/my-site/app/public/wp-content/themes/
ln -s /path/to/repo/wp-content/themes/my-custom-theme

cd ~/Local\ Sites/my-site/app/public/wp-content/plugins/
ln -s /path/to/repo/wp-content/plugins/custom-post-types
```

This allows editing files in the repo while seeing changes in LocalWP.

## Theme Development Resources

- [WordPress Theme Handbook](https://developer.wordpress.org/themes/)
- [Template Hierarchy](https://developer.wordpress.org/themes/basics/template-hierarchy/)
- [Theme Functions](https://developer.wordpress.org/themes/basics/theme-functions/)
- [Conditional Tags](https://developer.wordpress.org/themes/basics/conditional-tags/)

## Plugin Development Resources

- [WordPress Plugin Handbook](https://developer.wordpress.org/plugins/)
- [Plugin API](https://developer.wordpress.org/plugins/hooks/)
- [Custom Post Types](https://developer.wordpress.org/plugins/post-types/)
- [Taxonomies](https://developer.wordpress.org/plugins/taxonomies/)

## Deployment

When deploying to InfinityFree:
1. This entire wp-content directory gets uploaded
2. Themes and plugins are preserved
3. Uploads directory is synced
4. Permissions are set automatically

Use the deployment script:
```bash
./export_from_localwp.sh
./deploy_to_infinityfree.sh
```

## Troubleshooting

### Theme Not Showing

1. Check theme has required files (style.css and index.php)
2. Verify style.css has theme header comment
3. Activate theme in WordPress admin
4. Clear browser cache

### Plugin Not Working

1. Check plugin file has proper header
2. Activate plugin in WordPress admin
3. Check for PHP errors in logs
4. Verify WordPress version compatibility

### File Permission Issues

```bash
# Fix permissions if needed
cd wp-content
find . -type d -exec chmod 755 {} \;
find . -type f -exec chmod 644 {} \;
```

---

For more information, see the main README.md and ROVO.md in the project root.
