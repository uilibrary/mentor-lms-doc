# SMTP Settings

Configuring SMTP (Simple Mail Transfer Protocol) settings is essential for your Mentor LMS to send transactional emails such as registration confirmations, password resets, course enrollment notifications, and more.

## Accessing SMTP Settings

1. Log in to your admin dashboard
2. Navigate to **Settings** in the sidebar menu
3. Select **Email Settings** from the dropdown options

![SMTP Settings](/configuration/settings-smtp.png)

## SMTP Configuration Options

The Email Settings page allows you to configure the following options:

<!-- ### Mail Driver

Select the method for sending emails:

- **SMTP**: Recommended for most installations (requires SMTP server details)
- **PHP Mail**: Uses the server's built-in mail function (less reliable, not recommended for production)
- **Sendmail**: Uses the server's sendmail program (if available) -->

### SMTP Server Details

If you select SMTP as your mail driver, you'll need to provide:

- **SMTP Host**: Your mail server hostname (e.g., `smtp.gmail.com`, `smtp.mailgun.org`)
- **SMTP Port**: The port for your mail server (typically 587 for TLS, 465 for SSL)
- **SMTP Security**: Choose between `tls`, `ssl`, or `none` (TLS recommended)
- **SMTP Username**: Your email account username
- **SMTP Password**: Your email account password or app-specific password

### From Address Settings

Configure the sender details for system emails:

- **From Email Address**: The email address that appears as the sender
- **From Name**: The name that appears as the sender

### Test Configuration

After entering your SMTP details:

1. Click the **Send Test Email** button
2. Enter a recipient email address for the test
3. Click **Send Test**
4. Check the recipient inbox to verify receipt

## Common SMTP Providers

### Gmail SMTP

```
SMTP Host: smtp.gmail.com
SMTP Port: 587
SMTP Security: tls
SMTP Username: your.email@gmail.com
SMTP Password: your-app-password (NOT your regular Gmail password)
```

::: warning IMPORTANT: App Password Required
You MUST use an App Password for Gmail SMTP. Your regular Gmail password will NOT work and will result in authentication errors like:

"Failed to authenticate on SMTP server with username... using the following authentications: LOGIN, PLAIN, XOAUTH2..."
:::

#### Creating a Gmail App Password

1. Go to your [Google Account Security settings](https://myaccount.google.com/security)
2. Make sure 2-Step Verification is enabled on your Google Account
3. Directly visit the [Google App passwords page](https://myaccount.google.com/apppasswords)
4. Select "Mail" as the app and "Other" as the device (name it "Mentor LMS or Your App Name")
5. Click "Generate"
6. Use the 16-character password that appears (no spaces) as your SMTP password
7. Click "Done"

::: tip Troubleshooting Gmail SMTP
If you receive authentication errors even with an App Password:

- Make sure 2-Step Verification is actually enabled
- Try generating a new App Password
- Ensure you're copying the full App Password with no extra spaces
- Check if your Google account has any security restrictions
:::
<!-- rmcopuoewphuvbta -->

### Shared Hosting Server SMTP

Many shared hosting providers offer SMTP services that you can use with your domain. This is often the simplest option if you're already hosting your website with a provider.

```
SMTP Host: mail.yourdomain.com (or your host's mail server address)
SMTP Port: 587 (or 465 if using SSL)
SMTP Security: tls (or ssl depending on your server)
SMTP Username: typically your email address (e.g., admin@yourdomain.com)
SMTP Password: Your email account password
```

#### Finding Your Shared Hosting SMTP Credentials

1. Log in to your hosting control panel (cPanel, Plesk, DirectAdmin, etc.)
2. Look for "Email Accounts" or "Email" section
3. Create a new email account or select an existing one
4. Look for "Email Configuration" or "Configure Email Client"
5. Find the SMTP settings section (sometimes called "Outgoing Server")
6. Note down the following information:
   - SMTP Server/Host
   - SMTP Port
   - Security/Encryption type (TLS/SSL)
   - Username (usually full email address)
   - Password

::: tip Provider-Specific Instructions

- **cPanel**: Go to Email Accounts → More → Configure Email Client
- **Plesk**: Go to Mail → Email Addresses → select account → Mail Client settings
- **DirectAdmin**: Go to Email Accounts → select account → View Info/Settings
- **Hostinger**: Go to Email → Email Accounts → Details → Manual Configuration
- **GoDaddy**: Go to Email → Manage → Settings → Information → View (under POP/IMAP/SMTP)
  :::

::: warning Important Notes

- Some hosts have sending limits per hour/day
- Make sure to use the correct port and security settings
- Some hosts may require specific authentication methods
- If possible, create a dedicated email account just for your LMS
  :::

### Amazon SES

```
SMTP Host: email-smtp.us-east-1.amazonaws.com (replace with your region)
SMTP Port: 587
SMTP Security: tls
SMTP Username: Your SES SMTP username
SMTP Password: Your SES SMTP password
```

### Mailgun

```
SMTP Host: smtp.mailgun.org
SMTP Port: 587
SMTP Security: tls
SMTP Username: Your Mailgun SMTP username (typically postmaster@yourdomain)
SMTP Password: Your Mailgun SMTP password
```

### SendGrid

```
SMTP Host: smtp.sendgrid.net
SMTP Port: 587
SMTP Security: tls
SMTP Username: apikey
SMTP Password: Your SendGrid API Key
```

## Troubleshooting SMTP Issues

If you experience issues with email delivery:

1. **Check Credentials**: Verify your SMTP username and password are correct
2. **Verify Port Settings**: Ensure your server allows connections on the specified port
3. **Test with Different Security**: Try changing between TLS and SSL
4. **Check Spam Folder**: Test emails might be flagged as spam
5. **Server Restrictions**: Some hosting providers restrict outgoing SMTP connections
6. **Rate Limits**: Be aware of sending limits imposed by your SMTP provider
7. **Email Logs**: Check your server's mail logs for specific error messages

<!-- ## Email Templates

After configuring SMTP, you can customize the system email templates:

1. Navigate to **Settings** > **Email Templates**
2. Select a template to edit (registration, password reset, course enrollment, etc.)
3. Modify the subject line and content as needed
4. Use the available placeholders to include dynamic content
5. Save your changes -->

## Best Practices for Email Configuration

- **Use a Dedicated Email**: Create a specific email address for system notifications
- **Professional Domain**: Ideally, use an email with your site's domain name
- **Transactional Email Service**: For high-volume sites, use a dedicated service like Mailgun, SendGrid, or Amazon SES
- **Email Warm-up**: Gradually increase email volume to improve deliverability
- **SPF and DKIM**: Configure these email authentication methods to improve deliverability
- **Regular Testing**: Periodically verify your email system is functioning correctly

After configuring your email settings, proceed to [Google Authentication Setup](/configuration/google-auth) to enable social login for your users.
