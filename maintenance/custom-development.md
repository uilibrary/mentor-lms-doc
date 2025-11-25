# Custom Development

Mentor LMS allows you to customize and modify the application code to meet your specific requirements. This guide explains how to safely develop custom features locally and deploy them to your live website.

::: tip Development Environment
All custom development and modifications must be done in a **local development environment**. Never make code changes directly on your live production server.
:::

## Local Development

Before starting custom development, ensure you have a local copy of Mentor LMS installed and running. Refer to the [Localhost Installation Guide](/installation/localhost) for setup instructions.

You have complete freedom to modify any part of the Mentor LMS codebase:

- **Frontend**: Modify views, components, styles, etc.
- **Backend**: Update controllers, models, etc.
- **Design**: Change themes, layouts, etc.

## Preparing for Deployment

After completing your custom modifications locally, follow these steps to prepare your project for deployment.

### Step 1: Clear Optimization Caches

Before building, clear all Laravel optimization caches:

```bash
php artisan optimize:clear
```

This command clears:

- Configuration cache
- Route cache
- View cache
- Compiled class cache
- Application cache

### Step 2: Build SSR Assets

Build the Server-Side Rendering (SSR) assets for production:

```bash
npm run build:ssr
```

This command compiles and optimizes:

- JavaScript files
- CSS stylesheets
- Vue/React components (if applicable)
- Production-ready assets

::: warning Build Completion
Wait for the build process to complete successfully. Do not proceed if there are build errors.
:::

### Step 3: Remove Public Storage Directory

Navigate to your project's `public` folder and check for a `storage` directory:

```bash
cd public
```

**If you see a `storage` folder inside `public/`, delete it:**

- **Windows**: Right-click the `storage` folder and select "Delete"
- **Mac/Linux**: Run `rm -rf storage` from the `public` directory

::: tip Why Remove Storage?
The `public/storage` directory is a symbolic link in local environments. Removing it prevents conflicts when deploying to your live server.
:::

### Step 4: Create Deployment ZIP File

Create a ZIP archive of your entire project with specific exclusions. In this case select all project files **except** the following:

::: danger You MUST exclude these folders and files from your ZIP:

- `node_modules/` - Node.js dependencies (will be reinstalled on server)
- `.env` - Environment configuration (contains sensitive data)
- `.git/` - Git version control directory
- `.github/` - GitHub workflows and configurations
  :::

## Deploying to Live Website

Once your ZIP file is ready, deploy it through the Maintenance panel.

### Deployment Process

1. **Access Maintenance Panel**

   - Log in to your live website admin dashboard
   - Navigate to **Maintenance** > **App Maintenance**

2. **Refresh Server**

   - Click the **`Refresh Server`** button (green button)
   - Wait for the refresh to complete

3. **Upload Custom Version**

   - Click the **`Update Application`** button (black button)
   - Select your custom ZIP file (`mentor-lms-custom.zip`)
   - The update process will start automatically

4. **Run Version Seeder**
   - After successful deployment, click **`Run Version Seeder`** button
   - Only run this if you've made database changes or added new features

::: warning Important: Version Updates
When we release a new version of Mentor LMS, **do not directly update with our provided version** on your live website. If you upload our new version directly, it will **overwrite and remove all your custom modifications**.

**Required Process for Updates:**

1. **Download** the latest Mentor LMS version from us
2. **Merge** our new source code with your custom modified code locally
3. **Test** the merged version thoroughly in your local environment
4. **Create ZIP** of the merged version following the deployment steps below
5. **Upload** this merged ZIP to your server through the Maintenance panel

This ensures your custom modifications are preserved while getting the latest features and bug fixes.
:::
