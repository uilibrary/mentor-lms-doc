# Step 2: Web Installer

Mentor LMS includes a user-friendly web installer that guides you through the setup process. This page walks you through each step of the web installation process.

<!-- ### Database Creation & Web Installer

1. Create a new database for Mentor LMS.
2. Collect the database name, username, and password.
3. Open your web browser and navigate to your app domain.
4. It will automatically redirect you to the web installer wizard.
5. If not automatically redirected, visit: `https://your-domain.com/install/step-1`. -->

## Installation Steps

### Step 1: Server Requirements Check

The installer will check if your server meets all the necessary requirements for running Mentor LMS.

![Welcome Screen](/installation/install-step-1.png)

The system will check:

- PHP version
- Required PHP extensions
- Directory permissions
- Server settings

If any requirements are not met, they will be marked in red. You must resolve these issues before proceeding.

### Step 2: Application Settings

In this step, you'll configure basic application settings.

![Server Requirements](/installation/install-step-2.png)

Fill in the following information:

- **Application Name**: The name of your LMS platform
- **Application URL**: The full URL where your application will be accessible
- **Application Environment**: Select "Production" for a live site or "Development" for testing
- **Timezone**: Select your local timezone
- **Purchase Code**: Enter the purchase code you received after buying Mentor LMS

The system will verify your purchase code online before proceeding.

### Step 3: Database Configuration

Now you'll connect your database to the application.

![Application Settings](/installation/install-step-3.1.png)

Enter your database details:

- **Database Connection**: Usually "mysql"
- **Database Host**: Your database server address (often "localhost")
- **Database Port**: Usually "3306" for MySQL
- **Database Name**: The name of the database you created
- **Database Username**: Username for database access
- **Database Password**: Password for database access

The installer will test the connection before proceeding.

![License Verification](/installation/install-step-3.2.png)

### Step 4: Administrator Account Setup

Create the primary administrator account for managing the LMS.

![Database Configuration](/installation/install-step-4.png)

Provide the:

- **Admin Name**: Your full name
- **Admin Email**: Your email address (used for login)
- **Admin Password**: Create a secure password
- **Confirm Password**: Re-enter your password

### Step 5: Installation Complete

The final screen confirms the successful installation of Mentor LMS. On this screen, you'll select the platform mode:

![Admin Account Setup](/installation/install-step-5.1.png)

- **Administrative Mode**: Only administrators can create courses
- **Collaborative Mode**: Approved instructors can create and sell courses

Now you have to finally click on "Confirm" button to complete the installation process. When you will click, you will seed installation completing progress. Once it completed you will redirect to the home page of MentorLMS automatically.

![Installation Complete](/installation/install-step-6.png)

## Troubleshooting Installation Issues

If you encounter any issues during installation or if the application doesn't run properly:

1. **Try refreshing the installation**:

   - Visit: `https://your-domain.com/install/refresh`
   - This will restart the installation process

2. **Still having trouble?**

   - Clear browser cache and try again
   - Check the error logs in `storage/logs/`
   - Check the `installed` file is exist or not into `storage/app/public/`
   - If exist, then you have to delete `installed` file from `storage/app/public/`

3. **Contact our support team**

   - Visit our support page and create a support ticket: [Support](https://support.ui-lib.com)
   - Provide the error details and share the attachments
   - Our support team will help you to resolve the issues
