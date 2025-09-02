# Application Restore

Restore your Mentor LMS application from a backup using the built-in restore system from the admin dashboard.

## Accessing the Restore System

1. Log in to your Mentor LMS admin dashboard
2. Click **"Maintenance"** in the left sidebar
3. Find the **"Recent Backups"** section

## Understanding Backup Information

Each backup shows:

- **Name**: Unique identifier (e.g., backup_2025_09_03_00_13_02)
- **Timestamp**: Date and time of backup creation
- **Status**: Green "completed" tag
- **Notes**: "Full application backup created successfully"
- **Sizes**: Source size (e.g., 82.25 MB) and Database size (e.g., 1.77 MB)

### Available Actions

- **Restore**: Blue text with refresh icon - restores from this backup
- **Delete**: Red text with trash icon - permanently removes backup

## When to Use Restore

**Common Scenarios:**

- After failed updates
- Data corruption or accidental deletions
- Configuration issues
- Security incidents
- System instability

**Before Restoring:**

- Understand what will be lost in current state
- Consider backup age and recent changes
- Plan for user notification and downtime

## How to Restore from Backup

### Step 1: Select Backup

1. Go to **"Recent Backups"** section
2. Review available backups and timestamps
3. Choose appropriate backup (verify "completed" status)

### Step 2: Initiate Restore

1. Click **"Restore"** button (blue text with refresh icon)
2. Review confirmation dialog carefully
3. Click **"Confirm Restore"** to proceed

### Step 3: Monitor Process

1. **Do not close browser** during restore
2. Monitor progress indicator
3. Wait for completion confirmation

## What Happens During Restore

**Automatic Processes:**

- **File Restoration**: Application files restored from backup
- **Database Restoration**: Complete database replacement
- **Asset Restoration**: Uploaded files and media recovered
- **System Updates**: Permissions set, cache cleared

**Data Impact:**

- **Restored**: All application files, database, configurations, user data, course content
- **Lost**: Any changes made after backup date, new users, new content

## Post-Restore Steps

### Immediate Actions

1. **Verify System Status**

   - Check application loads properly
   - Verify admin dashboard access
   - Test basic functionality

2. **Clear Caches**

   - Clear browser cache and cookies
   - Refresh application pages

3. **Check Configurations**
   - Review system settings
   - Verify payment gateways and SMTP

## Troubleshooting

**Restore Fails to Start:**

- Verify backup file exists and is accessible
- Check file and directory permissions
- Ensure sufficient disk space

**Restore Process Interrupted:**

- Don't panic - system maintains multiple backup points
- Check for error messages
- Try different backup if available

**Post-Restore Issues:**

- Check and fix file permissions
- Verify database connectivity
- Review and update configurations

### Recovery Options

**If Restore Fails:**

1. Check error messages for specific details
2. Verify sufficient disk space and memory
3. Check file and directory permissions
4. Try alternative backup if available

The Application Restore system provides a reliable way to recover your Mentor LMS installation from any issues, ensuring business continuity and data protection.
