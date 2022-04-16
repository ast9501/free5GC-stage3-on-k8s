#!/bin/bash

kubectl delete -f pcf
kubectl delete -f udm
kubectl delete -f udr
kubectl delete -f upf
kubectl delete -f amf
kubectl delete -f ausf
kubectl delete -f nssf
kubectl delete -f smf

kubectl apply -f pcf
kubectl apply -f udm
kubectl apply -f udr
kubectl apply -f upf
kubectl apply -f amf
kubectl apply -f ausf
kubectl apply -f nssf
kubectl apply -f smf
