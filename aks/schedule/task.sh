#!/usr/bin/env bash
set -euo pipefail

az login --identity --client-id "$AZURE_CLIENT_ID" --output none

date -u
az group show --name RG --query "{name:name,location:location}" --output table

# Add your commands here.
az aks stop -g RG -n AKS
