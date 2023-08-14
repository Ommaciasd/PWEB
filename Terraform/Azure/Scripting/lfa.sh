#!/bin/sh

# ENV.
funtionappName=
RESOURCEGROUP=rginfradevops

# ENV - SERVICE PLAN.
SERVICEPLAN_DEV=app-dev
SERVICEPLAN_STA=app-sta
SERVICEPLAN_PRD=app-prd

# AZURE RESOURCES.
az account set --subscription "$AZURE_SUSCRIPTION"
az group create --name "$RESOURCEGROUP" --location 'eastus'

# AZURE RESOURCES: SERVICE PLAN.
az appservice plan create --name "$SERVICEPLAN_DEV" --resource-group "$RESOURCEGROUP" --sku B3 --is-linux --location 'eastus'
az appservice plan create --name "$SERVICEPLAN_STA" --resource-group "$RESOURCEGROUP" --sku B3 --is-linux --location 'eastus'
az appservice plan create --name "$SERVICEPLAN_PRD" --resource-group "$RESOURCEGROUP" --sku B3 --is-linux --location 'eastus'

# AZURE RESOURCES: STORAGE ACCOUNT.
az storage account create --name "dev$funtionappName" --location 'eastus' --resource-group "$RESOURCEGROUP" --sku Standard_LRS --allow-blob-public-access false --tags created_by=azure environment=dev
az storage account create --name "sta$funtionappName" --location 'eastus' --resource-group "$RESOURCEGROUP" --sku Standard_LRS --allow-blob-public-access false --tags created_by=azure environment=sta
az storage account create --name "prd$funtionappName" --location 'eastus' --resource-group "$RESOURCEGROUP" --sku Standard_LRS --allow-blob-public-access false --tags created_by=azure environment=prod

# DEV ENVIRONMENT.
az functionapp create --resource-group "$RESOURCEGROUP" \
--runtime dotnet-isolated --functions-version 4 --name "dev-$funtionappName" --storage-account "dev$funtionappName" --os-type Linux --plan "$SERVICEPLAN_DEV" --tags created_by=azure environment=dev
az functionapp config appsettings set --name "dev-$funtionappName" --resource-group "$RESOURCEGROUP" --settings TZ="America/Lima"

# STA ENVIRONMENT.
az functionapp create --resource-group "$RESOURCEGROUP" \
--runtime dotnet-isolated --functions-version 4 --name "sta-$funtionappName" --storage-account "sta$funtionappName" --os-type Linux --plan "$SERVICEPLAN_STA" --tags created_by=azure environment=sta
az functionapp config appsettings set --name "dev-$funtionappName" --resource-group "$RESOURCEGROUP" --settings TZ="America/Lima"

# PROD ENVIRONMENT.
az functionapp create --resource-group "$RESOURCEGROUP" \
--runtime dotnet-isolated --functions-version 4 --name "prd-$funtionappName" --storage-account "prd$funtionappName" --os-type Linux --plan "$SERVICEPLAN_PRD" --tags created_by=azure environment=prod
az functionapp config appsettings set --name "dev-$funtionappName" --resource-group "$RESOURCEGROUP" --settings TZ="America/Lima"
