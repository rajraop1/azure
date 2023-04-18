#!/bin/bash

echo "Sample deploy docker container to Azure"

#Docker registry & containers

#https://learn.microsoft.com/en-us/azure/container-registry/container-registry-get-started-azure-cli

#https://docs.docker.com/cloud/aci-integration/



az group create --name myResourceGroup --location centralindia

az acr create --resource-group myResourceGroup --name rrs2containerregistry --sku Basic

az acr login --name rrs2containerregistry

docker context rm -f myacicontext

docker context create aci myacicontext --resource-group myResourceGroup

docker context use myacicontext

docker --context default pull ubuntu:20.04

docker --context default tag ubuntu:20.04 rrs2containerregistry.azurecr.io/ubuntu:20.04

docker --context default push rrs2containerregistry.azurecr.io/ubuntu:20.04

az acr repository list --name rrs2containerregistry --output table


docker run -p 22:22 rrs2containerregistry.azurecr.io/ubuntu:20.04 sleep 6000

docker ps


#az group delete -y --name myResourceGroup



