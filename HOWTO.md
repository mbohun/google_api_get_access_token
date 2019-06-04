1. TODO: setup Google OAUTH2.0 app 
2. save the JSON credentials
   ```JSON
   {
       "installed": {
           "client_id": "REMOVED CLIENT ID",
           "project_id": "REMOVED PROJECT ID",
           "auth_uri": "https://accounts.google.com/o/oauth2/auth",
           "token_uri": "https://oauth2.googleapis.com/token",
           "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
           "client_secret": "REMOVED CLIENT SECRET",
           "redirect_uris": [
               "urn:ietf:wg:oauth:2.0:oob",
               "http://localhost"
           ]
       }
   }
   ```
3. Export the JSON credentials into an env var `GOOGLE_API_OAUTH_CONF`:
   ```BASH
   export GOOGLE_API_OAUTH_CONF="`cat credentials.json`"
   ```
4. Set the OAUTH scopes you want to use:
   ```BASH
   export GOOGLE_API_OAUTH_SCOPES="https://www.googleapis.com/auth/photoslibrary"
   ```
5. Get the authorization URL:
   ```BASH
   ./google_api_get_access_token.sh -u
   https://accounts.google.com/o/oauth2/auth?client_id=803537807130-07i8be23f46esl6tffrg0bebfe2e9c5f.apps.googleusercontent.com&redirect_uri=urn:ietf:wg:oauth:2.0:oob&scope=https://www.googleapis.com/auth/photoslibrary&response_type=code&access_type=offline
   ```
6. Copy and paste the authorization URL into a browser and do all the consent confirmations, that will give you the at the end an authorization code:
   ![Alt text](https://gist.githubusercontent.com/mbohun/81df9a27e90846ba913871b04d762c4f/raw/98963a5e0d7d36c69eb910d1e89c3064e59d2930/google_api_oauth2.0_authorization-00.png "")
   ![Alt text](https://gist.githubusercontent.com/mbohun/81df9a27e90846ba913871b04d762c4f/raw/98963a5e0d7d36c69eb910d1e89c3064e59d2930/google_api_oauth2.0_authorization-01.png "")
   ![Alt text](https://gist.githubusercontent.com/mbohun/81df9a27e90846ba913871b04d762c4f/raw/98963a5e0d7d36c69eb910d1e89c3064e59d2930/google_api_oauth2.0_authorization-02.png "")
   ![Alt text](https://gist.githubusercontent.com/mbohun/81df9a27e90846ba913871b04d762c4f/raw/98963a5e0d7d36c69eb910d1e89c3064e59d2930/google_api_oauth2.0_authorization-03.png "")
7. Use the authorization code to get the access token; this operation will as well get and save the refresh token that will be used in all subsequent operations:
   ```BASH
   ./google_api_get_access_token.sh -t 4/XQHOy_jiWWVC9CIQE6KjAk-yPTqdv63IPtvZGkoxSjvxD7afu_ORXwQ
   ya29.GlscB7ThzEzFMbBSTv6erE5DIfYjpxO2LusrpFE-SmUB6iEYZOf7OVcAlmFv0eMiuyKr6o-lL_23qiTus3HNDlR3lvH3dncMEn2Oa5-UIPWzCKvnq670v65lFeXd
   ```
8. From here on (until it's invalidation) we will use the refresh token:
   ```BASH
   ./google_api_get_access_token.sh -r
   ya29.GlscB849chO8jINU4Si4Obz0ygUh6E2Z-5IzQqUOqIDmbrcqDR2bYC_j3TkpXGBirMsO8boDJfm5Ix66C5UowiJzJatGzWpa3_7AAWFh-Vqw5gJNa_uyO94CHKMw
   
   ./google_api_get_access_token.sh -r
   ya29.GlscB2iTjsOahR6fxVkjucvdseD6frw6bbSGOMQOfWU117nXQpWPnFgovCk3krq7p3loav2xn7piBmGrOH0D-uux162GvfUvYaiGeOB4140qxbze11LGYGOFpxzQ
   
   ./google_api_get_access_token.sh -r
   ya29.GlscB_HNAm6iN22f-_VJQiGyC5SiIJbbwFzeuUIgu-S2oITeJcGMGTMX85dWiJ9erK3gg32QBGVDt43MB8zF9REbbrcUv7b-4nsg3_PfJqOsYRombmYGZYjIdqU-
   ```
