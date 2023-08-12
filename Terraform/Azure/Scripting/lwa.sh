#!/bin/sh

# ENV.
webappName=
RESOURCEGROUP=rginfradevops
SERVICEPLAN_DEV=app-dev
SERVICEPLAN_STA=app-sta
SERVICEPLAN_PRD=app-prd
RUNTIME=NODE:16-lts

# AZURE RESOURCES.
az account set --subscription "$AZURE_SUSCRIPTION"
az group create --name "$RESOURCEGROUP" --location 'eastus'
az appservice plan create --name "$SERVICEPLAN_DEV" --resource-group "$RESOURCEGROUP" --sku B3 --is-linux --location 'eastus'
az appservice plan create --name "$SERVICEPLAN_STA" --resource-group "$RESOURCEGROUP" --sku B3 --is-linux --location 'eastus'
az appservice plan create --name "$SERVICEPLAN_PRD" --resource-group "$RESOURCEGROUP" --sku B3 --is-linux --location 'eastus'

# TROUBLESHOOTING.
az webapp list-runtimes --linux

# DEV ENVIRONMENT.
az webapp create --resource-group "$RESOURCEGROUP" --name "dev-$webappName" --plan "$SERVICEPLAN_DEV" --tags created_by=azure environment=dev --runtime "$RUNTIME"
az webapp config appsettings set --name "dev-$webappName" --resource-group "$RESOURCEGROUP" --settings TZ="America/Lima"

# STA ENVIRONMENT.
az webapp create --resource-group "$RESOURCEGROUP" --name "sta-$webappName" --plan "$SERVICEPLAN_STA" --tags created_by=azure environment=sta --runtime "$RUNTIME"
az webapp config appsettings set --name "sta-$webappName" --resource-group "$RESOURCEGROUP" --settings TZ="America/Lima"

# PROD ENVIRONMENT.
az webapp create --resource-group "$RESOURCEGROUP" --name "prd-$webappName" --plan "$SERVICEPLAN_PRD" --tags created_by=azure environment=prd --runtime "$RUNTIME"
az webapp config appsettings set --name "prd-$webappName" --resource-group "$RESOURCEGROUP" --settings TZ="America/Lima"
