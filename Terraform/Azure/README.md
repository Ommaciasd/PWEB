# Terraform: Azure: Update scripts for Azure Infrastructure

**## Description

- Hi, I built many scripts for the DevOps phase, within the software lifecycle with deployment for Infrastructure as Code.
- That you can update any changes to one or more repositories from every environment subscription in Azure with PaaS.

## Requirements

- Have a Azure subscription.
- Have a local computer for the compilation of TF, JSON manifests (Terraform, Terragrunt, Azure CLI)
- Create or clone a project with repositories and modules, using a base structure to standardize.

## Walkthrougth

- Clone or build a repository on the platform Azure DevOps, or on your local computer, in the development environment.
- Synchronize each repository with its respective global for pull changes.
- Build the tf file for each repository.
- Install the IaC client, such as the cloud provider's CLI.
- Log in to the cloud provider's platform of the DevOps phases of the Deploy lifecycle.
- Upload new changes.
- Evaluate the lifecycle of each script in the workflow and deploy as a trigger, just like the inputs, outputs, loops, modules, and fileconfig.

## Stages

## Publish

- Use the standard structure for publishing the changes

## version.tf

~~~ go
terraform {
  required_version = ">= 1.3.7"
}
~~~

## providers.tf

~~~ go
# Define Terraform provider
terraform {

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.37.0"
    }
  }

}

provider "azurerm" {
  # Configure the Microsoft Azure Provider
  subscription_id = local.subscription
  tenant_id       = local.tenant # Suscripcion Nanaykuna.
}
~~~

## terraform.tfvars

~~~ go
# Nanaykuna Enviroments.
enviroment  = "dev", "sta", and "prod"
~~~

## variables.tf

~~~ go
variable "app" {
  type = map(object({
    net      = string
    node     = string
    function = string
  }))

  default = {
    "$ORGANIZATION" = {
      node     = ""
      net      = ""
      function = ""
    },
  }
}

locals {
  # Apps.
  wa = ""
  fa = ""

  # Storage Accounts.
  sa  = ""
  psa = ""

  # Resources Groups.
  vm         = ""
  apps       = ""
  storage    = ""
  networking = ""

  # Resources.
  lan         = ""
  vms         = ""
  public      = ""
  network     = ""
  private     = ""
  internet    = ""
  environment = var.environment

  # Azure Providers.
  tenant       = var.tenant
  destroy      = var.destroy
  resources    = var.resources
  subscription = var.suscription
}
~~~

### main.tf

- First deploy for all base resources without Apps and Compute.

~~~ go
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
  function    = local.lan 
  apps        = local.apps  
  public      = local.public
  private     = local.private
  network     = local.network
  web         = local.internet
  ifunction   = local.ifunction
  pfunction   = local.pfunction
  environment = local.environment
  group       = module.groups.networking
  source      = ".//modules//networking"
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
  pfunction   = module.networking.pfunction
  private     = module.networking.functions
  connection  = module.monitoring.connection
}
~~~

- Second deploy for every App and Compute. for active VNet, after Networking Builded and deployed in the tenant over suscription!

### Build

- Delete the **$environment.tfvars** file, and **.terraform** folder, if you can view in a local repository on tne root, before deploy the commands terraform.

- Add $PATH Terragrunt.exe

- Use the followings sentences for building the changes.

#### Terraform Commands

~~~ bash
terragrunt init -update
~~~

- **terraform:** API.
- **init:** init the API.
- **--update:** update the terraform version, and providers.

~~~ bash
terragrunt get -update
~~~

- **get:** sincronice all terraform modules.

~~~ bash
terragrunt fmt
~~~

- **fmt:** formating the sangria of every fileconfig tf of the Terraform Root module.

## Test

- Use the followings sentences for testing the changes.

## Terraform_Commands

~~~ go
terragrunt validate
~~~

- **validate:** validate the semantic and sintaxis of the code.

~~~ go
terragrunt plan "-var-file=.\Vars\$ENVIRONMENT.tfvars"
~~~

- **plan:** validate the changes in the terraform plan to build.
- **-var-file:** output to a customized file-
- **".\Vars\$ENVIRONMENT.tfvars":** Path of file.tfvars to save the terraform plan, for apply the deploy of changes.

~~~ go
terraform output
~~~

- **output:** validate the output values.

~~~ go
terraform console
~~~

- **console:** validate help or manual of the terraform CLI command.

## Deploy

- Use the followings sentences for deploying the changes.

## Commands

~~~ go
terragrunt apply -auto-approve "-var-file=.\Vars\$ENVIRONMENT.tfvars"
~~~

- **apply:** aplicate the changes.
- **-auto-approve:** auto approve the changes of the plan.

~~~ go
terraform show state
~~~

- **show:** show contente in the screen.
- **state:** statefile of the current plan saved by terraform.
**

## Destroy

- Use the followings sentences for deploying the changes.

~~~ go
terragrunt destroy -auto-approve "-var-file=.\Vars\$ENVIRONMENT.tfvars"
~~~

- **destroy:** secure destroy all the infrastructure.
- **-auto-approve:** auto approve the changes of the plan.
