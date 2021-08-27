# Forward-proxy  plugin

## `kong-pose` requirements

```
kong-squid
```


## Deploying using Deck

Run command:

deck sync -s kong.yaml --headers kong-admin-token:admin

## Test

```
$ curl -v http://localhost:8000/proxy | jq .
HTTP/1.1 200 OK
Access-Control-Allow-Credentials: true
Access-Control-Allow-Origin: *
Connection: keep-alive
Content-Type: application/json
Date: Tue, 22 Jun 2021 04:08:21 GMT
Server: gunicorn/19.9.0
Transfer-Encoding: chunked
Via: kong/2.4.1.1-enterprise-edition
X-Cache: MISS from d00f7f9b54ee
X-Cache-Lookup: HIT from d00f7f9b54ee:3128
X-Kong-Proxy-Latency: 0
X-Kong-Upstream-Latency: 0

{
    "args": {},
    "data": "",
    "files": {},
    "form": {},
    "headers": {
        "Accept": "*/*",
        "Accept-Encoding": "gzip, deflate",
        "Cache-Control": "max-age=259200",
        "Host": "httpbin.org",
        "If-Modified-Since": "Tue, 22 Jun 2021 04:08:18 GMT",
        "User-Agent": "HTTPie/2.4.0",
        "X-Amzn-Trace-Id": "Root=1-60d16235-19e685a51cce091418aea106",
        "X-Forwarded-Host": "10.0.0.5"
    },
    "json": null,
    "method": "GET",
    "origin": "10.0.0.1, 10.0.0.5, 202.186.62.68",
    "url": "http://10.0.0.5/anything"
}


```

Check squid access log

```
[~] docker exec -it squid tail /var/log/squid/access.log -f                                                                  
1624334831.506    248 10.0.0.5 TCP_REFRESH_MODIFIED/200 882 GET http://httpbin.org/anything - HIER_DIRECT/54.166.163.67 application/json
1624334834.713    249 10.0.0.5 TCP_REFRESH_MODIFIED/200 882 GET http://httpbin.org/anything - HIER_DIRECT/54.166.163.67 application/json
1624334837.866    412 10.0.0.5 TCP_REFRESH_MODIFIED/200 882 GET http://httpbin.org/anything - HIER_DIRECT/54.166.163.67 application/json
1624334845.784    248 10.0.0.5 TCP_REFRESH_MODIFIED/200 882 GET http://httpbin.org/anything - HIER_DIRECT/54.166.163.67 application/json
1624334852.955    261 10.0.0.5 TCP_REFRESH_MODIFIED/200 882 GET http://httpbin.org/anything - HIER_DIRECT/54.166.163.67 application/json
1624334891.985    524 10.0.0.5 TCP_REFRESH_MODIFIED/200 882 GET http://httpbin.org/anything - HIER_DIRECT/52.201.75.114 application/json
1624334893.997    258 10.0.0.5 TCP_REFRESH_MODIFIED/200 882 GET http://httpbin.org/anything - HIER_DIRECT/52.201.75.114 application/json
1624334896.255    259 10.0.0.5 TCP_REFRESH_MODIFIED/200 882 GET http://httpbin.org/anything - HIER_DIRECT/52.201.75.114 application/json
1624334898.855    405 10.0.0.5 TCP_REFRESH_MODIFIED/200 882 GET http://httpbin.org/anything - HIER_DIRECT/52.201.75.114 application/json
1624334901.875    258 10.0.0.5 TCP_REFRESH_MODIFIED/200 882 GET http://httpbin.org/anything - HIER_DIRECT/52.201.75.114 application/json



1624335262.212    532 10.0.0.5 TCP_REFRESH_MODIFIED/200 882 GET http://httpbin.org/anything - HIER_DIRECT/52.201.75.114 application/json

```

