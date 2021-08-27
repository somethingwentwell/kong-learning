# kong_zipkin

Deploys Kong EE DB and Zipkin


## Docker Image :

Zipkin : https://hub.docker.com/r/openzipkin/zipkin

## How to use

1. Just run `docker-compose up -d`

2. Kong should be able to report spans with below endpoint:
- http://zipkin:9411/api/v2/spans

## Additional feature
