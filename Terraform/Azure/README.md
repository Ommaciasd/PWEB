# Terraform: Azure: Update scripts for Azure Infrastructure

\*\*## Description

* Hi, I built many scripts for the DevOps phase, within the software lifecycle with deployment for Infrastructure as Code.
* That you can update any changes to one or more repositories from every environment subscription in Azure with PaaS.

## Requirements

* Have a Azure subscription.
* Have a local computer for the compilation of TF, JSON manifests (Terraform, Terragrunt, Azure CLI).
* Create or clone a project with repositories and modules, using a base structure to standardize.
* Create the tfvars file, and deploy for environment.

## Walkthrougth

* Clone or build a repository on the platform Azure DevOps, or on your local computer, in the development environment.
* Synchronize each repository with its respective global for pull changes.
* Build the tf file for each repository.
* Install the IaC client, such as the cloud provider's CLI.
* Log in to the cloud provider's platform of the DevOps phases of the Deploy lifecycle.
* Upload new changes.
* Evaluate the lifecycle of each script in the workflow and deploy as a trigger, just like the inputs, outputs, loops, modules, and fileconfig.
* Create the providers tf file and copy the variables.
* Add the variables until environment in the variables tf file.

## Troubleshooting

* Failed login.

``` bash
Remove-Item -Path "$env:USERPROFILE\.azure\*" -Force #POWERSHELL.
az logout
az account clear
az login --use-device-code
az account show
az account list --output table
az group list --query "[?name=='$RESOURCE_GROUP_NAME']"
az keyvault show --name $KEYVAULT_NAME --resource-group $RESOURCE_GROUP_NAME --query "properties.accessPolicies"
choco uninstall terraform --force && choco install terraform --force #POWERSHELL.
terraform -v
```

## Stages

## Publish

* Use the standard structure for publishing the changes

## version.tf

``` go
terraform {
  required_version = ">= 1.3.7"
}
```

## providers.tf

``` go
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.81.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }

    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "0.7.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "$SUSCRIPTION_ID"
  tenant_id       = "$TENANT_ID"

  features {
    key_vault {
      purge_soft_delete_on_destroy    = local.active
      recover_soft_deleted_key_vaults = local.active
    }

    resource_group {
      prevent_deletion_if_contains_resources = "false"
    }
  }
}

provider "azuredevops" {}
```

## variables.tf

``` go
locals {
  environment         = "dev", "sta", or "prod"
  create_dns_resource = true only "prod"
}
```

### main.tf

* First deploy for all base resources without Apps and Compute.

``` go
module "sql" {
  db          = local.db
  sql         = local.sql
  source      = ".//modules//sql"
  environment = local.environment
  group       = module.groups.storage
}

module "storage" {
  environment = local.environment
  group       = module.groups.storage
  source      = ".//modules//storage"
  function    = module.networking.functions
  public      = local.sa
  private     = local.psa
}

module "keys" {
  environment = local.environment
  group       = module.groups.apps
  source      = ".//modules//keys"
  apps        = local.key
}

module "plan" {
  environment = local.environment
  source      = ".//modules//plan"
  group       = module.groups.apps
  web         = local.wa
  function    = local.fa
}

module "monitoring" {
  environment = local.environment
  group       = module.groups.apps
  source      = ".//modules//monitoring"
  apps        = local.apps
}

module "dns" {
  source      = ".//modules//dns"
  environment = local.environment
  group       = module.groups.networking
  private     = local.pdns
  dns         = local.dns
  dns2        = local.dns2
  dns3        = local.dns3
  dns4        = local.dns4
}

module "groups" {
  vm          = local.vm
  environment = local.environment
  source      = ".//modules//groups"
  apps        = local.apps
  storage     = local.storage
  networking  = local.networking
}

module "networking" {
  public      = local.public
  private     = local.private
  network     = local.network
  environment = local.environment
  group       = module.groups.networking
  source      = ".//modules//networking"
  apps        = local.apps
  web         = local.internet
  function    = local.lan
  ifunction   = local.ifunction
  pfunction   = local.pfunction
}

module "apps" {
  for_each    = var.app
  net         = each.value.net
  node        = each.value.node
  plan        = module.plan.web
  environment = local.environment
  group       = module.groups.apps
  source      = ".//modules//apps"
  function    = each.value.function
  plan2       = module.plan.function
  storage     = module.storage.public
  key         = module.monitoring.key
  public      = module.networking.webs
  private     = module.networking.functions
  connection  = module.monitoring.connection
  pfunction   = module.networking.pfunction
}
```

* Second deploy for every App and Compute. for active VNet, after Networking Builded and deployed in the tenant over suscription!

### Build

* Delete the **./.terraform** folder, if you can view in a local repository on tne root, before deploy the commands terraform.
* Add $PATH Terragrunt.exe
* Use the followings sentences for building the changes.

#### Terraform Commands

``` bash
terragrunt init -update
```

* **terraform:** API.
* **init:** init the API.
* **--update:** update the terraform version, and providers.

``` bash
terragrunt get -update
```

* **get:** synchronize all terraform modules.

``` bash
terragrunt fmt
```

* **fmt:** formating the sangria of every fileconfig tf of the Terraform Root module.

## Test

* Use the followings sentences for testing the changes.

## Terraform_Commands

```bash
terragrunt validate
```

* **validate:** validate the semantic and sintaxis of the code.

``` bash
terragrunt plan -out terraform.tfplan
```

* **plan:** validate the changes in the terraform plan to build.
* **-out:** redirect stdout to a apply setting file.
* **terraform.tfplan:** Name of the file to apply changes.

``` bash
terraform output
```

* **output:** validate the output values.

``` bash
terraform console
```

* **console:** validate help or manual of the terraform CLI command.

## Deploy

* Use the followings sentences for deploying the changes.

## Commands

``` bash
$env:TF_LOG="DEBUG" # POWERSHELL.
terraform apply -auto-approve "terraform.tfplan" 2>&1 | tee terraform_apply.log
```

* **$env:** Declarate powershell env.
* **TF_LOG=** Declarate env.
* **"DEBUG":** Value of the declarated key.

* **apply:** Aplicate the changes.
* **-auto-approve:** Auto approve the changes of the plan.
* **2:** Represent stderr file descriptor.
* **>&:** Redirect stdout descriptor to other file.
* **1:** Represent stdout file descriptor.
* **|:** Redirect stdout.
* **tee:** Read stdin, and write stdout in a file.
* **terraform_apply.log:** Save stdout of the last query command by pipe's filter.

``` bash
terraform show state
```

* **show:** show content in the screen.
* **state:** statefile of the current plan saved by terraform.
  \*\*

## Destroy

* Use the followings sentences for deploying the changes.

``` go
terragrunt destroy -auto-approve
```

* **destroy:** secure destroy all the infrastructure.
* **-auto-approve:** auto approve the changes of the plan.
