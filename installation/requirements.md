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

- **BCMath PHP Extension** - For arbitrary precision mathematics
- **Ctype PHP Extension** - For character type checking
- **cURL PHP Extension** - For handling URL requests
- **DOM PHP Extension** - For handling XML and HTML documents
- **Fileinfo PHP Extension** - For file type detection
- **JSON PHP Extension** - For JSON handling
- **Mbstring PHP Extension** - For handling UTF-8 strings
- **OpenSSL PHP Extension** - For secure connections and encryption
- **PCRE PHP Extension** - For regular expression support
- **PDO PHP Extension** - For database connections
- **Tokenizer PHP Extension** - For processing PHP code
- **XML PHP Extension** - For XML processing
- **symlink() function** - For public access of storage files

::: warning Important
**symlink() function** - Required for creating secure file storage links and managing public file access. Enable it from `disable_functions = ""` of your php settings section or contact with your hosting provider.
:::

## Server Configuration

### PHP Settings

Recommended PHP configuration for handling large video uploads:

- `memory_limit`: 512MB (minimum)
- `upload_max_filesize`: 512MB (recommended)
- `post_max_size`: 512MB (recommended)
- `max_execution_time`: 600 (recommended)
- `max_input_time`: 600 (recommended)
- `upload_tmp_dir`: Path to a directory with sufficient space
- `file_uploads`: On

Once you've confirmed your server meets these requirements, you're ready to [proceed with installation](/installation/purchase-extract).
