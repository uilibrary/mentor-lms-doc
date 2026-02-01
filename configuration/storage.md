# Storage Setup

Mentor LMS supports multiple storage options for your course files, videos, and other media content. This page explains how to configure your storage settings.

## Accessing Storage Settings

1. Log in to your admin dashboard
2. Navigate to **Settings** in the sidebar menu
3. Select **Storage Settings** from the dropdown options

![Storage Settings](/configuration/settings-storage.png)

## Available Storage Options

Mentor LMS offers three storage options:

### Local Storage

The default option that stores all files on your web server. Suitable for smaller installations or when starting out.

**Pros:**

- No additional configuration required
- No extra costs
- Simple management

**Cons:**

- Limited by your server's disk space
- May affect server performance with many files
- Potential bandwidth limitations

### Amazon S3 Storage

Store your files on Amazon's secure and scalable cloud storage service. Recommended for production environments and larger installations.

**Pros:**

- Virtually unlimited storage capacity
- Better performance for file delivery
- Reduced load on your web server
- Global content delivery network (CDN) integration
- Higher reliability

**Cons:**

- Requires an AWS account
- Additional costs based on storage and bandwidth usage
- More complex initial setup

### Cloudflare R2 Storage

S3-compatible object storage from Cloudflare with zero egress fees. Cost-effective alternative to Amazon S3.

**Pros:**

- S3-compatible API
- No egress/bandwidth charges
- Competitive pricing
- Global distribution
- Simple integration

**Cons:**

- Requires a Cloudflare account
- Storage costs apply

## Configuring Local Storage

1. In Storage Settings, select **Local Storage** as your storage driver
2. Click **Save Changes**

::: tip
For local storage, ensure your server has sufficient disk space for your anticipated media uploads.
:::

## Configuring Amazon S3 Storage

1. In Storage Settings, select **Amazon S3** as your storage driver
2. Enter the following AWS credentials:
   - **AWS Access Key ID**: Your AWS account access key
   - **AWS Secret Access Key**: Your AWS account secret key
   - **AWS Default Region**: The AWS region where your bucket is located (e.g., us-east-1)
   - **AWS Bucket**: The name of your S3 bucket
   - **AWS URL**: The URL endpoint for your bucket (typically https://your-bucket-name.s3.amazonaws.com)

3. Click **Save Changes**

::: warning
Keep your AWS credentials secure. Never share your access keys or expose them in client-side code.
:::

### Getting Amazon S3 Bucket credentials

If you're using Amazon S3 storage, follow these steps to create and configure your bucket:

1. Log in to the [AWS Management Console](https://aws.amazon.com/console/)
2. Navigate to S3 service
3. Click **Create bucket**
4. Name your bucket and select a region close to your target audience
5. Configure bucket settings:
   - Under **Permissions**, uncheck "Block all public access" (as course files need to be publicly accessible)
   - Enable CORS (Cross-Origin Resource Sharing) with the following policy:

```json
[
  {
    "AllowedHeaders": ["*"],
    "AllowedMethods": ["GET", "PUT", "POST", "DELETE"],
    "AllowedOrigins": ["https://your-domain.com"],
    "ExposeHeaders": []
  }
]
```

6. Create an IAM user with S3 access and generate access keys

## Configuring Cloudflare R2 Storage

1. In Storage Settings, select **Cloudflare R2** as your storage driver
2. Enter the following Cloudflare R2 credentials:
   - **Account ID or Access Key**: Your Cloudflare account ID or R2 access key ID
   - **Secret Access Key**: Your R2 secret access key
   - **Endpoint**: Your R2 bucket endpoint URL (e.g., https://[account-id].r2.cloudflarestorage.com)
   - **Public URL**: The public URL for accessing files (e.g., https://pub-[hash].r2.dev)
   - **Bucket Name**: The name of your R2 bucket
   - **Region**: The region (typically `auto` for R2)

3. Click **Save Changes**

### Getting Cloudflare R2 Credentials

1. Log in to your [Cloudflare Dashboard](https://dash.cloudflare.com/)
2. Navigate to **R2** from the sidebar
3. Click **Create bucket** and name your bucket
4. Go to **Manage R2 API Tokens**
5. Click **Create API Token**
6. Set permissions (Read & Write recommended)
7. Copy the **Access Key ID** and **Secret Access Key**
8. Your endpoint will be: `https://[account-id].r2.cloudflarestorage.com`
9. Enable public access for your bucket to get the **Public URL**

::: tip
Cloudflare R2 offers 10 GB free storage per month with zero egress fees, making it cost-effective for media-heavy applications.
:::

## Best Practices for Media Storage

- **Image Optimization**: Compress images before upload to save storage space
- **Video Hosting**: Consider using YouTube or Vimeo integration for video content instead of direct uploads
- **Regular Backups**: Implement a backup strategy regardless of storage option
- **File Size Limits**: Configure reasonable upload limits in your PHP and server settings

After configuring your storage settings, proceed to [Payment Gateway Setup](/configuration/payment) to enable payment processing for your courses.
