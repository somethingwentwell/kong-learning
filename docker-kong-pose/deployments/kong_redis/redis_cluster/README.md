# kong_redis/redis_cluster

Deploys Kong EE DB and Redis Cluster (master and slave)


## Docker Image :

Redis : https://hub.docker.com/_/redis/

## How to use

1. Just run `docker-compose up -d`

2. You should be able to check the cluster node info
```
ocker exec -it redis-master-1 redis-cli -p 7001 cluster nodes                                                                                                                                                                                           
2ec614abc58647c37bf9ba61a9becc4f8ae78d65 10.0.0.103:7003@17003 master - 0 1625130704000 3 connected 10923-16383
9b9a783266c5886702ffe15af3a4b9371d6fc3ac 10.0.0.104:7004@17004 slave 2ec614abc58647c37bf9ba61a9becc4f8ae78d65 0 1625130704000 3 connected
ab8fcf00f0efd45df08eeb6f8fd374b495db7b51 10.0.0.106:7006@17006 slave 16f9f5f6eb7c0406b119db1f32580adc9ca46060 0 1625130704511 2 connected
16f9f5f6eb7c0406b119db1f32580adc9ca46060 10.0.0.102:7002@17002 master - 0 1625130705812 2 connected 5461-10922
53a4c16d20c83f5ad4eb4c4fa3b47b74820f0028 10.0.0.105:7005@17005 slave 8517ab85eebc581091b9d818de7a2b7a1d234b3a 0 1625130705000 1 connected
8517ab85eebc581091b9d818de7a2b7a1d234b3a 10.0.0.101:7001@17001 myself,master - 0 1625130704000 1 connected 0-5460

```

## Additional feature

