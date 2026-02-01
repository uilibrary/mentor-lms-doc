# Localhost Installation

This guide will walk you through installing Mentor LMS on your local development environment (Windows, macOS, or Linux).

## Prerequisites

Before you begin, ensure you have the following installed on your local machine:

- **PHP** (version 8.2 or higher)
- **Composer** (PHP dependency manager)
- **Node.js** and **npm** (for frontend assets)
- **MySQL** or **MariaDB** database server
- **Web Server** (Apache, Nginx, or PHP built-in server)

::: tip Recommended Tools
For easier local development, consider using:

- **XAMPP** (Windows/Mac/Linux) - Includes Apache, MySQL, and PHP
- **WAMP** (Windows) - Windows, Apache, MySQL, PHP
- **MAMP** (Mac) - Mac, Apache, MySQL, PHP
- **Laragon** (Windows) - Modern local development environment
  :::

## Installation Steps

### Step 1: Extract the Package

1. Download the Mentor LMS package from CodeCanyon
2. Extract the ZIP file to your local development directory
   - For XAMPP: `C:\xampp\htdocs\mentor-lms` (Windows) or `/Applications/XAMPP/htdocs/mentor-lms` (Mac)
   - For WAMP: `C:\wamp64\www\mentor-lms`
   - For MAMP: `/Applications/MAMP/htdocs/mentor-lms`
   - For Laragon: `C:\laragon\www\mentor-lms`

### Step 2: Create Database

1. Open **phpMyAdmin** (usually at `http://localhost/phpmyadmin`)
2. Click on **Databases** tab
3. Create a new database (e.g., `mentor_lms`)

### Step 3: Configure Environment

1. Navigate to the project directory in your terminal/command prompt
2. Copy the `.env.example` file to `.env`:

### Step 4: Install Dependencies

Install PHP and Node.js dependencies:

```bash
# Install PHP dependencies
composer install

# Install Node.js dependencies
npm install
```

::: warning Note
If you encounter any errors during `composer install`, make sure your PHP version meets the requirements and all required PHP extensions are enabled.
:::

### Step 5: Database Migration & Seeding

After installing dependencies you can prepare the database using either manual artisan commands or the built-in web installer.

### Option 1: Artisan Commands

1. From the project root, navigate to `storage/app/public/`
2. Create an empty file named `installed` (no extension needed)
3. Run one of the following command sets:

```bash
php artisan migrate
php artisan db:seed
```

Or run both migration and seeding in a single command:

```bash
php artisan migrate:refresh --seed
```

To create the `symbolic` link, you may use the `storage:link` Artisan command:

```bash
php artisan storage:link
```

#### Start the local development server:

```bash
composer dev
```

This command will start the application on `http://localhost:8000`

::: tip Alternative Method
You can also use PHP's built-in server:

```bash
php artisan serve
```

This will start the server on `http://localhost:8000`

Also you have to run the assets compilation:

```bash
npm run dev
```

:::

### Option 2: Web Installer on Localhost

Start the local development server:

```bash
composer dev
```

This command will start the application on `http://localhost:8000`

::: tip Alternative Method
You can also use PHP's built-in server:

```bash
php artisan serve
```

This will start the server on `http://localhost:8000`

Also you have to run the assets compilation:

```bash
npm run dev
```

:::

1. Open your browser and visit `http://localhost:8000` (or the URL shown in your terminal)
2. You will be redirected to the installation wizard automatically
3. If not redirected, navigate directly to `http://localhost:8000/install/step-1`
4. Complete each wizard step as described in the [Web Installer Guide](/installation/web-installer)
