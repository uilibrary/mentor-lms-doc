# Common Problems on Shared Hosting

This page addresses frequently encountered issues and provides solutions for common problems that may arise when using Mentor LMS on shared hosting environments.

## Login Issues

### Cannot Log In as Admin

**Problem**: Unable to access the admin dashboard after installation on shared hosting.

**Solutions**:

- Verify you're using the correct login credentials
- Check if your email address is properly entered (case sensitive)
- Reset your password using the "Forgot Password" link
- Clear browser cache and cookies, then try again
- Check if cookies are being properly set:
  - Some shared hosts have issues with session handling
  - Add these lines to your .htaccess file if sessions are problematic:
    ```
    php_value session.cookie_secure On
    php_value session.cookie_httponly On
    ```
- Try accessing the site using a different browser
- Check if your hosting has session limitations

### User Login Failures

**Problem**: Students or instructors cannot log in to their accounts.

**Solutions**:

- Verify account activation status
- Check if the user has verified their email (if verification is enabled)
- Many shared hosts limit outgoing emails - check if verification emails are being sent
- Test login using incognito/private browsing mode to rule out cache issues
- Check if your hosting has IP-based security features that might be blocking users

## Course Management Issues

### Cannot Upload Course Videos

**Problem**: Instructors are unable to upload video content on shared hosting.

**Solutions**:

- Check upload limits in your hosting control panel
  - Most shared hosts restrict upload sizes
  - In cPanel, look for "PHP Configuration" or "MultiPHP INI Editor"
  - Modify these values (up to what your host allows):
    ```
    upload_max_filesize = 64M
    post_max_size = 64M
    max_execution_time = 300
    memory_limit = 256M
    ```
- Use video hosting services instead of direct uploads:
  - YouTube, Vimeo, or other video platforms
  - Use the embedding option in the course editor
- Check your hosting disk space quota
  - Shared hosts often have limited storage
  - Consider upgrading your plan if needed

### Course Content Not Displaying

**Problem**: Uploaded course content is not visible to students.

**Solutions**:

- Check file permissions in your hosting file manager
  - Files should be 644
  - Folders should be 755
- Verify symbolic links are working properly
  - Many shared hosts have restrictions on symlinks
  - Contact hosting support if symlinks aren't working
- Clear browser cache or try a different browser
- Check if the course is published and the student is properly enrolled

## Payment Issues

### Payment Gateway Not Working

**Problem**: Students cannot complete course purchases on shared hosting.

**Solutions**:

- Verify SSL is properly configured
  - Most payment gateways require HTTPS
  - In cPanel, look for "SSL/TLS" or contact support to enable it
  - Ensure your domain has a valid SSL certificate
- Check if your hosting allows outbound connections to payment APIs
  - Some budget hosts block certain external connections
- Verify payment gateway credentials in the admin settings
- Test with sandbox/test mode first
- Some shared hosts block certain ports - contact support if API calls fail

### Instructor Payouts Failing

**Problem**: Automated instructor payouts are not processing.

**Solutions**:

- Many shared hosts don't support cron jobs directly
  - Set up external cron service like Cron-Job.org or EasyCron
  - Point the cron to your scheduled command URL
- Check payout logs in your admin dashboard
- Verify payout account details are correct
- Ensure minimum payout thresholds have been met

## Email Notification Issues

### System Emails Not Sending

**Problem**: Automated emails for registration, course enrollment, etc. are not being delivered.

**Solutions**:

- Shared hosts often block or limit PHP mail function
  - Configure SMTP using your hosting provider's mail server
  - In cPanel, look for "Email Accounts" to find your SMTP details
  - Use these settings in your LMS SMTP configuration
- Use an external email service like Mailgun, SendGrid, or Amazon SES
  - These services have better deliverability than shared hosting mail
- Check if your host is blacklisted
  - Use MXToolbox.com to check your domain/IP reputation
- Ensure your email templates have proper formatting

### Email Delays

**Problem**: System emails are significantly delayed on shared hosting.

**Solutions**:

- Shared hosts often queue emails, causing delays
  - Switch to a dedicated email service like Mailgun or SendGrid
- Check hosting control panel for email queue settings
- Some hosts throttle outgoing emails to prevent spam
  - Contact support to ask about email sending limitations
- Reduce the size of emails by optimizing images and content

## Performance Issues

### Slow Dashboard Loading

**Problem**: Admin or instructor dashboards load very slowly on shared hosting.

**Solutions**:

- Enable caching in the LMS admin settings
- Optimize database by cleaning old logs and sessions
- Shared hosts often limit CPU and memory resources
  - Schedule resource-intensive tasks during off-peak hours
