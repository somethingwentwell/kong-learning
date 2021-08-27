# kong-learning

Ubuntu Setup

Install Docker

```
curl -fsSL https://test.docker.com -o test-docker.sh

sudo sh test-docker.sh

sudo groupadd docker

sudo usermod -aG docker $USER

newgrp docker 
```

Install Docker Compose
```
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose
```

Install Minikube
```
sudo apt-get update -y

sudo apt-get upgrade -y

sudo apt-get install curl

sudo apt-get install apt-transport-https

sudo apt install virtualbox virtualbox-ext-pack

wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

sudo cp minikube-linux-amd64 /usr/local/bin/minikube

sudo chmod 755 /usr/local/bin/minikube

minikube version
```

Install Helm
```
https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
```