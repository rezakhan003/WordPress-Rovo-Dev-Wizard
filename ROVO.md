# WordPress Rovo Dev Wizard - Complete Workflow & Development Guide

## 🚨 MANDATORY: ONE-SHOT COMPLETE EXECUTION

**YOU MUST COMPLETE THE ENTIRE WORKFLOW IN ONE SHOT. DO NOT STOP PARTWAY.**
**DO NOT deliver partial work. DO NOT stop after Phase 1. DO NOT skip steps.**
**COMPLETE MEANS: Research → Build Website → Test Locally → Fix ALL issues → Export → Deploy**
**The website must be FULLY FUNCTIONAL in LocalWP before you stop.**

**DO NOT REPORT BACK TO THE USER OR ASK THEM ANYTHING UNTIL YOU HAVE:**
- A fully built website running in LocalWP
- All directory entries created and populated
- All taxonomy pages working
- Navigation menus fully populated
- ZERO 404 errors verified by testing
- Exported package ready for deployment
- Deployed to InfinityFree (if credentials provided)

**The user hired you to BUILD A WEBSITE, not to show research or ask questions.**

## ⚠️ CRITICAL REQUIREMENT: ZERO 404 ERRORS

**EVERY website you build MUST have ZERO 404 errors. Test EVERY SINGLE link.**
**Headers and footers ALWAYS have broken links if you don't check them systematically.**
**Do not deliver a website until you've verified every link works.**

## 🎯 Main Workflow Process - COMPLETE ALL PHASES

When building a directory website, you MUST complete ALL phases in one continuous workflow:

### Phase 1: Deep Research & Comprehensive Data Collection

**GOAL: Create pages so information-rich that visitors never need to leave your site**

1. **Research each individual entry exhaustively using Jina AI**
   - Scrape the company's main website completely
   - Find and scrape their pricing pages, feature lists, documentation
   - Search for reviews, comparisons, alternatives
   - Gather technical specifications, integrations, use cases
   - Find case studies, success stories, testimonials
   - Collect founder information, company history, funding details
   - Get support options, contact methods, social media links
   - Retry any failed scrapes until you have EVERYTHING

2. **Build massive JSON datasets for each entry**
   Each individual page JSON should contain:
   ```json
   {
     "basics": {
       "name", "tagline", "description" (500+ words),
       "founded", "headquarters", "employees", "funding"
     },
     "detailed_features": [
       {"name", "description" (100+ words), "category", "importance"}
     ],
     "pricing": {
       "model", "free_tier", "starter_price", "tiers": [
         {"name", "price", "features" (20+), "limits", "best_for"}
       ]
     },
     "use_cases": [
       {"title", "description" (200+ words), "industry", "company_size"}
     ],
     "pros_cons": {
       "pros": [{"title", "explanation" (50+ words)}],
       "cons": [{"title", "explanation" (50+ words)}]
     },
     "integrations": [
       {"name", "type", "description", "documentation_url"}
     ],
     "alternatives": [
       {"name", "comparison" (100+ words), "when_to_choose"}
     ],
     "reviews": {
       "average_rating", "total_reviews",
       "rating_breakdown": {"5": %, "4": %, "3": %, "2": %, "1": %},
       "expert_reviews": [{"source", "rating", "summary" (200+ words)}]
     },
     "technical_specs": {
       "platforms", "languages", "api", "security", "compliance"
     },
     "support": {
       "channels", "response_time", "documentation_quality", "community"
     },
     "media": {
       "logo", "screenshots" (10+), "videos", "diagrams"
     }
   }
   ```

3. **Create comprehensive taxonomy archive pages**
   
   **For Category/Type taxonomy pages:**
   - Comprehensive overview of the category (1000+ words)
   - Complete buyer's/selection guide
   - Key features to look for
   - Common use cases and who needs this
   - Price range analysis and what affects cost
   - Industry trends and future outlook
   - Comparison methodology explanation
   - Top 10-20 entries with detailed previews
   - Quick comparison table
   - 20-30 FAQs about this category
   - Related categories and how they differ
   - Expert opinions and industry insights
   - Glossary of category-specific terms
   - Statistics and market data
   - ALL entries in this category listed below with rich cards
   
   **For Location pages:**
   - Complete local market analysis (1000+ words)
   - Local regulations and requirements
   - Average prices in this area vs national
   - Transportation and parking information
   - Neighborhood-by-neighborhood breakdown
   - Local statistics and demographics
   - ALL providers in this location with detailed cards
   - Nearby locations for comparison
   
   **For Combined taxonomy pages:**
   - Everything from both individual taxonomies combined
   - Specific local/niche context 
   - Why this combination matters
   - Unique considerations for this intersection
   - Price analysis for this specific combination
   - Top 10 detailed comparisons with scoring methodology
   - Map visualization (if location-based)
   - Quick filter and sort options
   - ALL matching entries with rich information cards

