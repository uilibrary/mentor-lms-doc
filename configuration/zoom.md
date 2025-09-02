# Zoom Configuration

This guide will help you configure Zoom integration for live classes in Mentor LMS. You'll need to create a Zoom app and obtain the necessary credentials to enable live class functionality.

## Overview

Mentor LMS integrates with Zoom to provide live class functionality. To enable this feature, you need to:

1. Create a Zoom Server-to-Server OAuth app
2. Configure the app with required scopes
3. Obtain your credentials
4. Enter the credentials in Mentor LMS admin panel

## Creating Zoom App

### Step 1: Access Zoom Marketplace

1. Go to [Zoom Marketplace](https://marketplace.zoom.us/)
2. Sign in with your Zoom account
3. Click **"Develop"** in the top navigation
4. Select **"Build App"**

### Step 2: Create Server-to-Server OAuth App

1. Click **"Create"** button
2. Choose **"Server-to-Server OAuth"** app type
3. Click **"Create"**

### Step 3: Configure App Information

Fill in the required app information:

- **App Name**: Enter a name for your app (e.g., "Mentor LMS Integration")
- **Short Description**: Brief description of your app
- **Company Name**: Your company or organization name
- **Developer Contact Information**: Your email address

### Step 4: Configure App Settings

#### Basic Information

- **App Name**: Your app name
- **App Logo**: Upload a logo (optional)
- **App Description**: Detailed description of your app

#### Credentials

- **Account ID**: This will be generated automatically
- **Client ID**: This will be generated automatically
- **Client Secret**: This will be generated automatically

## Required Scopes

Your Zoom app must have the following scopes enabled:

### Required Permissions

- **meeting:write** - Create and manage meetings
- **meeting:read** - Read meeting information
- **user:read** - Read user information

### Optional Permissions (for enhanced features)

- **recording:read** - Access meeting recordings
- **recording:write** - Manage meeting recordings

## Web SDK Configuration (Optional)

If you want to embed Zoom meetings directly in your website:

### Step 1: Enable Web SDK

1. In your Zoom app settings, go to **"Features"** tab
2. Enable **"Web SDK"**
3. Click **"Save"**

### Step 2: Get Meeting SDK Credentials

1. Go to **"Credentials"** tab
2. Find **"Meeting SDK"** section
3. Copy the **Meeting SDK Client ID** and **Meeting SDK Client Secret**

## Configuring in Mentor LMS

### Step 1: Access Live Class Settings

1. Log in to your Mentor LMS admin dashboard
2. Navigate to **Settings** → **Live Class Settings**
3. You'll see the Zoom configuration form

### Step 2: Enter Server-to-Server OAuth Credentials

Fill in the following fields with your Zoom app credentials:

- **Account Email**: Your Zoom account email address
- **Account ID**: Copy from your Zoom app credentials
- **Client ID**: Copy from your Zoom app credentials
- **Client Secret**: Copy from your Zoom app credentials

### Step 3: Configure Web SDK (Optional)

If you enabled Web SDK:

1. Select **"Yes"** for "Do you want to use Web SDK for your live class?"
2. Enter your **Meeting SDK Client ID**
3. Enter your **Meeting SDK Client Secret**

### Step 4: Save Configuration

1. Review all entered credentials
2. Click **"Save Changes"** button
3. The system will test the connection automatically

## Testing Your Configuration

### Verify Connection

1. After saving, check for any error messages
2. The system will automatically test the Zoom connection
3. If successful, you'll see a confirmation message

### Test Live Class Creation

1. Go to any course as an instructor
2. Try to create a live class session
3. Verify that Zoom meeting is created successfully

## Troubleshooting

### Common Issues

#### Invalid Credentials

- **Check Account Email**: Ensure you're using the correct Zoom account email
- **Verify Credentials**: Double-check all copied credentials from Zoom app
- **App Status**: Ensure your Zoom app is published and active

#### Missing Scopes

- **Check Required Scopes**: Verify all required scopes are enabled in your Zoom app
- **App Permissions**: Ensure your app has the necessary permissions

#### Web SDK Issues

- **SDK Enabled**: Verify Web SDK is enabled in your Zoom app
- **SDK Credentials**: Check Meeting SDK credentials are correct
- **Browser Compatibility**: Ensure your browser supports Web SDK

### Getting Help

If you encounter issues:

1. **Check Zoom App Status**: Verify your app is active in Zoom Marketplace
2. **Review Error Messages**: Check for specific error messages in the admin panel
3. **Contact Support**: Reach out to technical support with your error details

## Next Steps

Once Zoom is configured:

1. **Test Live Classes**: Create a test live class to verify functionality
2. **Train Instructors**: Show instructors how to create and manage live classes
3. **Student Instructions**: Provide students with guidance on joining live classes

Your Zoom integration is now ready for live class functionality in Mentor LMS!
