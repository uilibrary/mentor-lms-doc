# Step 1: Purchase & Extract

Before starting the web installation process, you need to purchase Mentor LMS and extract the package files to your server.

## Purchase Process

1. Visit the official Mentor LMS marketplace page
2. Choose your license type (Standard or Extended)
3. Complete the purchase process
4. Download the package file (ZIP format)
5. Save your purchase code for activation during installation

::: tip
Your purchase code is required during installation and for accessing future updates. Store it in a safe place.
:::

## File Extraction

### Local Development Environment

If you're installing on a local development environment:

1. Extract the downloaded ZIP file to your local development directory
2. Ensure the extracted files are within your web server's document root
3. Make sure the web server has proper read/write permissions for the files

### Live Server Installation

For installation on a live server:

1. Upload the ZIP file to your server using FTP or your hosting control panel
2. Extract the ZIP file in your web server's document root

## Pre-Installation Configuration

Before running the web installer, you need to:

1. Create a new database for Mentor LMS
2. Copy the `.env.example` file to `.env`

## Directory Structure

After extraction, you should see the following directory structure:

```
mentor-lms/
├── app/
├── bootstrap/
├── config/
├── database/
├── public/
├── resources/
├── routes/
├── storage/
├── tests/
├── vendor/
├── .env.example
├── artisan
├── composer.json
└── README.md
```

## Next Steps

Once you've extracted the files, and created a database, you're ready to proceed with the [Web Installer](/installation/web-installer) process.
