#ISTIO with GCE ingress in GKE

## Prerequest 
- You nedd to open port 15021,10250 for you your VM so istio can check the healthcheck.

## Install istio with operator and default profile

1- Create operator namespace 
```
kubectl create namespace istio-operator
```

2- Create the istio-system namespace

```shell
kubectl create namespace istio-system
```

3- Downlaod latest release or you can specify the verion in the tag

```shell
curl -Lk https://istio.io/downloadIstio | ISTIO_VERSION=1.15.0 sh -
```

4- install operator using this command 
```
helm install istio-operator istio-1.15.0/manifests/charts/istio-operator \
 --set watchedNamespaces="istio-system" \
 -n istio-operator
```
5- Install istio using default profile
```
kubectl apply profile.yaml
```
