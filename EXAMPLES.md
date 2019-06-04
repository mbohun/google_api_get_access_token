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
