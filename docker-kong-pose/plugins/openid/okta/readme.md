## Sample OpenID plugin with Okta  ##

This will configure a global OpenID connect plugin using only the 'bearer' auth method. 

This deck file will create the following entities: 

- 1 Service to 'httpbin.org/anything'
- 2 Routes
- Openid Plugin configured Globally 

Before using this deck file change the following issuer endpoint to match the domain of your Okta instance- 
``` 
issuer: https://dev-<domain>-admin.okta.com/oauth2/default/.well-known/openid-configuration
```

To test the configuration : 
1. Get a token from Okta 
```
curl --request POST \
  --url 'https://dev-<domain>.okta.com/oauth2/default/v1/token?=' \
  --header 'content-type: application/x-www-form-urlencoded' \
  --data client_id=<CLIENT_ID> \
  --data client_secret=<CLIENT_SECRET> \
  --data grant_type=client_credentials
```
2. Make a request with that access token to the '/oidc' route. 
```
curl --request GET \
  --url http://localhost:8000/oidc \
  --header 'authorization: Bearer <TOKEN>'

```

