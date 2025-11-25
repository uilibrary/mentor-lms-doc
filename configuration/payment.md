# Payment Gateways

Mentor LMS supports multiple payment gateways to process course purchases. This page guides you through setting up each supported payment processor.

## Accessing Payment Settings

1. Log in to your admin dashboard
2. Navigate to **Settings** in the sidebar menu
3. Select **Payment Settings** from the dropdown options

## Supported Payment Gateways

Mentor LMS supports the following payment processors:

1. **PayPal**
2. **Stripe**
3. **Mollie**
4. **Paystack**
5. **Razorpay**
6. **SSLCommerz**

You can enable one or multiple payment gateways based on your requirements and geographic location.

## Configuring PayPal

![Payment Settings](/configuration/payment/paypal.png)

1. In the Payment Settings tab, find the PayPal section
2. Toggle **Enable PayPal** to Yes
3. Select the **Mode**:
   - **Sandbox**: For testing (recommended during setup)
   - **Live**: For processing real transactions
4. Enter your PayPal credentials:
   - **Client ID**: Your PayPal API client ID
   - **Secret Key**: Your PayPal API secret key
5. Click **Save Changes**

### Obtaining PayPal API Credentials

1. Log in to [PayPal Developer Dashboard](https://developer.paypal.com/dashboard/)
2. Navigate to **Apps & Credentials**
3. Click **Create App** and provide a name for your application
4. Select the environment (Sandbox or Live)
5. After creation, copy the Client ID and Secret
6. Configure the webhook URL as: `https://your-domain.com/payment/paypal/webhook`

## Configuring Stripe

![Payment Settings](/configuration/payment/stripe.png)

1. In the Payment Settings tab, find the Stripe section
2. Toggle the **Enabled** switch to activate Stripe
3. Configure Test Mode:
   - Toggle **Test Mode** to use test credentials during development
   - When enabled, you'll see "Using Test Keys" indicator
4. Enter your Stripe credentials:
   - **Test Credentials**:
     - **Public Test Key**: Your Stripe test publishable key
     - **Secret Test Key**: Your Stripe test secret key
   - **Live Credentials** (for production use):
     - **Public Live Key**: Your Stripe live publishable key
     - **Secret Live Key**: Your Stripe live secret key
5. Set up Webhook Settings:
   - **Webhook Secret**: Enter your Stripe webhook signing secret
6. Click **Save Changes**

### Obtaining Stripe API Credentials

1. Log in to your [Stripe Dashboard](https://dashboard.stripe.com/)
2. Navigate to **Developers** > **API Keys**
3. Copy your Publishable key and Secret key (both test and live versions)
4. Go to **Developers** > **Webhooks**
5. Create a new webhook endpoint with URL: `https://your-domain.com/payment/stripe/webhook`
6. Select the necessary events (payment_intent.succeeded, payment_intent.failed, etc.)
7. Copy the signing secret to use as Webhook Secret

## Configuring Mollie

![Payment Settings](/configuration/payment/mollie.png)

1. In the Payment Settings tab, find the Mollie section
2. Toggle the **Enabled** switch to activate Mollie
3. Configure Test Mode:
   - Toggle **Test Mode** to use test environment during development
   - When enabled, you'll see "Using Test Environment" indicator
4. Enter your Mollie credentials:
   - **Test API Key**: Your Mollie test API key
   - **Live API Key**: Your Mollie live API key (for production use)
5. Click **Save Changes**

### Obtaining Mollie API Key

1. Log in to your [Mollie Dashboard](https://my.mollie.com/dashboard/)
2. Navigate to **Developers** > **API keys**
3. Copy your API keys (both test and live versions)
4. Set up webhook URL as: `https://your-domain.com/payment/mollie/webhook`

## Configuring Paystack

![Payment Settings](/configuration/payment/paystack.png)

1. In the Payment Settings tab, find the Paystack section
2. Toggle the **Enabled** switch to activate Paystack
3. Configure Test Mode:
   - Toggle **Test Mode** to use test credentials during development
   - When enabled, you'll see "Using Test Keys" indicator
4. Enter your Paystack credentials:
   - **Test Credentials**:
     - **Public Test Key**: Your Paystack test public key
     - **Secret Test Key**: Your Paystack test secret key
   - **Live Credentials** (for production use):
     - **Public Live Key**: Your Paystack live public key
     - **Secret Live Key**: Your Paystack live secret key
5. Click **Save Changes**

### Obtaining Paystack API Credentials

1. Log in to your [Paystack Dashboard](https://dashboard.paystack.com/)
2. Navigate to **Settings** > **API Keys & Webhooks**
3. Copy your Public and Secret keys (both test and live versions)
4. Configure webhook URL as: `https://your-domain.com/payment/paystack/webhook`

## Configuring Razorpay

![Payment Settings](/configuration/payment/razorpay.png)

1. In the Payment Settings tab, find the Razorpay section
2. Toggle the **Enabled** switch to activate Razorpay
3. Select your preferred **Currency** (e.g., Indian Rupee - INR)
4. Configure Test Mode:
   - Toggle **Test Mode** to use test environment during development
   - When enabled, you'll see "Using Test Environment" indicator
   - The form will switch to show test credential fields
5. Enter your Razorpay API credentials:
   - **API Key**: Your Razorpay API key (test or live, depending on Test Mode)
   - **API Secret**: Your Razorpay API secret key (test or live, depending on Test Mode)
   - Helper text will indicate whether to use test or live credentials
6. Click **Save Changes**

### Obtaining Razorpay API Credentials

1. Log in to your [Razorpay Dashboard](https://dashboard.razorpay.com/)
2. Navigate to **Settings** > **API Keys**
3. Click **Generate Key** to create new API credentials (if not already created)
4. Copy your API Key ID and API Secret (both test and live versions)

## Configuring SSLCommerz

![Payment Settings](/configuration/payment/sslcommerz.png)

1. In the Payment Settings tab, find the SSLCommerz section
2. Toggle the **Enabled** switch to activate SSLCommerz
3. Select your preferred **Currency** (e.g., Bangladeshi Taka - BDT)
4. Configure Test Mode:
   - Toggle **Test Mode** to use test environment during development
   - When enabled, you'll see "Using Test Environment" indicator
   - The form will switch to show test credential fields
5. Enter your SSLCommerz credentials:
   - **Store ID**: Your SSLCommerz store ID (test or live, depending on Test Mode)
   - **Store Password**: Your SSLCommerz store password (test or live, depending on Test Mode)
   - Helper text will indicate whether to use test or live credentials
6. Click **Save Changes**

### Obtaining SSLCommerz API Credentials

1. Log in to your [SSLCommerz Dashboard](https://merchant.sslcommerz.com/)
2. For **Test Credentials**:
   - SSLCommerz provides default test credentials for sandbox testing
   - Navigate to **Sandbox** section in your dashboard
   - You can use the provided test Store ID and Store Password
3. For **Live Credentials**:
   - Navigate to **Settings** > **Store Settings**
   - Your Store ID will be displayed in your account information
   - For Store Password, go to **API Credentials** or **Integration** section
   - Copy your Store ID and Store Password

## Testing Payment Gateways

After configuring your payment gateways:

1. Switch to Sandbox/Test mode
2. Create a test course with a price
3. Try purchasing the course using the test credentials
4. Verify the transaction appears in both your payment gateway dashboard and your LMS admin panel

### Test Card Numbers

For testing in sandbox/test mode, use these cards:

- **PayPal Sandbox**: Create test accounts in PayPal Developer Dashboard
- **Stripe Test**: Card number `4242 4242 4242 4242`, any future expiry date, any 3-digit CVC
- **Mollie Test**: Follow Mollie's testing documentation
- **Paystack Test**: Card number `4084 0840 8408 4081`, any future expiry date, any 3-digit CVC
- **Razorpay Test**: Card number `4111 1111 1111 1111`, any future expiry date, any 3-digit CVV
- **SSLCommerz Test**: Use the test cards provided in SSLCommerz sandbox documentation

After configuring your payment gateways, proceed to [SMTP Email Setup](/configuration/smtp) to ensure your system can send transactional emails.
