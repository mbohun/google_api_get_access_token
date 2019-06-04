#!/bin/bash
# 
# NOTE: This script assumes you set the following env vars:
#       GOOGLE_API_OAUTH_CONF
#       GOOGLE_API_OAUTH_SCOPES
#
GOOGLE_API_REFRESH_TOKEN_FILE=~/.google_api_refresh.token

GOOGLE_CLIENT_ID=`echo $GOOGLE_API_OAUTH_CONF | jq -r '.installed.client_id'`

# TODO: is there an easy way to concatenate all the URIs with %20?
GOOGLE_REDIRECT_URI=`echo $GOOGLE_API_OAUTH_CONF | jq -r '.installed.redirect_uris[0]'`

function get_authorization_code_url {
    local google_auth_uri=`echo $GOOGLE_API_OAUTH_CONF | jq -r '.installed.auth_uri'`
    echo "$google_auth_uri?client_id=$GOOGLE_CLIENT_ID&redirect_uri=$GOOGLE_REDIRECT_URI&scope=$GOOGLE_API_OAUTH_SCOPES&response_type=code&access_type=offline"
}

function get_access_token {
    local google_client_secret=`echo $GOOGLE_API_OAUTH_CONF | jq -r '.installed.client_secret'`

    if [ -z "${1}" ]
    then
	# We are going to use the refresh token (~/.google_api_refresh.token) to get ("refresh")
	# an access token.
	#
	if [ -f "$GOOGLE_API_REFRESH_TOKEN_FILE" ]
	then

	    local refresh_token="`cat $GOOGLE_API_REFRESH_TOKEN_FILE`"
	    curl -s \
		 --data "client_id=${GOOGLE_CLIENT_ID}" \
		 --data "client_secret=${google_client_secret}" \
		 --data "grant_type=refresh_token" \
		 --data "refresh_token=${refresh_token}" \
		 https://www.googleapis.com/oauth2/v4/token | jq -r '.access_token'

	else
	    echo "ERROR: Google API refresh token file ($GOOGLE_API_REFRESH_TOKEN_FILE) not found!"
	    return -1
	fi	
    else
	# We were called with an authorization code so we are going to get a new
	# access and refresh tokens, store the refresh token in a file $GOOGLE_API_REFRESH_TOKEN_FILE
	# and return the access token.
	#
	local authorization_code=${1}
	echo "authorization_code:${authorization_code}"

	local result=`curl -s --data "code=${authorization_code}" --data "client_id=${GOOGLE_CLIENT_ID}" --data "client_secret=${google_client_secret}" --data "redirect_uri=${GOOGLE_REDIRECT_URI}" --data "grant_type=authorization_code" --data "access_type=offline" https://www.googleapis.com/oauth2/v4/token`

	echo $result | jq -r '.refresh_token' > "$GOOGLE_API_REFRESH_TOKEN_FILE"
	echo $result | jq -r '.access_token'
    fi
}

# TODO: add proper (popt) switch/flag handling
#       --authorization-code-url
#       --access-token 4/XQGZjQhjk_xg_Uf6uSehQhGmQRlnzvk61_Bwm0BNee7Nod9rzcfdsG0
#       --access-token

#get_authorization_code_url
get_access_token "${1}"