4. **Collect extensive imagery**
   - Product screenshots (10+ per entry)
   - Logo variations
   - Feature demonstration images
   - Comparison charts and infographics
   - Industry-relevant stock photos from Unsplash
   - Create custom diagrams where needed

### Phase 2: LocalWP Website Development (THIS IS NOT OPTIONAL - YOU MUST BUILD THE WEBSITE)

**DO NOT STOP AFTER RESEARCH. BUILD THE ACTUAL WEBSITE NOW.**

1. **Setup LocalWP Environment**
   - User must install LocalWP from https://localwp.com/
   - Create new site with PHP 8.3 and MySQL 8.0
   - Access site at local domain (e.g., mysite.local)

2. **Build the custom theme with FULL SEO optimization**
   - Create detailed, complex CSS (not simple/short)
   - Modern, clean, modular design
   - Implement all directory pages from JSON data
   - Add comprehensive animations and interactions
   - Ensure responsive design with multiple breakpoints

3. **Generate ALL ranking pages with maximized SEO**
   - Create "Best X in Y" pages for every location/category combination
   - Maximize meta titles (60 chars) for each page
   - Maximize meta descriptions (160 chars) for each page
   - Create unique, comprehensive H1 titles
   - Write detailed, SEO-optimized descriptions for every page
   - Build internal linking structure between related pages

4. **Create 5-7 horizontal template variations**
   - Grid layout with filters
   - Card-based design with hover effects  
   - List view with detailed information
   - Comparison table layout
   - Map-based directory view
   - Featured/spotlight layout
   - Masonry/Pinterest style layout

5. **Build mega header navigation**
   - Multi-level dropdown menus
   - Search functionality
   - Category quick links
   - Location selector
   - Sticky header on scroll
   - Mobile-optimized hamburger menu

6. **Implement review system (not basic comments)**
   - Custom review form for each directory entry
   - Frame as "Leave a Review" for product/service
   - Star rating system
   - Review categories (quality, service, value, etc.)
   - Review moderation queue
   - Display average ratings
   - Sort reviews by helpful/recent/rating

7. **Add contact form**
   - Professional contact form with validation
   - Multiple contact reasons dropdown
   - File upload capability
   - Anti-spam measures
   - Email notification system

8. **Import directory data from JSON**
   - Create custom post types for directory entries
   - Use LocalWP's WP-CLI to import data
   - Set up taxonomy/category structure
   - Generate all location/category pages automatically

9. **Test thoroughly in LocalWP**
   - Check all pages and permalinks
   - Verify images load correctly
   - Test responsive design
   - Validate all SEO elements
   - Test review submission
   - Test contact form

### Phase 2.5: MANDATORY Link Verification - CHECK EVERY SINGLE LINK

**⛔ STOP! DO NOT SKIP THIS! YOU MUST CHECK EVERY SINGLE LINK!**

**THE WEBSITE IS NOT COMPLETE UNTIL EVERY SINGLE LINK WORKS**

1. **MANDATORY: Test EVERY Header Link**
   - Extract ALL href attributes from the header navigation
   - Visit EACH link one by one in browser
   - Verify EACH loads without 404
   - If ANY link returns 404, FIX IT IMMEDIATELY

2. **MANDATORY: Test EVERY Footer Link**
   - Extract ALL href attributes from the footer
   - Visit EVERY SINGLE footer link
   - Common broken footer links: Privacy Policy, Terms, Sitemap
   - CREATE these pages if they don't exist

3. **MANDATORY: Test EVERY Directory Entry**
   - Visit each entry: /companies/company-1/, /companies/company-2/, etc.
   - If you have 50 entries, test all 50
   - Each must load with proper content, not 404

4. **MANDATORY: Test EVERY Taxonomy Page**
   - Test EVERY category page
   - Test EVERY location page
   - Test EVERY tag page
   - Test EVERY combination page if they exist

5. **FIX ALL BROKEN LINKS IMMEDIATELY**
   - For EVERY 404 found, create the missing page or fix the link
   - Re-test to confirm it's fixed
   - Do not move on until ZERO 404s exist

