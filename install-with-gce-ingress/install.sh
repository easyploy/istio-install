#!/usr/bin/env bash

function installOperator() {
  kubectl create namespace istio-operator
  kubectl create namespace istio-system
  curl -Lk https://istio.io/downloadIstio | ISTIO_VERSION=1.15.0 sh -
  helm upgrade --install istio-operator istio-1.15.0/manifests/charts/istio-operator \
 --set watchedNamespaces="istio-system" \
 -n istio-operator
}

function installDefaultProfile() {
  kubectl apply -f profile.yaml
}

function installGceIngress() {
  kubectl apply -f gce-ingress.yaml
}

installOperator
kubectl apply -f ingress-backendconfig.yaml
sleep 30
installDefaultProfile
sleep 30
installGceIngress
