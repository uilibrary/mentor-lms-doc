# System Requirements

Before installing Mentor LMS, ensure your server meets the following requirements for optimal performance and functionality.

## Server Requirements

### PHP Version

- **PHP >= 8.2** (PHP 8.3 recommended for best performance)

<!-- ### Web Server

- Apache (with mod_rewrite enabled) or Nginx
- HTTPS support recommended for production environments

### Database

- MySQL 5.7+ or MariaDB 10.3+
- Minimum 100MB database space (recommended: 1GB+ for growth) -->

## PHP Extensions

The following PHP extensions must be enabled on your server:

- **OpenSSL PHP Extension** - For secure connections and encryption
- **GD PHP Extension** - For image processing
- **fileinfo PHP Extension** - For file type detection
- **PDO PHP Extension** - For database connections
- **Mbstring PHP Extension** - For UTF-8 string handling
- **Curl PHP Extension** - For API integrations
- **Tokenizer PHP Extension** - For processing PHP code
- **XML PHP Extension** - For XML processing
- **CTYPE PHP Extension** - For character type checking
- **JSON PHP Extension** - For JSON handling
- **BCmath PHP Extension** - For arbitrary precision mathematics

## Server Configuration

### Permissions

The following directories need write permissions:

- `/storage`
- `/bootstrap/cache`
- `/public`

### PHP Settings

Recommended PHP configuration for handling large video uploads:

- `memory_limit`: 512MB (minimum)
- `upload_max_filesize`: 512MB (recommended)
- `post_max_size`: 512MB (recommended)
- `max_execution_time`: 600 (recommended)
- `max_input_time`: 600 (recommended)
- `upload_tmp_dir`: Path to a directory with sufficient space
- `file_uploads`: On

<!-- ## Hardware Recommendations

For optimal performance, especially with higher traffic:

- **CPU**: 2+ cores (4+ recommended for production)
- **RAM**: 2GB minimum (4GB+ recommended)
- **Storage**: 10GB minimum (SSD recommended for better performance)
- **Bandwidth**: Depends on expected traffic and content size

## Browser Support

Mentor LMS admin interface and frontend work best with:

- Chrome (latest 2 versions)
- Firefox (latest 2 versions)
- Safari (latest 2 versions)
- Edge (latest 2 versions) -->

## Pre-Installation Checklist

Before proceeding with installation, verify you have:

- [ ] PHP 8.2 or higher
- [ ] All required PHP extensions
- [ ] MySQL/MariaDB database created
- [ ] Database credentials ready
- [ ] Web server configured with proper permissions
- [ ] SMTP server details (for email functionality)
- [ ] Payment gateway API credentials (if using payment features)

Once you've confirmed your server meets these requirements, you're ready to [proceed with installation](/installation/purchase-extract).
