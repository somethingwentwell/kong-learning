## Rate Limiting Adv. Plugin with Redis

Prerequisite: 
A Kong and Redis instance . Please see the /environment/docker-compose/2130-and-redis/  docker-compose in this repository for the values used in this configuration. 

This deck file will create the following entities : 
- 1 Service and 1 Route
- 1 Key-Auth plugin
- 3 Consumers and associated key auth credentials
- 3 Rate Limiting Adv. plugins 

To push this configuration to your Kong instance:  
```
deck sync -s ratelimitredis.yaml 
```

##### Note : If you wish to do another deck dump from this file after modification , make sure to include the "--with-id" flag so that the consumer ids remain constant


To Test: 

1. ``` http :8001/limit apikey:test```
This consumer is configured as the 'scoped' for one of the plugins, therefore it has its own rate limit of '1'.  

2. ``` http :8001/limit apikey:test2```
This consumer is configured as the 'scoped' for another of the plugins, therefore it has its own rate limit of '2'. 

3. ``` http :8001/limit apikey:test3```
This consumer is NOT configured in any of the plugins, theirfor it will simply incriment the overall route/service scoped plugin with limit '20'. 


To Confirm in Redis: 
1. Execute into the running redis container
``` 
docker exec -it redis-container /bin/sh
```
2. Use the redis-cli to access the redis instance
```
 redis-cli
```
3. Retrieve all of the keys 
 ```
  keys * 
 ```
4. Do a 'hgetall' on the key from the result above. You will see the 3 consumers that we have configured and which we have used against the route/service. In this case we have only hit the route with each consumer once. 
```
127.0.0.1:6379> hgetall 1600988100:60:DFfqJBTI2rs879SRbiZee5uK829krCOO
1) "157ad987-9d50-41d9-9ec9-a242e8e56320"
2) "1"
3) "81414cbd-7ee3-4eb5-bde0-2c638ebb381e"
4) "1"
5) "2fc35a0d-1821-460e-a6a5-2514e888c37b"
6) "1"
```