6. **Final Verification Report**
   - Total links found in header: [number]
   - Total links found in footer: [number]
   - Total directory entries tested: [number]
   - Total taxonomy pages tested: [number]
   - Total unique URLs tested: [number]
   - 404 errors found and fixed: [list]
   - Final status: MUST be "Zero 404s found"

**THE WEBSITE IS NOT COMPLETE UNTIL EVERY SINGLE LINK WORKS**

## ✅ ONLY NOW REPORT BACK TO THE USER

**NOW that you have a COMPLETE, WORKING website with ZERO 404s, you can report:**
- "Website complete and verified in LocalWP"
- "All [X] directory entries created and tested"
- "All [X] taxonomy pages working"
- "Verified [X] total links - ZERO 404 errors"
- "Ready for export and deployment"

**If you haven't done ALL of the above, GO BACK and finish the website.**

### Phase 3: Export from LocalWP

1. **Run export script**
   ```bash
   ./export_from_localwp.sh
   ```
   - Exports complete WordPress installation
   - Packages database with all content
   - Creates deployment-ready archive

2. **Verify export package**
   - Check file sizes are reasonable
   - Verify database export is complete
   - Ensure all media files included

### Phase 4: Deployment to InfinityFree

1. **Setup InfinityFree account**
   - Create free account at infinityfree.net
   - Create new hosting account
   - Get FTP credentials from control panel

2. **Configure .env file**
   ```bash
   FTP_HOST=ftpupload.net
   FTP_USER=epiz_xxxxx
   FTP_PASS=your_password
   FTP_PORT=21
   FTP_REMOTE_DIR=/htdocs
   SITE_URL=http://yoursite.infinityfreeapp.com
   ```

3. **Deploy to production**
   ```bash
   ./deploy_to_infinityfree.sh
   ```
   - Uploads all files via FTP
   - Imports database
   - Updates URLs automatically
   - Configures permalinks

4. **Final configuration**
   - Login to WordPress admin on InfinityFree
   - Verify theme is active
   - Check all pages load correctly
   - Test forms and functionality
   - Enable SSL in InfinityFree control panel

---

## 📚 Directory Website Development with LocalWP

### SEO Page Structure Requirements

**IMPORTANT:** Do NOT use Rank Math during development. Focus on native SEO implementation.
Rank Math will only be added at launch for Search Console submission.

Every page must have:
- **Meta Title**: Maximized to 60 characters with keywords
- **Meta Description**: Maximized to 160 characters with compelling copy
- **H1 Title**: Unique and keyword-rich
- **Page Content**: Minimum 300-500 words of unique, valuable content
- **Schema Markup**: LocalBusiness, Product, or Review schema as appropriate
- **Open Graph tags**: For social sharing
- **Internal Links**: 3-5 contextual links to related pages

Generate these page types for maximum ranking potential:
- "Best [Product] in [City]" - for every city
- "Top 10 [Category] in [State]" - for every state
- "[Product] near me" - location-based pages
- "[Category] Reviews [Year]" - fresh content pages
- "Compare [Product A] vs [Product B]" - comparison pages
- "[Product] for [Use Case]" - intent-based pages
- "Cheap/Affordable [Product] in [Location]" - price-focused pages

### Review System Framework

Frame reviews contextually based on the directory type:
- For restaurants: "[Cuisine] lovers who dined at [Restaurant] can leave a review"
- For products: "[Product] users who tried [Brand] can share their experience"
- For services: "Customers who used [Service] from [Company] can rate their experience"
- For venues: "Visitors who went to [Venue] can share their thoughts"

Review form should include:
- Overall star rating (1-5 stars)
- Category-specific ratings (e.g., Quality, Service, Value, Location)
- Written review with minimum 50 characters
- Photo upload option
- "Would you recommend?" Yes/No
- Verified purchase/visit checkbox
- Helpful/Not Helpful voting on other reviews

### Research Phase with Jina AI

When building directory websites, use Jina AI for comprehensive research:

```bash
# Search for information (use s.jina.ai)
curl "https://s.jina.ai/?q=YOUR_SEARCH_TERM" \
  -H "Authorization: Bearer $JINA_API_KEY"

# Scrape individual pages (use r.jina.ai)
curl "https://r.jina.ai/https://example.com/page" \
  -H "Authorization: Bearer $JINA_API_KEY"
```

**Important Research Guidelines:**
- Create detailed JSON for each directory page
- If a page 404s or doesn't scrape properly, retry the scrape
- DO NOT use Jina to scrape CSS from design sites

### Finding Royalty-Free Images

