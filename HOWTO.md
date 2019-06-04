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
5. TODO: 