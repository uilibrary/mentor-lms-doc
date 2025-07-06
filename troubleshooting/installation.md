# Installation Issues on Shared Hosting

This page addresses common issues encountered during the installation of Mentor LMS on shared hosting environments and provides solutions to help you successfully complete the setup process.

## Pre-Installation Issues

### Server Requirements Not Met

**Problem**: The web installer indicates that your shared hosting server does not meet the minimum requirements.

**Solutions**:

- **PHP Version**: Ensure your hosting plan supports PHP 8.2 or higher
  - Check your hosting control panel (cPanel, Plesk, etc.) for PHP version manager
  - Select PHP 8.2 or higher as the active version for your domain
  - If not available, contact your hosting provider to upgrade

- **PHP Extensions**: Enable required PHP extensions through your hosting control panel
  - In cPanel: Go to "Select PHP Version" or "MultiPHP Manager"
  - Check boxes for required extensions: BCMath, Ctype, JSON, Mbstring, OpenSSL, PDO, Tokenizer, XML, Fileinfo, Curl
  - Save changes and wait a few minutes for them to take effect

- **File Permissions**: Set proper permissions using File Manager in your control panel
  - Navigate to your Mentor LMS installation directory
  - Select folders and choose "Change Permissions" (chmod)
  - Set directories to 755 and files to 644
  - Set storage and bootstrap/cache directories to 775

### Unable to Access the Installer

**Problem**: You cannot access the web installer at `yourdomain.com/install`

**Solutions**:

- Ensure you've uploaded the files to the correct directory (public_html or www)
- If using a subdomain or addon domain, verify it points to the correct directory
- Check if your hosting uses a different root directory structure
  - Some hosts require placing files in a subdirectory like public_html/public
  - You may need to move index.php and .htaccess to the parent directory
- Verify .htaccess is properly uploaded and not corrupted
  - Recreate the .htaccess file if necessary
- Enable "Force HTTPS" in your hosting control panel if available

## Database Connection Issues

### Cannot Connect to Database

**Problem**: The installer cannot connect to your database during setup.

**Solutions**:

- Create a database using your hosting control panel:
  - In cPanel: Access "MySQL Databases" or "Database Wizard"
  - Create a new database and database user
  - Assign all privileges to the user for this database

- Check database connection details:
  - Hostname is usually "localhost" on shared hosting
  - Some hosts use a specific database prefix in the name
  - Verify username, password, and database name are entered correctly
  
- Database connection limits:
  - Some shared hosts limit concurrent database connections
  - Contact your host if you receive "too many connections" errors

### Migration Failed

**Problem**: Database migrations fail during installation.

**Solutions**:

- Check database user privileges in your hosting control panel
  - Ensure the user has ALL PRIVILEGES on the database
- Verify MySQL/MariaDB version in your hosting control panel
  - Mentor LMS requires MySQL 5.7+ or MariaDB 10.3+
- Some hosts have maximum execution time limits
  - Create a custom php.ini file in your root directory with:
    ```
    max_execution_time = 300
    memory_limit = 256M
    ```

## License Verification Issues

### Purchase Code Not Accepted

**Problem**: The installer rejects your purchase code.

**Solutions**:

- Verify you're entering the exact code from your purchase receipt
- Some shared hosts block outgoing connections to verification servers
  - Ask your host to whitelist the license verification domain
- If using a temporary URL or IP during installation, the license might be rejected
  - Wait until your domain is properly pointed to your hosting

## Post-Installation Access Issues

### 500 Server Error After Installation

**Problem**: You see a 500 error when trying to access the site after installation.

**Solutions**:

- Check error logs in your hosting control panel
  - In cPanel: Look for "Error Log" in the "Metrics" section
  - Look for specific PHP or server errors
- Verify .env file was created properly during installation
  - If missing, create it manually by renaming .env.example
  - Configure database credentials in the file
- Create a custom php.ini file with increased limits:
  ```
  memory_limit = 256M
  upload_max_filesize = 64M
  post_max_size = 64M
  max_execution_time = 300
  ```

### White Screen After Installation

**Problem**: You see a blank white screen with no error messages.

**Solutions**:

- Enable error display temporarily by creating/editing .htaccess in root directory:
  ```
  php_flag display_errors on
  php_value error_reporting E_ALL
  ```
- Check hosting control panel for PHP settings
  - Increase memory_limit, max_execution_time, and upload limits
- Look for error logs in your hosting control panel
- Clear browser cache or try a different browser

## Storage Directory Issues

### File Upload Problems

**Problem**: Unable to upload images or files after installation.

**Solutions**:

- Create symbolic link manually if automatic linking failed
  - Some shared hosts don't allow the `php artisan storage:link` command
  - Create or upload your files directly to the appropriate directories
  - Ask hosting support to create the symbolic link for you
- Set proper permissions for storage directory through File Manager
  - storage/app/public should be writeable (775)
- In some cases, you may need to configure the storage path in .env:
  ```
  FILESYSTEM_DRIVER=public
  ```

## Common Error Codes on Shared Hosting

### Error 500

**Problem**: Internal server error during installation.

**Solutions**:

- Check hosting error logs for specific messages
- Verify PHP version compatibility
- Look for memory limit issues
- Check if mod_rewrite is enabled in your hosting

### Error 404

**Problem**: Installer page not found.

**Solutions**:

- Verify document root configuration
- Check if your host requires index.php in URLs
- May need to modify .htaccess for specific hosting environment

### Error 403

**Problem**: Forbidden access to installer.

**Solutions**:

- Check file permissions (should be 644 for files, 755 for directories)
- Some hosts have security modules (like mod_security) that may block access
  - Contact hosting support to check security rules

## Shared Hosting Optimizations

After successful installation, optimize your LMS for shared hosting:

1. **Caching**: Enable and configure caching in the admin panel
2. **Image Optimization**: Use compressed images for course content
3. **Database Cleanup**: Regularly clean logs and temporary data
4. **CDN Integration**: Consider using a CDN for assets if your site grows

## Contact Support

If you've tried the solutions above and are still experiencing issues with your installation, please contact support:

1. Prepare the following information:

   - Your hosting provider name
   - Control panel type (cPanel, Plesk, etc.)
   - PHP and MySQL versions from your hosting panel
   - Specific error messages from hosting logs
   - Screenshots of any error screens

2. Contact support through your purchase platform or via email

For common post-installation configuration issues specific to shared hosting, please refer to our [Common Problems](/troubleshooting/common-problems) page.
