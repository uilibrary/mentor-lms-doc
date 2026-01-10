# VPS Server Installation

Choose your preferred deployment method for installing Mentor LMS on a VPS server.

## Docker

We provide a complete Docker setup package with all necessary configuration files and step-by-step instructions.

### Installation Steps

**1. Download Docker Setup**

Download the Docker setup ZIP file: [docker-setup.zip](https://github.com/uilibrary/mentor-lms-doc/raw/main/public/docker-setup.zip)

**2. Extract the ZIP File**

Extract the ZIP file into the **root directory of your project**.

After extracting, you will see:

- `root/docker/` directory
  - Inside this directory, there are some other files and folders with a `README.md` file (`README.md` have the **full step-by-step instructions**)
- `root/docker-compose.yml` file

**3. Follow the Instructions**

Please follow the instructions provided in the `root/docker/README.md` file to run the project using Docker.

After completing these steps, try running the containers again.

::: tip Need Help?
If you face any issues during the Docker setup, please contact our support team at [support@ui-lib.com](mailto:support@ui-lib.com) with the error logs, and we'll help you further.
:::

---

## aaPanel

aaPanel is a free, open-source web hosting control panel for Linux servers.

### Installation Steps

**1. Install aaPanel**

```bash
# For Ubuntu/Debian
wget -O install.sh http://www.aapanel.com/script/install-ubuntu_6.0_en.sh && sudo bash install.sh aapanel

# For CentOS
wget -O install.sh http://www.aapanel.com/script/install_6.0_en.sh && sudo bash install.sh aapanel
```

**2. Access aaPanel**

After installation, note the panel URL, username, and password displayed in the terminal.

**3. Install Required Software**

From aaPanel dashboard:

- Install **Nginx** or **Apache**
- Install **PHP 8.2** (enable required extensions)
- Install **MySQL 8.0**
- Install **phpMyAdmin** (optional)

**4. Create Website**

1. Go to **Website** → **Add Site**
2. Enter your domain name
3. Select PHP version: **8.2**
4. Create database for the site

**5. Upload Mentor LMS**

1. Upload the Mentor LMS ZIP file via **File Manager**
2. Extract to your website directory
3. Set proper permissions (755 for directories, 644 for files)

**6. Configure Database**

1. Create database via **Database** section
2. Note database credentials
3. Access your domain to start web installer

**7. Complete Installation**

1. Open your web browser
2. Navigate to your domain: `https://your-domain.com`
3. You will be automatically redirected to the installation wizard
4. If not redirected, manually visit: `https://your-domain.com/install/step-1`

---

## Dokploy

Dokploy is a modern deployment platform for Docker applications.

### Installation Steps

**1. Install Dokploy**

```bash
curl -sSL https://dokploy.com/install.sh | sh
```

**2. Access Dokploy Dashboard**

After installation, access the dashboard at: `http://your-server-ip:3000`

**3. Create New Application**

1. Click **Create Application**
2. Select **Docker** as deployment type
3. Configure application settings:
   - Name: `mentor-lms`
   - Port: `80`

**4. Configure Build**

1. Upload your Mentor LMS files or connect Git repository
2. Set Dockerfile path if needed
3. Configure environment variables

**5. Add MySQL Database**

1. Go to **Databases** → **Add Database**
2. Select **MySQL 8.0**
3. Configure database:
   - Database name: `mentor_lms`
   - Username: `mentor_user`
   - Password: (set secure password)

**6. Deploy Application**

1. Click **Deploy** button
2. Monitor deployment logs
3. Wait for successful deployment

**7. Access Application**

1. Open your web browser
2. Navigate to your domain: `https://your-domain.com`
3. You will be automatically redirected to the installation wizard
4. If not redirected, manually visit: `https://your-domain.com/install/step-1`

---

## Laravel Cloud

Laravel Cloud provides managed hosting optimized for Laravel applications.

### Installation Steps

**1. Create Account**

Visit [Laravel Cloud](https://cloud.laravel.com) and create an account.

**2. Create New Server**

1. Click **Create Server**
2. Select your preferred cloud provider (AWS, DigitalOcean, etc.)
3. Choose server size (minimum 2GB RAM recommended)
4. Select region closest to your users

**3. Create Database**

1. Go to **Databases** section
2. Click **Create Database**
3. Configure:
   - Name: `mentor_lms`
   - Type: MySQL 8.0

**4. Deploy Application**

1. Click **Create Site**
2. Enter your domain name
3. Select **Deploy from ZIP** or connect Git repository
4. Upload Mentor LMS package

**5. Configure Environment**

1. Go to **Environment** tab
2. Set database credentials:
   ```env
   DB_CONNECTION=mysql
   DB_HOST=localhost
   DB_PORT=3306
   DB_DATABASE=mentor_lms
   DB_USERNAME=your_username
   DB_PASSWORD=your_password
   ```

**6. Run Deployment**

1. Click **Deploy** button
2. Monitor deployment process
3. Wait for completion

**7. Access Application**

1. Open your web browser
2. Navigate to your domain: `https://your-domain.com`
3. You will be automatically redirected to the installation wizard
4. If not redirected, manually visit: `https://your-domain.com/install/step-1`

---

## Need Help?

If you encounter issues during installation:

1. Contact support at [support@ui-lib.com](mailto:support@ui-lib.com)

::: tip Professional Installation
We offer professional installation services where our team will handle the complete setup for you.
:::
