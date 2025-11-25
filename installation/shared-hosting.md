# Shared Hosting Installation

This guide will help you install Mentor LMS on a shared hosting server (cPanel, Plesk, or similar hosting environments).

## Server Requirements

### PHP Version

- **PHP >= 8.2** (PHP 8.3 recommended for best performance)

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

## Installation Steps

### Step 1: Create Database

1. Log in to your **cPanel** or hosting control panel
2. Navigate to **MySQL Databases** section
3. Create a new database and collect the credentials.
   - Database name: `your_database_name`
   - Database username: `your_database_username`
   - Database password: `your_database_password`

### Step 2: Upload Files

1. Log in to your cPanel
2. Open **File Manager**
3. Navigate to `public_html` directory (or your domain's root directory)
4. Click **Upload** button
5. Upload the Mentor LMS ZIP file
6. Once uploaded, select the ZIP file
7. Click **Extract** to extract all files
8. After extraction, rename `.env.example` file to `.env`

### Step 3: Access Web Installer

1. Open your web browser
2. Navigate to your domain: `https://your-domain.com`
3. You will be automatically redirected to the installation wizard
4. If not redirected, manually visit: `https://your-domain.com/install/step-1`

## Need Help?

If you encounter issues during installation:

1. Check our [Troubleshooting Guide](/troubleshooting/installation)
2. Review [Common Problems](/troubleshooting/common-problems)
3. Contact support at [support@ui-lib.com](mailto:support@ui-lib.com)

::: tip Professional Installation
If you prefer not to install manually, we offer professional installation services. Our team will handle the complete setup for you.
:::
