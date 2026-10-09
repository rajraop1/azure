az aks show --resource-group RG --name AKS --query "{Power:powerState.code,Provisioning:provisioningState}" --output table