```bash
# Search for Unsplash images using Jina
curl "https://s.jina.ai/?q=YOUR_IMAGE_DESCRIPTION+unsplash" \
  -H "Authorization: Bearer $JINA_API_KEY"

# Then scrape the found Unsplash pages for non-premium images
curl "https://r.jina.ai/https://unsplash.com/photos/..." \
  -H "Authorization: Bearer $JINA_API_KEY"
```

### Directory Page JSON Format

Each directory entry should have comprehensive data:

```json
{
  "id": "unique-identifier",
  "name": "Company/Service Name",
  "category": "Technology Category",
  "description": "Detailed description...",
  "features": ["feature1", "feature2", "..."],
  "pricing": {
    "model": "subscription/one-time/freemium",
    "tiers": [...]
  },
  "images": {
    "logo": "url-from-unsplash",
    "screenshots": ["url1", "url2"],
    "hero": "hero-image-url"
  },
  "metadata": {
    "founded": "year",
    "headquarters": "location",
    "employees": "range",
    "funding": "amount"
  },
  "links": {
    "website": "url",
    "documentation": "url",
    "pricing": "url"
  },
  "tags": ["tag1", "tag2"],
  "lastUpdated": "timestamp"
}
```

### CSS Development Guidelines

**IMPORTANT:** Create extremely detailed and complex CSS files that are well-thought-out:

- Don't write short, simple CSS - make it comprehensive
- Include detailed animations and transitions
- Add hover states, focus states, and active states
- Create responsive breakpoints for all screen sizes
- Include print styles and accessibility features
- Use CSS custom properties for theming
- Add detailed comments explaining complex sections
- Implement sophisticated grid and flexbox layouts
- Include fallbacks for older browsers

Example of detailed CSS approach:
```css
/* Component: Directory Card
   Purpose: Display individual directory entries
   States: default, hover, active, disabled, loading
   Breakpoints: mobile-first approach with 5 breakpoints
   Accessibility: WCAG 2.1 AA compliant */

.directory-card {
  /* Base styles with extensive properties */
  /* Multiple transition effects */
  /* Complex shadow systems */
  /* Detailed spacing scales */
}
```

## 🚀 LocalWP Quick Start Workflow

When a user has this repository and wants to develop with LocalWP:

```bash
# 1. Install LocalWP from https://localwp.com/

# 2. Create new site in LocalWP
# - Click "+" to add new site
# - Choose site name
# - Select Preferred environment (PHP 8.3, MySQL 8.0)
# - Set username and password

# 3. Navigate to site folder
# Mac: ~/Local Sites/[site-name]/app/public/
# Windows: C:\Users\[username]\Local Sites\[site-name]\app\public\

# 4. Copy wp-content to LocalWP site
cp -r /path/to/this/repo/wp-content/* ./wp-content/

# 5. Copy configuration files
cp /path/to/this/repo/.htaccess .
cp /path/to/this/repo/.env.example .env

# 6. Start site in LocalWP and access via browser

# 7. Activate theme and plugins in WordPress admin

# 8. Start developing!
```

## 📁 Project Structure

```
wordpress-rovo-dev-wizard/
├── .env.example                  # FTP configuration template
├── .htaccess                     # WordPress rewrite rules
├── export_from_localwp.sh        # Export script for LocalWP
├── deploy_to_infinityfree.sh     # FTP deployment script
├── ftp-config.json               # FileZilla configuration
├── localwp-setup-guide.md        # Detailed LocalWP guide
├── ROVO.md                       # This file - Rovo Dev guide
└── wp-content/
    ├── themes/
    │   └── my-custom-theme/      # Custom theme
    └── plugins/
        └── custom-post-types/    # CPT plugin
```

## 🎨 WordPress Development Guide with LocalWP

### Theme Development

Users can modify the custom theme in `wp-content/themes/my-custom-theme/`:

LocalWP provides instant file changes - no cache clearing needed.

### Using LocalWP's WP-CLI

LocalWP includes WP-CLI built-in:

```bash
# Right-click site in LocalWP > Open Site Shell

# Create pages
wp post create --post_type=page --post_title='Home' --post_status=publish
wp post create --post_type=page --post_title='About Us' --post_status=publish
wp post create --post_type=page --post_title='Services' --post_status=publish
wp post create --post_type=page --post_title='Contact' --post_status=publish

# Set static homepage
wp option update page_on_front 2
wp option update show_on_front page
wp option update page_for_posts 5

# Create menu
wp menu create "Main Menu"
wp menu location assign main-menu primary
wp menu item add-post main-menu 2

# Install plugins
wp plugin install contact-form-7 --activate
wp plugin install wordpress-seo --activate

# Update site options
wp option update blogname "My Awesome Site"
wp option update blogdescription "Built with Rovo Dev Wizard"
wp option update timezone_string "America/New_York"

# Set permalinks
wp rewrite structure '/%postname%/'
wp rewrite flush
```

