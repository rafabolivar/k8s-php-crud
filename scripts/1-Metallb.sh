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

sudo cp /home/ubuntu/demo/scripts/metallb-config-orig.yaml /home/ubuntu/demo/scripts/metallb-config.yaml
# The following 2 lines work for MAC OS-X
# sudo sed -i '' -e "s/IP_BEGIN/$IP_BEGIN/" /home/ubuntu/demo/scripts/metallb-config.yaml
# sudo sed -i '' -e "s/IP_END/$IP_END/" /home/ubuntu/demo/scripts/metallb-config.yaml
sudo sed -i "s/IP_BEGIN/$IP_BEGIN/" /home/ubuntu/demo/scripts/metallb-config.yaml
sudo sed -i "s/IP_END/$IP_END/" /home/ubuntu/demo/scripts/metallb-config.yaml

kubectl apply -f /home/ubuntu/demo/scripts/metallb-config.yaml
