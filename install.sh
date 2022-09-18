#!/usr/bin/env bash

function installOperator() {
  kubectl create namespace istio-operator
  kubectl create namespace istio-system
  curl -Lk https://istio.io/downloadIstio | ISTIO_VERSION=1.15.0 sh -
  helm install istio-operator istio-1.15.0/manifests/charts/istio-operator \
 --set watchedNamespaces="istio-system" \
 -n istio-operator
}

function installDefaultProfile() {
  kubectl apply -f profile.yaml
}

function InstallGceIngress() {
  kubectl apply -f gce-ingress.yaml
}

installOperator
sleep 30
installDefaultProfile
InstallGceIngress
