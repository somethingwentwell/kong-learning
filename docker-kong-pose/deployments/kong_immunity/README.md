# kong_immunity

Deploys Kong EE DB and Immunity


## Docker Image :

Immunity : https://hub.docker.com/r/kong/immunity
Redis : https://hub.docker.com/_/redis/

## How to use

1. Run `docker-compose up -d`


2. Confirm Immunity can access Kong

```
curl -X GET --url http://localhost:5000/status
{
  "immunity": {
    "available": true,
    "version": "4.1.0"
  },
  "kong_status": {
    "is_collector_plugin_bundled": true,
    "url": "http://kong-ent:8001",
    "version": "2.4.1.1-enterprise-edition"
  }
}
```

3. Enable collector plugin in Kong and confirm Kong is connected with Immunity

```
curl -X POST localhost:8001/default/plugins \
    -d name=collector \
    -d config.http_endpoint=http://collector:5000


curl localhost:8001/default/collector/status
    {
  "immunity": {
    "available": true,
    "version": "4.1.0"
  },
  "kong_status": {
    "is_collector_plugin_bundled": true,
    "url": "http://kong-ent:8001",
    "version": "2.4.1.1-enterprise-edition"
  }
}
```

## Additional feature

#### How to generate model in Immunity quickly

1. Create service and route for testing

```
curl http://localhost:8001/services -d "name=httpbin" -d "url=http://httpbin.org/anything"
curl http://localhost:8001/services/httpbin/routes -d "paths[]=/test"
```

2. Send requests to Kong

```
TZ="UTC+0:00" date;for i in `seq 1 180`; do curl -s -i http://localhost:8000/test | grep HTTP; sleep 1; done;TZ="UTC+0:00" date;

Thu Jun 17 04:39:51 UTC 2021
HTTP/1.1 200 OK
HTTP/1.1 200 OK
...
HTTP/1.1 200 OK
Thu Jun 17 04:43:33 UTC 2021
```

3. Trigger training in Immunity manually


```
# Please replace the start time and end time of step 2 in below command
curl -d '{"start":"2021-06-17 04:39:51", "end":"2021-06-17 04:43:33"}' \
 -H "Content-Type: application/json" \
 -X POST http://localhost:5000/trainer
{
  "result": "training started"
}

# check training result
curl -X GET --url http://localhost:5000/monitoredendpoints
[
  {
    "active_models": [
      "traffic",
      "latency_ms",
      "statuscode",
      "value_type",
      "abnormal_value",
      "unknown_parameters"
    ],
    "base_url": "localhost:8000/test",
    "method": "GET",
    "workspace_id": "d7f2f15e-1a6a-4010-9208-cea50a71daaf",
    "workspace_name": "default"
  }
]
```
