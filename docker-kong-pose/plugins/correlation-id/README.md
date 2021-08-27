# Correlation ID plugin

## `kong-pose` requirements

```
environment/docker-kong-pose/deployments/kong_postgres
```

## Deploying using Deck

```
deck sync -s kong.yaml --headers kong-admin-token:admin
```

## Test

```
$ curl -i http://localhost:8000/test

HTTP/1.1 200 OK
Content-Type: application/json
Content-Length: 526
Connection: keep-alive
Date: Wed, 23 Jun 2021 08:28:48 GMT
Server: gunicorn/19.9.0
Access-Control-Allow-Origin: *
Access-Control-Allow-Credentials: true
X-Kong-Upstream-Latency: 1504
X-Kong-Proxy-Latency: 299
Via: kong/2.3.2.0-enterprise-edition

{
  "args": {},
  "data": "",
  "files": {},
  "form": {},
  "headers": {
    "Accept": "*/*",
    "Host": "httpbin.org",
    "Kong-Request-Id": "056189e3-6b3d-4595-b69c-02febfe6e392#1",
    "User-Agent": "curl/7.76.0",
    "X-Amzn-Trace-Id": "Root=1-60d2f0bf-4bcd78522b9263960d4ae438",
    "X-Forwarded-Host": "localhost",
    "X-Forwarded-Path": "/test",
    "X-Forwarded-Prefix": "/test"
  },
  "json": null,
  "method": "GET",
  "origin": "10.0.0.1, 175.177.45.138",
  "url": "https://localhost/anything"
}

Response body contains: "kong-request-id": "056189e3-6b3d-4595-b69c-02febfe6e392#1"
```
