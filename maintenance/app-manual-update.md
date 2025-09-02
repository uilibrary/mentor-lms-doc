# Version Update Guide

This guide will help you update your existing Mentor LMS installation to the latest version on your hosting servers.

::: tip
Always perform updates during low-traffic periods and ensure you have sufficient disk space for both backup and new files.
:::

### Step 1: Download Latest Version from CodeCanyon

1. Log in to your **CodeCanyon account**
2. Find **Mentor LMS** in your purchased items
3. Click the **Download** button to get the latest version
4. Save the downloaded ZIP file to your local computer

### Step 2: Access Your Server

Log in to your hosting control panel (cPanel) and open **File Manager**. Navigate to your domain's root directory (usually `public_html`).

### Step 3: Create Backup of Current Version

::: tip Critical Step
Before making any changes, create a complete backup of your current installation.
:::

**Using cPanel File Manager:**

1. Navigate to your Mentor LMS directory
2. Select all files and folders (Ctrl+A)
3. Click **Compress** from the toolbar
4. Choose **ZIP Archive** as compression type
5. Name the backup: `mentor-lms-backup-2024-01-15.zip`
6. Download the backup file to your computer

### Step 4: Upload Latest Version

1. In **cPanel File Manager**, navigate to your Mentor LMS installation directory
2. Click the **Upload** button
3. Select the ZIP file you downloaded from CodeCanyon
4. Wait for upload to complete
5. Verify the ZIP file appears in your file listing

### Step 5: Extract and Replace Files

::: tip Warning
This step will overwrite your current installation files. Ensure your backup is complete before proceeding.
:::

1. **Right-click** on the uploaded ZIP file
2. Select **Extract** from the context menu
3. Choose to extract to current directory
4. Check **"Overwrite Files"** if available
5. Wait for extraction to complete
6. Delete the ZIP file after successful extraction

## Post-Update Steps

### Verify Installation

1. Visit your website to ensure it loads properly
2. Log in to admin dashboard
3. Test key features (course access, user registration)

### Clear Cache

Visit your website and refresh a few times - Laravel will automatically clear outdated caches.

### Check File Uploads

Test uploading course images or videos. If uploads fail, contact hosting support to recreate storage symlinks.

## Troubleshooting

### Common Issues

- **White screen/Error 500**: Check file permissions in cPanel (644 for files, 755 for directories)
- **Database errors**: Verify `.env` file contains correct database credentials
- **Upload issues**: Contact hosting support for storage symlink assistance

### Rollback Process

If issues occur:

1. Delete all current files in your installation directory
2. Upload your backup ZIP file
3. Extract the backup to restore previous version
4. Contact support if needed

::: tip
For detailed troubleshooting, visit our [Common Problems Guide](/troubleshooting/common-problems).
:::

## Next Steps

Once the update is complete and tested, you can proceed with [configuring any new features](/configuration/system-info) that may have been added in the latest version.
