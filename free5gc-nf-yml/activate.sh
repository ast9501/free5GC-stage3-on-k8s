#!/bin/bash

kubectl apply -f mongo
kubectl apply -f webui
kubectl apply -f nrf
kubectl apply -f pcf
kubectl apply -f udm
kubectl apply -f udr
kubectl apply -f upf
kubectl apply -f amf
kubectl apply -f ausf
kubectl apply -f nssf
kubectl apply -f smf

