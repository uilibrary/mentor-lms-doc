# Step 1: Purchase & Extract

Before starting the web installation process, you need to purchase Mentor LMS and extract the package files to your server.

## Purchase Process

1. Visit [MentorLMS on CodeCanyon](https://codecanyon.net/item/mentor-lms-learning-management-system/59092700) or search for "MentorLMS" on CodeCanyon
2. Choose your preferred license type (Regular or Extended)
3. Complete the purchase process on CodeCanyon
4. After purchase, download the package file (ZIP format) from your CodeCanyon downloads
5. Save your purchase code - you'll need it for take support from MentorLMS team

## File Extraction

### Local Development Environment

If you're installing on a local development environment:

1. Extract the downloaded ZIP file to your local development directory
2. Ensure the extracted files are within your web server's document root
3. Make sure the web server has proper read/write permissions for the files

### Local Development Environment

If you're installing on a local development environment:

1. Extract the downloaded ZIP file to your local development directory
2. Navigate to the project directory in your terminal
3. Copy the `.env.example` file to `.env`
4. Install PHP dependencies with: `composer install`
5. Install Node.js dependencies with: `npm install`
6. Start the local development server with: `composer dev`
7. Open your web browser and navigate to `http://localhost:3000`

### Live Server Installation (For shared hosting server)

For installation on a live server:

1. Upload the ZIP file to your server
2. Extract the ZIP file in your web server's document root
3. Copy the `.env.example` file to `.env`
4. Open your web browser and navigate to `http://your-domain.com`

::: warning Important
When you successfully uploaded zip and extracted the files, Then when you browse your app domain, it will automatically redirected to the web installer wizard. If not automatically redirected, visit: `https://your-domain.com/install/step-1`. For this wizard you have to complete other configuration steps like database connection, admin setup, system type, etc.
:::

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