- Use a browser caching plugin or add these to .htaccess:
  ```
  <IfModule mod_expires.c>
    ExpiresActive On
    ExpiresByType image/jpg "access plus 1 year"
    ExpiresByType image/jpeg "access plus 1 year"
    ExpiresByType image/png "access plus 1 year"
    ExpiresByType text/css "access plus 1 month"
    ExpiresByType application/javascript "access plus 1 month"
  </IfModule>
  ```
- Consider upgrading to a VPS or dedicated hosting if your site grows

### Site Timeout on High Traffic

**Problem**: Site becomes unresponsive during peak usage on shared hosting.

**Solutions**:

- Implement a CDN like Cloudflare (free plan works well)
  - This reduces load on your shared hosting server
- Optimize images before uploading
  - Use tools like TinyPNG or ImageOptim
- Reduce plugin usage to minimum necessary
- In cPanel, enable "Optimize Website" if available
- Most shared hosts have traffic limits
  - Monitor your traffic and consider upgrading if necessary

## File Storage Issues

### Storage Links Not Working

**Problem**: Uploaded files cannot be accessed on shared hosting.

**Solutions**:

- Many shared hosts restrict the `php artisan storage:link` command
  - Create symbolic links manually via File Manager if possible
  - Contact hosting support to assist with creating symlinks
- Use relative paths in your configuration
  - Some hosts have unique directory structures
- Check file permissions (644 for files, 755 for directories)
- Ensure your .htaccess doesn't block access to the storage directory

### External Storage Integration

**Problem**: Having issues with external storage on shared hosting.

**Solutions**:

- Configure Amazon S3 or other cloud storage
  - Reduces dependency on shared hosting storage limits
  - Updates these values in your .env file:
    ```
    FILESYSTEM_DRIVER=s3
    AWS_ACCESS_KEY_ID=your-key
    AWS_SECRET_ACCESS_KEY=your-secret
    AWS_DEFAULT_REGION=your-region
    AWS_BUCKET=your-bucket
    ```
- Some shared hosts block outgoing connections to cloud services
  - Contact your host to whitelist the necessary domains
- Ensure bucket permissions allow public access to course files

## Cron Job Issues

### Scheduled Tasks Not Running

**Problem**: Automated tasks like notifications are not triggering.

**Solutions**:

- Most shared hosting providers support cron jobs through the control panel
  - In cPanel, look for "Cron Jobs" and add the following:
    ```
    * * * * * php /home/username/public_html/path-to-your-site/artisan schedule:run >> /dev/null 2>&1
    ```
- If direct command execution is restricted:
  - Create a cron job that calls a URL instead
  - Create a file called cron.php in your public directory:
    ```php
    <?php
    system('cd .. && php artisan schedule:run');
    ```
  - Set the cron to call this file via URL
- Use external cron services like Cron-Job.org or EasyCron

## Maintenance and Updates

### Update Process Fails

**Problem**: Unable to successfully update to a new version on shared hosting.

**Solutions**:

- Backup everything before updating
  - Use your hosting control panel backup tools
  - Download a complete site backup
- Most shared hosts limit PHP execution time
  - Break the update process into smaller steps
  - Contact hosting support for temporary limit increases
- Update during low-traffic periods
- If automatic updates fail:
  - Download the new version and update files manually
  - Update database schema using provided SQL scripts

### Backup and Restore Issues

**Problem**: Unable to create or restore backups on shared hosting.

**Solutions**:

- Use your hosting control panel's backup tools
  - cPanel, Plesk, and other panels have built-in backup features
- Break backups into smaller parts if hitting size limits
  - Backup database separately from files
- Export database through phpMyAdmin (available in most control panels)
- For restore operations that exceed hosting limits:
  - Contact hosting support for assistance
  - They can often help with large restore operations

## Getting Help with Shared Hosting Issues

If you're experiencing an issue not covered in this guide:

1. **Check Hosting Logs**: Most control panels provide access to error logs
   - In cPanel, look under "Metrics" > "Error Log"
   - In Plesk, check "Websites & Domains" > "Logs"

2. **Contact Hosting Support**: Shared hosting providers usually offer support for:
   - PHP configuration issues
   - Database connection problems
   - File permission errors
   - SSL certificate setup

3. **Provide Specific Information** when contacting support:
   - Your domain name
   - Exact error messages
   - Steps to reproduce the issue
   - Screenshots of the problem

Remember that shared hosting environments have limitations by design. If your LMS grows significantly in traffic or content, consider upgrading to VPS or dedicated hosting for better performance and fewer restrictions.
