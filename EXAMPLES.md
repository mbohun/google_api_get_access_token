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
