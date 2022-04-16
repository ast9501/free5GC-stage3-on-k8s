#!/bin/bash

kubectl delete -f smf
kubectl delete -f amf
kubectl delete -f ausf
kubectl delete -f pcf
kubectl delete -f nssf
kubectl delete -f udr
kubectl delete -f udm
kubectl delete -f upf
kubectl delete -f nrf
kubectl delete -f webui
kubectl delete -f mongo

