# Translation System

This guide explains how the translation system works in Mentor LMS and how to update or customize translations.

## How Translation Works

In **Mentor LMS**, the texts you see on the interface are **not loaded directly from the `lang` files** at runtime. Instead, **all translation texts are stored and loaded from the database**.

When the application runs, the database translations **override the values from the `lang` files**, which is why your changes in `lang` files are not reflected, even after running `php artisan optimize:clear`.

## How to Update Translations

To update or change any text in the application:

### Step 1: Go to the Admin Dashboard

Log in to your admin account and navigate to the **Admin Dashboard**.

### Step 2: Open Translation Settings

Open **Translation / Language settings** from the admin menu.

### Step 3: Edit and Save

1. Find the text you want to change
2. Edit the text directly in the interface
3. Click **Save**

Those changes will be reflected immediately on the frontend.

## Important Notes

::: warning Database Priority
All translation texts are stored in the database and take priority over `lang` files. Any changes you make in the `lang` files will not be reflected in the application because the database values override them.
:::

::: tip Future Improvements
We are working on **improving the translation system** in future updates to make this process easier and more developer-friendly.
:::

## Need Help?

If you need help finding the translation settings in the admin panel, feel free to contact our support team at [support@ui-lib.com](mailto:support@ui-lib.com).
