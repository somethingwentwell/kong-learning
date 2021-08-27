# kong_vault

Deploys Kong EE DB and Vault


## Docker Image :

Vault : https://hub.docker.com/_/vault

## How to use

1. Run `docker-compose up -d`

2. Access http://localhost:8200/ui/vault/secrets by web browser,
Sign in with following:
Login method: Token, Token: vault

3. Create mount and path in Vault.
Click "Enable new engine", select "KV", click "next", input "Path" as "kong", click "Enable Engine".
Click "Create secret", input "Path for this secret" as "test", click "Save".

4. Execute below command and check the response is 204

```
$ curl -i -s -X POST localhost:8001/keyring/vault/sync
HTTP/1.1 204 No Content
Date: Wed, 16 Jun 2021 02:44:25 GMT
Connection: keep-alive
Access-Control-Allow-Origin: *
X-Kong-Admin-Request-ID: 9B35TMZpDZR6Twh7w2cTNFzKefSFjD6A
vary: Origin
X-Kong-Admin-Latency: 1092
Server: kong/2.4.1.1-enterprise-edition
```

## Additional feature

