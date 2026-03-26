#! /bin/bash

kubectl delete ns otel-demo

kubectl delete ns unguard

git clone --branch v1.3.11 https://github.com/Dynatrace/easytrade.git

sed -i "s#memory: .*#memory: 600000Mi#" ./easytrade/kubernetes-manifests/release/accountservice.yaml

sed -i "s#memory: .*#memory: 10Mi#" ./easytrade/kubernetes-manifests/release/frontendreverseproxy.yaml

kubectl apply -f ./easytrade/kubernetes-manifests/release/accountservice.yaml -n easytrade

kubectl apply -f ./easytrade/kubernetes-manifests/release/frontendreverseproxy.yaml -n easytrade

mkdir ~/easytrade-manifests/

cp -r ./easytrade/kubernetes-manifests/release/ ~/easytrade-manifests/
