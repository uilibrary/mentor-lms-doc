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

::: tip Professional Installation
If you are not able to install using the web installer, you can follow the manual installation processes.
:::

### Step 4(Optional): Manual Installation

Follow these steps to complete the installation manually:

#### Edit the `.env` file

1. Edit the `.env` file and update the following database credentials:
   ```env
   DB_DATABASE=your_database_name
   DB_USERNAME=your_database_username
   DB_PASSWORD=your_database_password
   ```
2. Save the changes

#### Create the installed flag

1. In your File Manager, navigate to the `storage/app/public` directory
2. Create a new file named `installed` (no extension need)
3. Leave this file empty, it just needs to exist

#### Import the database manually

1. In your cPanel, open **phpMyAdmin**
2. Select your database from the left sidebar
3. Click on the **Import** tab
4. Click **Choose file** and select the `mentor-lms.sql` file from your project
   <!-- - **Download the database file**: [mentor-lms.sql](https://demo.mentor-lms.com/mentor-lms.sql) -->
   - **Download the database file**: [database.zip](https://github.com/uilibrary/mentor-lms-doc/raw/main/public/database.zip)
5. Click **Go** to import the database

#### Temporary Admin Login

After completing all the manual processes, you can log in using the default admin credentials:

- Email: `admin@example.com`
- Password: `12345678`

::: warning Security Note
These are default credentials and should be changed immediately after your first login for security reasons.
:::

<!-- Once logged in, please change these credentials immediately from the admin dashboard for security reasons. -->

#### Visit your domain

1. Open your web browser
2. Navigate to your domain: `https://your-domain.com`
3. The application should now be accessible and ready to use

## Need Help?

If you encounter issues during installation:

1. Check our [Troubleshooting Guide](/troubleshooting/installation)
2. Review [Common Problems](/troubleshooting/common-problems)
3. Contact support at [support@ui-lib.com](mailto:support@ui-lib.com)
