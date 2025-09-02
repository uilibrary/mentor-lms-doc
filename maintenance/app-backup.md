# Application Backup

Create and manage backups of your Mentor LMS application using the built-in backup system from the admin dashboard.

## Accessing the Backup System

1. Log in to your Mentor LMS admin dashboard
2. Click **"Maintenance"** in the left sidebar
3. Find the **"Application Backup"** card

## What Gets Backed Up

The backup system creates a complete backup including:

- **Source Code**: All application files and Laravel framework
- **Database**: Complete MySQL database dump with all data
- **Configuration**: Environment files and system settings
- **Assets**: Uploaded media files, videos, documents, and images

## How to Create a Backup

### Step 1: Start Backup Process

1. In **"Application Backup"** section, click **"Create Backup"** button
2. Wait for completion (may take several minutes)
3. **Do not close browser** during the process

### Step 2: Verify Backup

1. Go to **"Recent Backups"** section
2. Verify your backup appears with "completed" status
3. Check backup details:
   - **Name**: backup_YYYY_MM_DD_HH_MM_SS format
   - **Status**: Green "completed" tag
   - **Sizes**: Source size and Database size

## Backup Storage

- **Location**: `storage/app/backups/`
- **Format**: Compressed archive files
- **Naming**: Timestamp-based (e.g., backup_2025_09_03_00_13_02)

## Managing Backups

### Viewing Backups

- Go to **"Recent Backups"** section
- View list of all available backups
- See backup details and status

### Backup Actions

**Restore Backup:**

- Click **"Restore"** button (blue text with refresh icon)
- **Warning**: This will overwrite current application state

**Delete Backup:**

- Click **"Delete"** button (red text with trash icon)
- **Warning**: This action cannot be undone

## When to Create Backups

**Before Major Changes:**

- System updates
- Configuration changes
- Bulk content imports
- User data migrations

**Regular Schedule:**

- Daily backups for active systems
- Weekly backups for stable systems
- Before any maintenance work

## Troubleshooting

**Backup Creation Fails:**

- Check available disk space
- Verify file and directory permissions
- Ensure database connection is working

**Backup Incomplete:**

- Large files may cause timeouts
- Large databases may need more time
- Check server resources and limits

The Application Backup system ensures your Mentor LMS data and configuration are safely preserved for recovery when needed.
