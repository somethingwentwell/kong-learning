## Request Transformer Advanced Templating ##

The acommpanying deck file will configures a route, service, and  request transformer advanced plugin. This example demonstrates the use of templating in the route entitiy to be used in the request transformer adv. plugin. 

The route entity can have a path defined with templating in mind, for example :
```
path : /serviceteam/(?<group>(?!health\\b)\\b\\w+)
```

In the request transformer advanced plugin references the templated portions of the route path. 

For example :
```
config.replace.uri : /anything/service/api/$(uri_captures.group)
```

The above configuration would result in an incoming request of /serviceteam/health3  → /anything/service/api/health3

Relevant documentation: https://docs.konghq.com/hub/kong-inc/request-transformer-advanced/#template-as-value
