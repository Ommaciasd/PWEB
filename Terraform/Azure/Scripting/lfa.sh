#!/bin/sh

# AZURE RESOURCES.
az account set --subscription 'AZURE-SUSCRIPTION'
az group create --name 'RESOURCEGROUP' --location 'eastus'
az appservice plan create --name 'SERVICEPLAN' --resource-group 'RESOURCEGROUP' --sku B3 --is-linux --location 'eastus'

# DEV ENVIRONMENT.
az storage account create --name 'devstorageaccount' --location 'eastus' --resource-group 'RESOURCEGROUP' --sku Standard_LRS --allow-blob-public-access false
az functionapp create --resource-group 'RESOURCEGROUP' \
--runtime dotnet-isolated --functions-version 4 --name 'dev-nanaykuna-' --storage-account 'devstorageaccount' --os-type Linux --plan SERVICEPLAN --tags created_by=azure environment=dev

# STA ENVIRONMENT.
az storage account create --name 'stastorageaccount' --location 'eastus' --resource-group 'RESOURCEGROUP' --sku Standard_LRS --allow-blob-public-access false
az functionapp create --resource-group 'RESOURCEGROUP' \
--runtime dotnet-isolated --functions-version 4 --name 'sta-nanaykuna-' --storage-account 'stastorageaccount' --os-type Linux --plan SERVICEPLAN --tags created_by=azure environment=sta

# PROD ENVIRONMENT.
az storage account create --name 'prodstorageaccount' --location 'eastus' --resource-group 'RESOURCEGROUP' --sku Standard_LRS --allow-blob-public-access false
az functionapp create --resource-group 'RESOURCEGROUP' \
--runtime dotnet-isolated --functions-version 4 --name 'prod-nanaykuna-' --storage-account 'prodstorageaccount' --os-type Linux --plan SERVICEPLAN --tags created_by=azure environment=prod
