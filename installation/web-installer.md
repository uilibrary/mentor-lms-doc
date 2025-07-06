# Step 2: Web Installer

Mentor LMS includes a user-friendly web installer that guides you through the setup process. This page walks you through each step of the web installation process.

## Accessing the Web Installer

1. Open your web browser and navigate to your domain where you've placed the Mentor LMS files
2. You'll automatically be redirected to the installer if it's a fresh installation
3. If not automatically redirected, visit: `https://your-domain.com/install`

## Installation Steps

### Step 1: Welcome Screen

The first screen welcomes you to the Mentor LMS installer and explains the installation process.

![Welcome Screen](/installation/install-step-1.png)

Click "Let's Go" to begin the installation process.

### Step 2: Server Requirements Check

The installer will check if your server meets all the necessary requirements for running Mentor LMS.

![Server Requirements](/installation/install-step-2.png)

The system will check:

- PHP version
- Required PHP extensions
- Directory permissions
- Server settings

If any requirements are not met, they will be marked in red. You must resolve these issues before proceeding.

### Step 3: Application Settings

In this step, you'll configure basic application settings.

![Application Settings](/installation/install-step-3.1.png)

Fill in the following information:

- **Application Name**: The name of your LMS platform
- **Application URL**: The full URL where your application will be accessible
- **Application Environment**: Select "Production" for a live site or "Development" for testing
- **Timezone**: Select your local timezone
- **Purchase Code**: Enter the purchase code you received after buying Mentor LMS

![License Verification](/installation/install-step-3.2.png)

The system will verify your purchase code online before proceeding.

### Step 4: Database Configuration

Now you'll connect your database to the application.

![Database Configuration](/installation/install-step-4.png)

Enter your database details:

- **Database Connection**: Usually "mysql"
- **Database Host**: Your database server address (often "localhost")
- **Database Port**: Usually "3306" for MySQL
- **Database Name**: The name of the database you created
- **Database Username**: Username for database access
- **Database Password**: Password for database access

The installer will test the connection before proceeding.

### Step 5: Administrator Account Setup

Create the primary administrator account for managing the LMS.

![Admin Account Setup](/installation/install-step-5.1.png)

Fill in:

- **Admin Name**: Your full name
- **Admin Email**: Your email address (used for login)
- **Admin Password**: Create a secure password
- **Confirm Password**: Re-enter your password

On the same screen, you'll select the platform mode:

![Platform Mode](/installation/install-step-5.2.png)

- **Unified Mode**: Only administrators can create courses
- **Collaborative Mode**: Approved instructors can create and sell courses

### Step 6: Installation Complete

The final screen confirms the successful installation of Mentor LMS.

![Installation Complete](/installation/install-step-6.png)

You'll see:

- Confirmation of successful installation
- Links to the frontend and admin dashboard
- Your admin login credentials

Click "Go to Admin Dashboard" to begin configuring your new LMS.

## Post-Installation Steps

After completing the web installer, there are several important configuration steps to complete:

1. [Configure System Information](/configuration/system-info)
2. [Select a Homepage Template](/configuration/homepage)
3. [Set Up Storage Options](/configuration/storage)
4. [Configure Payment Gateways](/configuration/payment)
5. [Set Up SMTP Email](/configuration/smtp)
6. [Configure Google Authentication](/configuration/google-auth)

::: warning Important
For security reasons, the installer directory should be removed after successful installation. The system will attempt to do this automatically, but verify it has been removed or delete it manually.
:::

## Troubleshooting Installation Issues

If you encounter issues during installation:

- Check the [system requirements](/installation/requirements) again
- Verify database credentials are correct
- Ensure proper file permissions
- Check PHP version and extensions

For more detailed troubleshooting assistance, visit the [Installation Issues](/troubleshooting/installation) page.