### Custom Post Types

The included plugin creates Portfolio and Testimonial post types. To add more, edit `wp-content/plugins/custom-post-types/custom-post-types.php`.

### Advanced Theme Features

```php
// Add to functions.php

// Custom image sizes
add_theme_support('post-thumbnails');
add_image_size('hero', 1920, 600, true);
add_image_size('team-member', 400, 400, true);

// Widget areas
function my_widgets_init() {
    register_sidebar(array(
        'name' => 'Homepage Widgets',
        'id' => 'homepage-widgets',
        'before_widget' => '<div class="widget">',
        'after_widget' => '</div>',
    ));
}
add_action('widgets_init', 'my_widgets_init');

// Custom logo support
add_theme_support('custom-logo', array(
    'height' => 100,
    'width' => 400,
    'flex-height' => true,
    'flex-width' => true,
));

// Gutenberg support
add_theme_support('align-wide');
add_theme_support('editor-styles');
add_theme_support('wp-block-styles');
```

## 🔧 Troubleshooting Commands

### LocalWP Issues

```bash
# Site not loading
- Check LocalWP logs (right-click site > View Logs)
- Restart site (Stop > Start)
- Check disk space
- Restart LocalWP application

# Database issues
- Open Adminer (right-click site > Database > Open Adminer)
- Check wp_options table for siteurl and home values
- Verify database connection in wp-config.php

# SSL issues
- Enable SSL in LocalWP site settings
- Trust SSL certificate
- Clear browser cache
```

### InfinityFree Issues

```bash
# FTP connection failed
- Verify credentials in InfinityFree control panel
- Check FTP is enabled for your account
- Try FileZilla to test connection manually

# Database import failed
- Check file size limits in InfinityFree
- Split large SQL files
- Use InfinityFree phpMyAdmin to import manually

# Site showing errors
- Check error logs in InfinityFree control panel
- Verify PHP version compatibility
- Check .htaccess file is uploaded
- Verify file permissions (644 files, 755 folders)
```

## 📊 Production Deployment Checklist

Before deploying to InfinityFree:

1. ✅ Test everything in LocalWP
2. ✅ Verify all pages load correctly
3. ✅ Test all forms and functionality
4. ✅ Check responsive design on mobile
5. ✅ Optimize images for web
6. ✅ Update passwords for production
7. ✅ Set WP_DEBUG to false
8. ✅ Export from LocalWP
9. ✅ Configure FTP credentials
10. ✅ Deploy to InfinityFree
11. ✅ Verify deployment successful
12. ✅ Enable SSL in InfinityFree
13. ✅ Test production site thoroughly
14. ✅ Setup backups

## 🎯 Complete Workflow Summary

1. **Install LocalWP** → Download and install
2. **Create site** → New site in LocalWP
3. **Clone repo** → Copy theme and plugins
4. **Develop** → Build complete website
5. **Test** → Verify everything works
6. **Export** → Package for deployment
7. **Configure** → Setup FTP credentials
8. **Deploy** → Upload to InfinityFree
9. **Verify** → Check production site
10. **Live** → Free production WordPress site!

## 💡 Key Features This Provides

- **LocalWP development** - Fast, modern local environment
- **Zero DevOps knowledge** - Just LocalWP + FTP
- **Free hosting forever** - InfinityFree free plan
- **Complete WordPress control** - Full admin access
- **No hosting costs** - Perfect for testing
- **Easy deployment** - One-command FTP
- **No credit card needed** - Completely free
- **Version controlled** - Everything in Git
- **Instant updates** - LocalWP live reload
- **Professional workflow** - Local → Production

## 🚨 Important Notes

- Always test in LocalWP before deploying
- Keep backups via LocalWP's backup feature
- Use strong passwords in production
- Update WordPress, themes, plugins regularly
- InfinityFree has limitations - review their terms
- Free hosting may show ads
- No email sending on free plan - use SMTP plugin

## 🔄 Updating Production Site

To update your InfinityFree site after local changes:

```bash
# Make changes in LocalWP
# Test everything locally

# Re-export and deploy
./export_from_localwp.sh
./deploy_to_infinityfree.sh

# Your InfinityFree site is now updated
```

This is a complete local-to-production WordPress development and deployment pipeline using Rovo Dev AI, LocalWP, and free hosting!
