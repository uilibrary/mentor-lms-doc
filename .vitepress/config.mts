import { defineConfig } from "vitepress";

// https://vitepress.dev/reference/site-config
export default defineConfig({
  title: "Mentor LMS",
  description: "Comprehensive Learning Management System Documentation",
  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    logo: {
      light: "/logo-light.png",
      dark: "/logo-dark.png",
    },
    siteTitle: false,
    nav: [
      { text: "Home", link: "/" },
      { text: "Documentation", link: "/introduction/" },
      { text: "Support", link: "/support" },
    ],

    sidebar: [
      {
        text: "Introduction",
        collapsed: false,
        items: [
          { text: "Overview", link: "/introduction/" },
          { text: "Core Features", link: "/introduction/features" },
          { text: "Who Benefits", link: "/introduction/benefits" },
          {
            text: "Upcoming Features",
            link: "/introduction/upcoming-features",
          },
        ],
      },
      {
        text: "User Roles",
        collapsed: false,
        items: [
          { text: "Administrator", link: "/user-roles/administrator" },
          { text: "Instructor", link: "/user-roles/instructor" },
          { text: "Student", link: "/user-roles/student" },
        ],
      },
      {
        text: "Installation Guide",
        collapsed: false,
        items: [
          { text: "Requirements", link: "/installation/requirements" },
          {
            text: "Step 1: Purchase & Extract",
            link: "/installation/purchase-extract",
          },
          {
            text: "Step 2: Web Installer",
            link: "/installation/web-installer",
          },
          {
            text: "Installation Service",
            link: "/installation/installation-service",
          },
        ],
      },
      {
        text: "Configuration",
        collapsed: false,
        items: [
          { text: "System Information", link: "/configuration/system-info" },
          { text: "Homepage Selection", link: "/configuration/homepage" },
          { text: "Storage Setup", link: "/configuration/storage" },
          { text: "Payment Gateways", link: "/configuration/payment" },
          { text: "SMTP Settings", link: "/configuration/smtp" },
          { text: "Zoom Configuration", link: "/configuration/zoom" },
          { text: "Google Authentication", link: "/configuration/google-auth" },
        ],
      },
      {
        text: "Customization",
        collapsed: false,
        items: [
          { text: "Homepage Customization", link: "/customization/homepage" },
        ],
      },
      {
        text: "Maintenance",
        collapsed: false,
        items: [
          { text: "Application Update", link: "/maintenance/app-update" },
          { text: "Application Backup", link: "/maintenance/app-backup" },
          { text: "Application Restore", link: "/maintenance/app-restore" },
          {
            text: "Application Manual Update",
            link: "/maintenance/app-manual-update",
          },
        ],
      },
      {
        text: "Troubleshooting",
        collapsed: false,
        items: [
          {
            text: "Installation Issues",
            link: "/troubleshooting/installation",
          },
          { text: "Common Problems", link: "/troubleshooting/common-problems" },
        ],
      },
    ],

    socialLinks: [
      {
        icon: "github",
        link: "https://github.com/uilibrary/mentor-lms-doc.git",
      },
    ],

    footer: {
      message: "Released under the MIT License.",
      copyright: "Copyright © 2023 Mentor LMS",
    },
  },
});
