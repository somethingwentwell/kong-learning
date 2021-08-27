# Rate Limit plugin

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
# 1st try in 1 min
$ curl -i http://localhost:8000/test -H apikey:aaa

HTTP/1.1 200 OK
Content-Type: application/json
Content-Length: 651
Connection: keep-alive
X-RateLimit-Remaining-Minute: 4
RateLimit-Limit: 5
RateLimit-Remaining: 4
RateLimit-Reset: 54
X-RateLimit-Limit-Minute: 5
Date: Fri, 25 Jun 2021 06:15:07 GMT
Server: gunicorn/19.9.0
Access-Control-Allow-Origin: *
Access-Control-Allow-Credentials: true
X-Kong-Upstream-Latency: 742
X-Kong-Proxy-Latency: 117
Via: kong/2.4.1.1-enterprise-edition

...


# 6th try in 1 min
$ curl -i http://localhost:8000/test -H apikey:aaa

HTTP/1.1 429 Too Many Requests
Date: Fri, 25 Jun 2021 06:15:16 GMT
Content-Type: application/json; charset=utf-8
Connection: keep-alive
Retry-After: 44
X-RateLimit-Remaining-Minute: 0
RateLimit-Limit: 5
RateLimit-Remaining: 0
RateLimit-Reset: 44
X-RateLimit-Limit-Minute: 5
Content-Length: 41
X-Kong-Response-Latency: 1
Server: kong/2.4.1.1-enterprise-edition

{
  "message":"API rate limit exceeded"
}
```
