Start Minikube

```
minikube start --vm=true

minikube addons enable ingress

minikube tunnel
```

https://docs.konghq.com/enterprise/2.5.x/deployment/installation/kong-on-kubernetes/

Provision a namespace

```
kubectl create namespace kong
```

Set up license secret

```
kubectl create secret generic kong-enterprise-license -n kong --from-file=./license
```

Set up Helm

```
helm repo add kong https://charts.konghq.com
helm repo update
```

Seed the Super Admin password

```
kubectl create secret generic kong-enterprise-superuser-password -n kong --from-literal=password=password
```

Prepare the sessions plugin for Kong Manager and Dev Portal

```
kubectl create secret generic kong-session-config -n kong --from-file=admin_gui_session_conf --from-file=portal_session_conf
```

Deploy Kong Gateway on Kubernetes

```
sed -i -e 's/MINIKUBE_IP/'$(minikube ip)'/g' values.yaml

helm install my-kong kong/kong -n kong --values ./values.yaml
```

Watch pod deployment

```
kubectl get po -n kong -w
```

Check minikube services

```
minikube service list -n kong
```

Create Ingress

```
sed -i -e 's/MINIKUBE_IP/'$(minikube ip)'/g' ingress.yaml

kubectl apply -f ingress.yaml -n kong
```

Uninstall Kong by helm

```
helm uninstall my-kong kong/kong -n kong
```

Delete Postgres SQL PVC

```
kubectl delete pvc data-my-kong-postgresql-0 -n kong
```