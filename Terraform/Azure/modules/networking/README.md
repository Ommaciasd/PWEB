# Terraform: Azure: Update scripts for Networking Logic Units

## Description

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
  features {}
  environment     = var.enviroment-dev
  subscription_id = "" # Cuenta Azure Dev
  tenant_id       = "" # Suscripcion Nanaykuna Dev
}
~~~

## variables.tf

~~~ go
environment  = "dev", "sta", and "prod"
~~~

### main.tf

~~~ go
module "groups" {
  environment = local.environment
  source      = ".//modules//groups"
  apps        = local.networking # Add Resources Prefix + Name.
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
