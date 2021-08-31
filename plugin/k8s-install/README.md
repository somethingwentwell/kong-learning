https://docs.konghq.com/kubernetes-ingress-controller/1.3.x/deployment/minikube/

Start Kong K8s

```
minikube start --vm=true

kubectl create ns kong

helm install my-kong kong/kong -n kong --set ingressController.installCRDs=false --values values.yaml

export PROXY_IP=$(minikube service -n kong my-kong-kong-proxy --url | head -1)
```

Test Kong Ingress

```
kubectl apply -f echo.yaml

kubectl apply -f kong-ingress.yaml

curl -i $PROXY_IP/foo

kubectl apply -f request-id.yaml

curl -i -H "Host: example.com" $PROXY_IP/bar/sample

kubectl apply -f rate-limiting.yaml 

kubectl patch svc echo \
  -p '{"metadata":{"annotations":{"konghq.com/plugins": "rl-by-ip\n"}}}'

curl -I $PROXY_IP/foo
```

https://docs.konghq.com/kubernetes-ingress-controller/1.3.x/guides/setting-up-custom-plugins/

Create custom plugin with config map

```
kubectl create configmap kong-plugin-myheader --from-file=myheader -n kong

kubectl apply -f custom-plugin.yaml -n kong

kubectl patch svc echo \
  -p '{"metadata":{"annotations":{"konghq.com/plugins": "my-custom-plugin\n"}}}'

curl -I $PROXY_IP/foo
```

