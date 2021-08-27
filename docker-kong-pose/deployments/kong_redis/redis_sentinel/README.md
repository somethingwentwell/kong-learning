# kong_redis_sentinel

Deploys Kong EE DB and Redis Sentinel


## Docker Image :

Redis : https://hub.docker.com/r/bitnami/redis
Redis Sentinel: https://hub.docker.com/r/bitnami/redis-sentinel/

## How to use

1. Just run `docker-compose up --scale redis-sentinel=3 -d`

2. You should be able to access the redis with redis-cli as below

```
# Access redis master to write/read data
$ docker exec -it redis-master redis-cli -a 123
>set <key> <value>
>get <key>

# Access redis slave to read data
$ docker exec -it redis-slave redis-cli -a 123
>get <key>

# Access redis sentinel to check the master/slave
$ docker exec -it redis_sentinel_redis-sentinel_1 redis-cli -p 26379
$ docker exec -it redis_sentinel_redis-sentinel_2 redis-cli -p 26379
$ docker exec -it redis_sentinel_redis-sentinel_3 redis-cli -p 26379
>sentinel masters
>sentinel replicas mymaster
```

## Additional feature
