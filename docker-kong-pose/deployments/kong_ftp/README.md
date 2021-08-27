# kong_ftp

Deploys Kong EE DB and FTP

## Docker Image :

FTP : https://hub.docker.com/r/stilliard/pure-ftpd/

## How to use

1. Just run `docker-compose up -d`

2. You should be able to access the FTP in localhost with ftp command as below

```
ftp -p localhost 21
user name>bob
password>123
```

3. Add below service in Kong

```
Protocol: TCP
Host: ftpd
Port:21
```

4. Add below route in Kong

```
Service: the service created in step3
Protocol: TCP
Source(s):
  IP: 0.0.0.0/0. -> allow all source IP address
  Port: null
```

5. You should be able to access the FTP via Kong as below

```
ftp -p localhost 5555
user name>bob
password>123
```

## Additional feature
