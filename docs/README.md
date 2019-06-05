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

   ![Alt text](https://raw.githubusercontent.com/mbohun/google_api_get_access_token/master/docs/images/google_api_oauth2.0_authorization-00.png "test")
   
   ![Alt text](https://raw.githubusercontent.com/mbohun/google_api_get_access_token/master/docs/images/google_api_oauth2.0_authorization-01.png "test")
   
   ![Alt text](https://raw.githubusercontent.com/mbohun/google_api_get_access_token/master/docs/images/google_api_oauth2.0_authorization-02.png "test")
   
   ![Alt text](https://raw.githubusercontent.com/mbohun/google_api_get_access_token/master/docs/images/google_api_oauth2.0_authorization-03.png "test")
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

### Examples usage with the [Google Photos APIs](https://developers.google.com/photos/?refresh=1)

#### [albums.list](https://developers.google.com/photos/library/reference/rest/v1/albums/list?refresh=1)
```BASH
curl -s \
     -X GET \
     -H 'Content-type: application/json' \
     -H "Authorization: Bearer `./google_api_get_access_token.sh -r`" \
     https://photoslibrary.googleapis.com/v1/albums | jq '.albums[]|.title'
```
```JSON
[
  "TEST-03 API album.create",
  "Skeletal remains, Tuggeranong Hill, ACT",
  "Tuggeranong Hill, ACT ",
  "Most Exciting Tree Stumps Of Tuggeranong (volume 64)",
  "Drain details, Tuggeranong Hill, ACT ",
  "Tree sap, Tuggeranong Hill, ACT ",
  "Bush tomato (Solanum sp.), Tuggeranong Hill, ACT",
  "Tuggeranong Hill, ACT ",
  "Datura sp.,Tuggeranong Hill, ACT ",
  "Another day, another mouse",
  "TEST album.create from API",
  "Spinach for dinner ",
  "Japanese green tea",
  "TAYLOR MADE Malbec",
  "Becherovka & Slivovica",
  "Mausetot, or is it :-) ? ",
  "Teriyaki neko",
  "Neko & Doodle",
  "Ficus carica, Calwell, ACT"
]
```
```BASH
curl -s \
     -X GET \
     -H 'Content-type: application/json' \
     -H "Authorization: Bearer `./google_api_get_access_token.sh -r`" \
     https://photoslibrary.googleapis.com/v1/albums | jq '[ .albums[]|.id ]'
```
```JSON
[
  "ANABYSgCy3B3GmyXqf6vd7ociNG6dKMt0cnmAhmhwJeO2Vkdpd94EXhkPCMvces9-XHCtQ4-FfSa",
  "ANABYSgUaIbq7MPnuqEZm3731oToYdVjv4gpZurx7TjofePGvtssWUERydPcePikcBJ4Z522ISrc",
  "ANABYSg1IKmtznOKN4-vq0hzWutC1I16usMa4de8sIJGIpvHpUMemW4guA5y_YiIN7_gBC2sHn2u",
  "ANABYSj7YAgxJzVM5TphWzjTTsY6pHRKGJktELhbUY1ly5yaUBLN9fV2rY6fGdiIkIMIdMIxziYB",
  "ANABYSjfDpdqNDI_ggpakdlKNbRgFitnLmh4JEyc3d7agjDfUIwOrO8Yvgqr2JjWd8ExBCn2MdGZ",
  "ANABYSgtLxjpxUnzf39f6P27-0VNMW4ITXs2rcnKL-wEeDpAsSW4kCufV0wvTRN-aU3ml7MTGp-U",
  "ANABYSjvDJ6DJRnr6QMZqmfbns4prycC29i4BTZSKyT9OzgpWjrvQEJiKwwGS6kXmCXVFNCwnYO-",
  "ANABYShY5tslFc1g9Bn2x-CnmsLR4SbUF32D5ulX4roIdu6ppa7tUIymD438QOr97DCpFtg_RPxF",
  "ANABYSghVJ5GruYPSSGg0sD1_4jFJGobUBupmV8K9thfRo0W40A6klyjjLCX_wKby23-nqo9vd0z",
  "ANABYSgLQXG-BZNQcawCEyyzhYQpewg3E4c5v9OCGZgRz0Z7kFD_f394T4Wl4q5_QoC6xjIr53a1",
  "ANABYSi7b-2mDv_g94L0PW1NZwuOyKWaskUfYbG-iSBnhOzliK6CrNYp8T06EcTYjJ1Spi-GWOoF",
  "ANABYSgfkF2taHbjE2zP5iiwCxCuFy-MrYp7pDodIGGVZYs8PaKXmB7UUoYJ5nTfPtPUiTXgh9-W",
  "ANABYSiK4i7iTgK4A-l3EMEippHoybznR5rHw3EdX8lTABGA94onbykGr33yr8liJt36ETrTKXsh",
  "ANABYSiuBJ0pStjhA4bJKqb5sYtDR4bnYi91E6JT9djJxHrQ2a2de9CzNxwwUGasFakbNGaxvKcl",
  "ANABYSjQ-B5HaBsgn-ryRs4Nx1xaB_EU4DAk2gCjneMxAnxgZfQa5x8FTLXRlfrkudl1x60neeJs",
  "ANABYShgLArLd5c33asYKuiwrmolAjC2lmpMTQ82aZ_2rBRGSJTngQaQAMVDwnb0RYKMGEKH11Kp",
  "ANABYSj22YkcA3IGqmQ9JMVM_c2-R_r81w0lSr0v46A9Ss08mIzSqaj53sjwo-f33dL4Al64j_f6",
  "ANABYSheIcNJB2V3Guy2j8ZXLfE8DuIdihqYxBsC_VfsTdmw4UzTmT9f2uDX7v__5GZijcyhZRkn",
  "ANABYShe1PXxS9kv_pT-dEcAVdB1c1KD1amwbPppulp9OZ-sTdwOPv1IIULMGpS8NEOGzEEIHab4"
]
```

#### [albums.get](https://developers.google.com/photos/library/reference/rest/v1/albums/get?refresh=1)
```BASH
curl -s \
     -X GET \
     -H 'Content-type: application/json' \
     -H "Authorization: Bearer `./google_api_get_access_token.sh -r`" \
     https://photoslibrary.googleapis.com/v1/albums/ANABYSjvDJ6DJRnr6QMZqmfbns4prycC29i4BTZSKyT9OzgpWjrvQEJiKwwGS6kXmCXVFNCwnYO- | jq '.'
```
```JSON
{
  "id": "ANABYSjvDJ6DJRnr6QMZqmfbns4prycC29i4BTZSKyT9OzgpWjrvQEJiKwwGS6kXmCXVFNCwnYO-",
  "title": "Bush tomato (Solanum sp.), Tuggeranong Hill, ACT",
  "productUrl": "https://photos.google.com/lr/album/ANABYSjvDJ6DJRnr6QMZqmfbns4prycC29i4BTZSKyT9OzgpWjrvQEJiKwwGS6kXmCXVFNCwnYO-",
  "mediaItemsCount": "21",
  "coverPhotoBaseUrl": "https://lh3.googleusercontent.com/lr/AGWb-e5qqgj58M9oQ7ZF-nApgoTc2UQPECq4sGM07COk-Y4mZiswev1lTbxTlU0ZG5u00mN0PMqYcpR5QU09sTi-q0yZQEdYLn96gzbb2H2BOCS_uFtlI4f_FQHE8LH_YzMtnFe8xF5NBGIU_y_aZebj4HsQKy6Jw5yh6NT1FX7C3kwVGqE0ckyLu-Eh3sMDR1ilGOkqUkrGibRuCpEY8BdGiPk0JO8OsTDlxH976qnV3vCV2k2TliJmUxH-jSIaQoHnJkAwhpVhnISrrVDhsfqzhu9yhxJOA5KpE11wzXuNMol8qb8eDjxxNed9CLkGad14i5Afq8RFTxCcPtX6qBieSt8Uo8_c2TLw1vnr65bIlkViCdzENtAaSwf3qLDZyM_d41WPm3PUVFrGaFqxbpFmS0YhidsFdLcgUv8qPEJVuIWfZX3XL2V0MsJjsr1Ekz9HegPx7ietsrbjwN1WZaTvGZEixZECkyx_BxCF40Wd3VrG4XnD_qHZSNkN7AcVlhkQG_hT7dutH9_oeCNEjw_lSDb9BQGTyTBuy57IuuhONMuSWwvXHlMWJELOI6IkgljSdtZBnMxSuoCxZIFgXT3ZjpEJRC3Yrwlu4TJM84xKodAsVbgoIX6dh1tjj2vYcQ3vVMbBMLBt1EeGXJr0_-Pw6FufDTgL1q1sLuCayHf4kiiKlMXPzyGOTBWIuyRVu3F_3Unxq9rJYhpWpnDZ8A8RcHD7M5__AaeQ_v28aeIqYWZ_ZL6V1L_jNy5QMe4TCxSpLj_K-jNsq1NYYTO6cxWHisdiGdFoKhGkNJWi5AlAzabnaQUJyHCMWXCDp6530TXJZ_R8LhLVHKP4-UlEoyqPVLQe2e9FXluAvV_yJHaCwEmICmSpbwfivnXNZByGzBXnGlOh-dIp",
  "coverPhotoMediaItemId": "ANABYShgGfa__jyB2AwRzldN-p15_R6YrNVCv4sFNRJxjrlDoLLzcOWLLcsEXcSXBRSSb-lTlCm5aAtkLA3f5xoevMkuvQA1xQ"
}
```

#### [mediaItems.get](https://developers.google.com/photos/library/reference/rest/v1/mediaItems/get?refresh=1)
```BASH
curl -s \
     -X GET \
     -H 'Content-type: application/json' \
     -H "Authorization: Bearer `./google_api_get_access_token.sh -r`" \
     https://photoslibrary.googleapis.com/v1/mediaItems/ANABYShgGfa__jyB2AwRzldN-p15_R6YrNVCv4sFNRJxjrlDoLLzcOWLLcsEXcSXBRSSb-lTlCm5aAtkLA3f5xoevMkuvQA1xQ | jq '.'
```
```JSON
{
  "id": "ANABYShgGfa__jyB2AwRzldN-p15_R6YrNVCv4sFNRJxjrlDoLLzcOWLLcsEXcSXBRSSb-lTlCm5aAtkLA3f5xoevMkuvQA1xQ",
  "productUrl": "https://photos.google.com/lr/photo/ANABYShgGfa__jyB2AwRzldN-p15_R6YrNVCv4sFNRJxjrlDoLLzcOWLLcsEXcSXBRSSb-lTlCm5aAtkLA3f5xoevMkuvQA1xQ",
  "baseUrl": "https://lh3.googleusercontent.com/lr/AGWb-e7JE5MqaRNrmZVHBU3DFD0cwF5UndxFaa7CnXHsOejw36qOCNmTkBviTTCtCMxihrriJtTlKah0_lTIpwPRRmt8ev_NJuoXVT0Dw-51MajsuWhzGFATYvpG7p36M2lyYPrkgHqDW-UUWOF3UmNt7-J0FUNGUNy1jZ8gErRV5z5dz8AnE3RncSXvwcI0_8du9WPEbZgLUMVBPLwze4t15efKV8Jy2txWZdG2xRf_NOiMGmnT0QLcvGcQKWypIOOTH4sh7Nd-pXLNuIj6TwJLgmgWGDB2p2Q9UBfl_QG966naZK0AR-VUJaMkL6poVEIYEGUTjy_XDZnwdFg9zyRlgy39-RHLT_sK2H9e4I3mXD5XCoNhAlJTzOHummr79qYJJ1sjiISYjMXL2Z4QTUNahdYu56WYqEeuGhkEaIzpylTbHxnSSMtds-3IQBOf7sHNub7Q8dCNmb5XWoYxsLnkdsZ2di4MPdFlZIzg8gFz7QkkfTD_KQjADaflR66grVESAPACowHZBr8eF-E0xHVN1Qn97hgRojxQ46Aa-nQNB78UIeKpaU5GUS1hgIlJq5tx1hrxE-RFv0ohjsXGxD5Iem856R6FWfpprCn0E4KxVDhx3urOzlK-Q1w8vhW87zZZ8NrOzGPmrhm0KW7RS4nROueGteUtJ5Y18ox_8JmeFX1mumDAhCEByqeqe75aa1I_CPfV6JdRR7HROwCCgmbxKpDy5w4VtdywBSgB31cSO3LEWMSxzK4syDAr5mO_soAxuiIFEhkPF0cHwRBde39zkhkviHEgLlvaJv31Q7a7tq1LFvxELgVQo5cwu0l1rO8S75fHf1MZKSJ0QEVpNGQnoN0WorqD1BDymXeBvkGROxjX4RzXO49zeEuz4HnOBVkdVlba38az",
  "mimeType": "image/jpeg",
  "mediaMetadata": {
    "creationTime": "2019-05-04T06:16:38Z",
    "width": "4608",
    "height": "3456",
    "photo": {
      "cameraMake": "HUAWEI",
      "cameraModel": "ANE-LX2J",
      "focalLength": 3.81,
      "apertureFNumber": 2.2,
      "isoEquivalent": 64
    }
  },
  "filename": "IMG_20190504_161638.jpg"
}
```

### REFERENCES
- [Google API Console](https://console.developers.google.com/?refresh=1)
- [Google Photos Library API](https://developers.google.com/photos/library/reference/rest/?refresh=1)
- [Google Photos Library API Scopes](https://developers.google.com/photos/library/guides/authentication-authorization?refresh=1#OAuth2Authorizing)
- [Using one of your Google "Brand Accounts" instead of the default account](https://stackoverflow.com/posts/45106136/revisions)
- TODO
