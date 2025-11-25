# App Maintenance

The App Maintenance panel allows you to update, backup, and restore your Mentor LMS application safely and automatically.

## Accessing App Maintenance

1. Log in to your admin dashboard
2. Navigate to **Maintenance** in the sidebar menu
3. Select **App Maintenance**

![App Maintenance](/system-maintenance.png)

::: tip Admin Verification
The maintenance panel is only accessible to verified administrators to ensure system security.
:::

## Current Version

The top-right corner displays your current application version (e.g., **Current Version: 2.3.0**). Always check this before performing updates.

---

## Application Update

Upload and install the latest version of your application to access new features and security improvements.

### Important Update Guidelines

Before updating your application, please follow these critical steps:

#### Pre-Update Requirements

1. **Refresh Server**: Every time you refresh the server before updating, click the **`Refresh Server`** button located the left side of **`Update Application`** button
2. **Backup First**: Always create a backup before updating (see Application Backup section below)
<!-- 3. **Update**: Upload the latest version ZIP file, the update process will start automatically.
3. **Browser**: Update process may take several minutes. Do not refresh or close browser during update.
4. **Seeder**: Run seeder after updating the application version -->

#### Update Process

1. Click the **`Update Application`** button (black button with download icon)
2. Select the latest version ZIP file, the update process will start automatically.
3. Update process may take several minutes. Do not refresh or close browser during update.
<!-- 4. After successful update, click the **`Run Version Seeder`** button (red button) -->

#### Post-Update: Version Seeder

After updating your application, you **must run the version seeder** to ensure all necessary default data and configurations are properly refreshed. In this case you have to follow bellow steps.

- Click the **`Run Version Seeder`** button only **once** after each version update
- The seeder button is located at the right side of the **`Update Application`** button
- The button displays the current version number (e.g., "Run 2.3.0 Version Seeder")

**Example Workflow:**

- **Scenario 1**: If we release v4.0.0

  1. Update your website to v4.0.0
  2. Click the **Run 4.0.0 Version Seeder** button **once**
  3. Wait for completion

- **Scenario 2**: When we release v5.0.0
  1. Update your website to v5.0.0
  2. Click the **Run 5.0.0 Version Seeder** button **once**
  3. Wait for completion

::: warning Seeder Execution
Never click the seeder button multiple times for the same version. Running the seeder more than once may cause data duplication or configuration conflicts.
:::

## Application Reboot

Reboot your application to apply changes and clear system cache.

### System Operations

When you reboot the system, the following operations will be performed:

1. **Clear and rebuild application cache, route, view and config**
2. **Bring application out of maintenance mode**

### How to Reboot

1. Click the **Reboot System** button (red button with power icon)
2. Alternatively, click **Clear System Cache** button (black button) to only clear cache without full reboot
3. Wait for the operation to complete
4. Your application will be refreshed and ready to use

### When to Reboot

- After making configuration changes
- When experiencing performance issues
- After installing plugins or extensions
- When cache-related issues occur
- After environment variable changes

::: tip Cache Clearing
If you only need to clear cache without a full reboot, use the **Clear System Cache** button instead of **Reboot System**.
:::

---

## Application Backup

Create a complete backup of your application including files and database to protect your data.

### What Will Be Backed Up?

The backup process includes:

- **Source Code**: All application files and code
- **Database**: Complete MySQL database dump
- **Assets**: Uploaded media in local storage and public files

::: warning Note
Every time you must refresh the server before creating a backup to ensure all latest changes are included.
:::

### How to Create a Backup

1. Click the **Refresh Server** button (green button with refresh icon)
2. Wait for the server refresh to complete
3. Click the **Create Backup** button (black button with download icon)
4. Wait for the backup process to complete
5. The backup will be saved and listed in the Recent Backups section

## Recent Backups

View and manage your recent application backups.

### Backup List

This section displays all your previously created backups with:

- Backup creation date and time
- Backup file size
- Download and restore options

::: warning Refresh Before Restore
**Refresh Server**: Every time you refresh the server before uploading/restoring a backup to prevent conflicts and ensure smooth restoration.
:::

### Managing Backups

When you have backups available, you can:

- **Download**: Download backup files to your local computer for safekeeping
- **Restore**: Restore your application to a previous backup state
- **Delete**: Remove old backups to free up server space

### Restoration Process

To restore from a backup:

1. Click the **Refresh Server** button first
2. Locate the backup you want to restore in the Recent Backups list
3. Click the **Restore** button for that backup
4. Wait for the restoration to complete
5. Your application will be restored to the backup state

::: danger Restoration Warning
Restoring a backup will overwrite your current application files and database. Make sure to create a current backup before restoring an older one.
:::
