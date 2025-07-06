# Google Authentication

Enabling Google Authentication allows users to sign up and log in to your Mentor LMS using their Google accounts. This provides a convenient login option and can increase user registrations.

## Accessing Google Auth Settings

1. Log in to your admin dashboard
2. Navigate to **Settings** in the sidebar menu
3. Select **Social Login Settings** from the dropdown options

![Google Auth Settings](/configuration/settings-auth0.png)

## Setting Up Google OAuth

### Step 1: Create a Google Cloud Project

1. Go to the [Google Cloud Console](https://console.cloud.google.com/)
2. Click on the project dropdown at the top left corner and select **New Project**
3. Enter a name for your project and click **Create**
4. Select your newly created project from the project dropdown

### Step 2: Configure the OAuth Consent Screen

1. In the Google Cloud Console, navigate to **APIs & Services** > **OAuth consent screen**
2. Select **External** user type (unless you're using Google Workspace)
3. Fill in the required application information:
   - App name: Your LMS name
   - User support email: Your support email
   - Developer contact information: Your email address
4. Click **Save and Continue**
5. Add scopes (at minimum, select `email` and `profile`)
6. Click **Save and Continue**
7. Add test users if you're in testing mode
8. Click **Save and Continue**

### Step 3: Create OAuth Credentials

1. In the Google Cloud Console, navigate to **APIs & Services** > **Credentials**
2. Click **Create Credentials** and select **OAuth client ID**
3. For Application type, select **Web application**
4. Provide a name for your OAuth client
5. Add authorized JavaScript origins (the domain where your LMS is hosted):
   ```
   https://your-domain.com
   ```
6. Add authorized redirect URIs (the URL Google will redirect to after authentication):
   ```
   https://your-domain.com/auth/google/callback
   ```
7. Click **Create**
8. A popup will appear showing your **Client ID** and **Client Secret** - save these values
   (You can always view them later by clicking the edit icon next to your OAuth client ID)

### Step 4: Configure Your LMS

1. Return to the Mentor LMS admin dashboard
2. In **Social Login Settings**, toggle **Enable Google Login** to Yes
3. Enter your Google OAuth credentials:
   - **Client ID**: Your Google OAuth client ID
   - **Client Secret**: Your Google OAuth client secret
   - **Callback URL**: This should be pre-filled with the correct URL
4. Click **Save Changes**

## Testing Google Authentication

After configuring Google Auth:

1. Log out of your admin account
2. Go to the login page of your LMS
3. You should see a "Login with Google" button
4. Click the button and attempt to log in with a Google account
5. Verify that the authentication process completes successfully

## Troubleshooting Google Auth

If you encounter issues with Google Authentication:

1. **Verify Credentials**: Double-check your Client ID and Client Secret
2. **Check Redirect URI**: Ensure the callback URL in Google Console exactly matches your LMS configuration
3. **OAuth Consent Screen**: Make sure you've completed the OAuth consent screen setup
4. **API Enabled**: Ensure the Google+ API or Google People API is enabled in your Google Cloud project
5. **Https Required**: Google OAuth requires HTTPS for production applications
6. **Verify Domain**: If using domain verification, ensure your domain is properly verified
7. **Published Status**: If your app is in "Testing" status, only authorized test users can log in

## Security Considerations

When implementing Google Authentication:

1. **Store Credentials Securely**: Never expose your Client Secret in client-side code
2. **Request Minimal Scopes**: Only request the user data you actually need
3. **Privacy Policy**: Update your privacy policy to reflect data collected via Google Auth
4. **Regular Audits**: Periodically review who has access to your Google Cloud project
5. **Monitor Usage**: Check for any unusual authentication patterns
