# Terraform: Azure: Update scripts for Azure Infrastructure

**## Description

- Hi, I built many scripts for the DevOps phase, within the software lifecycle with deployment for Infrastructure as Code.
- That you can update any changes to one or more repositories from every environment subscription in Azure with PaaS.

## Requirements

- Have a Azure subscription.
- Have a local computer for the compilation of TF, JSON manifests (Terraform, Azure CLI)
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
    "nanaykuna" = {
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
  public      = local.sa  # Add Resources Prefix + Name.
  private     = local.psa # Add Resources Prefix + Name.
}

module "keys" {
  environment = local.environment
  group       = module.groups.apps
  source      = ".//modules//keys"
  apps        = local.key # Add Resources Prefix + Name.
}

module "plan" {
  environment = local.environment
  source      = ".//modules//plan"
  group       = module.groups.apps
  web         = local.wa # Add Resources Prefix + Name.
  function    = local.fa # Add Resources Prefix + Name.
}

module "monitoring" {
  environment = local.environment
  group       = module.groups.apps
  source      = ".//modules//monitoring"
  apps        = local.apps # Add Resources Prefix + Name.
}

module "dns" {
  source      = ".//modules//dns"
  environment = local.environment
  group       = module.groups.networking
  private     = local.pdns # Add Resources Prefix + Name.
  dns         = local.dns  # Add Resources Prefix + Name.
  dns2        = local.dns2 # Add Resources Prefix + Name.
  dns3        = local.dns3 # Add Resources Prefix + Name.
  dns4        = local.dns4 # Add Resources Prefix + Name.
}

module "groups" {
  vm          = local.vm
  environment = local.environment
  source      = ".//modules//groups"
  apps        = local.apps       # Add Resources Prefix + Name.
  storage     = local.storage    # Add Resources Prefix + Name.
  networking  = local.networking # Add Resources Prefix + Name.
}

module "networking" {
  public      = local.public
  private     = local.private
  network     = local.network
  environment = local.environment
  group       = module.groups.networking
  source      = ".//modules//networking"
  apps        = local.apps      # Add Resources Prefix + Name.
  web         = local.internet  # Add Subnet Linux Web App Name.
  function    = local.lan       # Add Subnet Linux Function App Name.
  ifunction   = local.ifunction # Add Public Linux Function App Name.
  pfunction   = local.pfunction # Add Subnet Public Linux Function App Name.
}

~~~

- Second deploy for every App and Compute. &hios for active VNet, after Networking Builded and deployed in the tenenat over suscription!

~~~ go
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
  private     = module.networking.functions
  connection  = module.monitoring.connection
  public      = module.networking.webs      # ID PUBLIC SUBNET.
  pfunction   = module.networking.pfunction # ID PUBLIC SUBNET APP Functions.
}

~~~

### Build

- Use the followings sentences for building the changes.

#### Terraform Commands

~~~ bash
.\terragrunt.exe init --update
~~~

- **terraform:** API.
- **init:** init the API.
- **--update:** update the terraform version, and providers.

~~~ bash
.\terragrunt.exe get
~~~

- **get:** sincronice all terraform modules.

~~~ bash
.\terragrunt.exe fmt
~~~

- **fmt:** formating the sangria of every fileconfig tf of the Terraform Root module.

## Test

- Use the followings sentences for testing the changes.

## Terraform_Commands

~~~ go
.\terragrunt.exe validate
~~~

- **validate:** validate the semantic and sintaxis of the code.

~~~ go
.\terragrunt.exe plan "-var-file=.\Vars\ENVIRONMENT.tfvars"
~~~

- **plan:** validate the changes in the terraform plan to build.
- **-var-file:** output to a customized file-
- **".\Vars\ENVIRONMENT.tfvars":** Path of file.tfvars to save the terraform plan, for apply the deploy of changes.

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
.\terragrunt.exe apply -auto-approve "-var-file=.\Vars\ENVIRONMENT.tfvars"
~~~

- **apply:** aplicate the changes.
- **-auto-approve:** auto approve the changes of the plan.

~~~ go
terraform show state
~~~

- **show:** show contente in the screen.
- **state:** statefile of the current plan saved by terraform.
**