Start Minikube

```
minikube start --vm=true

minikube addons enable ingress

minikube tunnel
```

https://github.com/Kong/charts/blob/main/charts/kong/README.md#hybrid-mode

Provision a namespace

```
kubectl create namespace kong
```

Generate certificates

```
openssl req -new -x509 -nodes -newkey ec:<(openssl ecparam -name secp384r1) \
  -keyout /tmp/cluster.key -out /tmp/cluster.crt \
  -days 1095 -subj "/CN=kong_clustering"
```

Set up cluster cert

```
kubectl create secret tls kong-cluster-cert --cert=/tmp/cluster.crt --key=/tmp/cluster.key -n kong
```

Set up license secret

```
kubectl create secret generic kong-enterprise-license -n kong --from-file=../../license.json
```

Seed the Super Admin password

```
kubectl create secret generic kong-enterprise-superuser-password -n kong --from-literal=password=password
```

Prepare the sessions plugin for Kong Manager and Dev Portal

```
kubectl create secret generic kong-session-config -n kong --from-file=admin_gui_session_conf --from-file=portal_session_conf
```

Set up Helm

```
helm repo add kong https://charts.konghq.com
helm repo update
```

Deploy Kong control plane on Kubernetes

```
sed -i'.original' -e 's/MINIKUBE_IP/'$(minikube ip)'/g' cp-values.yaml

helm install kong-cp kong/kong -n kong --values ./cp-values.yaml

kubectl get po -n kong -w
```

Deploy Kong data plane on Kubernetes

```
sed -i'.original' -e 's/MINIKUBE_IP/'$(minikube ip)'/g' dp-values.yaml

helm install kong-dp1 kong/kong -n kong --values ./dp-values.yaml

kubectl get po -n kong -w
```

Check minikube services

```
minikube service list -n kong
```

Create Ingress

```
sed -i'.original' -e 's/MINIKUBE_IP/'$(minikube ip)'/g' ingress.yaml

kubectl apply -f ingress.yaml
```

List Ingress hosts

```
kubectl get ingress -n kong
```

Clean up

```
helm uninstall kong-cp kong/kong -n kong

helm uninstall kong-dp1 kong/kong -n kong

kubectl delete pvc data-kong-cp-postgresql-0 -n kong
```