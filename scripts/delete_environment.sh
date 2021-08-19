#!/bin/bash
kubectl delete service nginx
kubectl delete service php
kubectl delete deployment nginx
kubectl delete deployment php
