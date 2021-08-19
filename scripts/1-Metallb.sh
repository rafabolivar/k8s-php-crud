#!/bin/bash
OFFSET_BEGIN=110
OFFSET_END=120

kubectl delete -n metallb-system daemonset --all
kubectl delete -n metallb-system deployment --all
kubectl delete namespace metallb-system

kubectl create namespace metallb-system
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/main/manifests/metallb.yaml
#kubectl -n metallb-system get pods

sleep 5
NETROOT=`kubectl describe nodes | grep Internal | head -1 | awk {'print$2'} | awk -F. {'print$1"."$2"."$3'}`
IP_BEGIN=`echo "$NETROOT.$OFFSET_BEGIN"`
IP_END=`echo "$NETROOT.$OFFSET_END"`
cp /Users/rafael.bolivar/Documents/Entorno_POC_Rafa/Nginx_Metallb/metallb-config-orig.yaml /Users/rafael.bolivar/Documents/Entorno_POC_Rafa/Nginx_Metallb/metallb-config.yaml
sed -i '' -e "s/IP_BEGIN/$IP_BEGIN/" /Users/rafael.bolivar/Documents/Entorno_POC_Rafa/Nginx_Metallb/metallb-config.yaml
sed -i '' -e "s/IP_END/$IP_END/" /Users/rafael.bolivar/Documents/Entorno_POC_Rafa/Nginx_Metallb/metallb-config.yaml
kubectl apply -f /Users/rafael.bolivar/Documents/Entorno_POC_Rafa/Nginx_Metallb/metallb-config.yaml
