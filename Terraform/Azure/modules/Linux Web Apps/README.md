# Terraform: Azure: Update scripts for Linux Web Apps!

### Description.

- Hi, I built many scripts for the DevOps phase, within the software lifecycle with deployment for Infrastructure as Code.
- That you can update any changes to one or more repositories from Dev enviroment subscription in Azure with PaaS.


## Requirements.

- Have a Azure subscription.
- Have a local computer for the compilation of TF, JSON manifests (Terraform, Azure CLI)
- Create or clone a project with repositories and modules, using a base structure to standardize.


## Walkthrougth.

- Clone or build a repository on the platform Azure DevOps, or on your local computer, in the development environment.
- Synchronize each repository with its respective global for pull changes.
- Build the tf file for each repository.
- Install the IaC client, such as the cloud provider's CLI.
- Log in to the cloud provider's platform of the DevOps phases of the Deploy lifecycle.
- Upload new changes.
- Evaluate the lifecycle of each script in the workflow and deploy as a trigger, just like the inputs, outputs, loops, modules, and fileconfig.

## Stages.

### Publish.
- Use the standard structure for publishing the changes.

#### terraform.tfvars

~~~
# Network
network-v-cidr   = "10.5.0.0/16"
network-s-cidr   = "10.5.1.0/24"
network-spe-cidr = "10.5.2.0/24"
~~~

#### variables.tf

~~~
# Deploy many resources from map, in a loop "for_each".
variable "prefix" {
  type = map(any)
  default = {
    "app" = {
      name = "WebServer03"
    }
    "app2" = {
      name = "WebServer02"
    },
    "app3" = {
      name = "AppServer04"
    }
  }
}

variable "network-v-cidr" {
  type = string
}

variable "network-s-cidr" {
  type = string
}

variable "network-spe-cidr" {
  type = string
}
~~~

#### providers.tf

~~~
# Define Terraform provider
terraform {
  required_version = ">= 1.1.9"

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
  environment     = "sta"
  subscription_id = "ID-AZURE-CUENTA"      # Cuenta Azure Staging
  tenant_id       = "ID-AZURE-SUSCRIPTION" # Suscripcion Azure Staging
}

# Generate a random integer to create a globally unique name
resource "random_integer" "ri" {
  min = 10000
  max = 99999
}
~~~

#### main.tf

~~~
locals {
  assetname  = "companyname"
  enviroment = "sta"
  base_name  = format("%s%s", local.assetname, local.enviroment)
}

module "resource-group" {
  source     = ".//modules//resource-group"
  base_name  = local.base_name # Add Resource's Prefix + Name.
  assetname  = local.assetname
  enviroment = local.enviroment
}

module "virtual-network" {
  source              = ".//modules//virtual-network"
  base_name           = local.base_name # Add Resource's Prefix + Name.
  resource_group_name = module.resource-group.rg_name_out
  assetname           = local.assetname
  enviroment          = local.enviroment
  network-v-cidr      = var.network-v-cidr
}

module "subnet" {
  source               = ".//modules//subnet"
  base_name            = local.base_name # Add Resource's Prefix + Name.
  resource_group_name  = module.resource-group.rg_name_out
  assetname            = local.assetname
  enviroment           = local.enviroment
  virtual_network_name = module.virtual-network.v_name_out
  network-s-cidr       = var.network-s-cidr
  network-spe-cidr     = var.network-spe-cidr
}

module "storage-account" {
  source              = ".//modules//storage-account"
  base_name           = local.base_name # Add Resource's Prefix + Name.
  resource_group_name = module.resource-group.rg_name_out
  assetname           = local.assetname
  enviroment          = local.enviroment
}

module "service-plan" {
  source              = ".//modules//service-plan"
  base_name           = local.base_name # Add Resource's Prefix + Name.
  resource_group_name = module.resource-group.rg_name_out
  assetname           = local.assetname
  enviroment          = local.enviroment
}

module "linux-web-app" {
  source              = ".//modules//linux-web-app"
  for_each            = var.prefix         # Use loop "for_each".
  base_name           = each.value["name"] # Deploy many resources from map, with value by name".
  resource_group_name = module.resource-group.rg_name_out
  assetname           = local.assetname
  enviroment          = local.enviroment
  service_plan_id     = module.service-plan.service_plan_id_out
  subnet_id           = module.subnet.s_id_out
}
~~~

### output.tf

~~~
# Outputs
output "rgName" {
  value = module.resource-group.rg_name_out
}

output "saName" {
  value = module.storage-account.sa_name_out
}

output "sID" {
  value = module.subnet.s_id_out
}

output "spName" {
  value = module.service-plan.sp_name_out
}

# Save the output from a map for id in each resource deployed.
output "lwa_ids" {
  value = toset([
    for lwa in module.linux-web-app : lwa.lwa_id_out
  ])
}
~~~


### Build.
- Use the followings sentences for building the changes.

#### Terraform Commands.

~~~
terraform init --update
~~~
- **terraform:** API.
- **init:** init the API.
- **--update:** update the terraform version, and providers.

~~~
terraform get
~~~
- **get:** sincronice all terraform modules.

~~~
terraform fmt
~~~
- **fmt:** formating the sangria of every fileconfig tf of the Terraform Root module.


### Test.
- Use the followings sentences for testing the changes.

#### Terraform Commands.

~~~
terraform validate
~~~
- **validate:** validate the semantic and sintaxis of the code.

~~~
terraform plan -o "terraform.tfplan"
~~~
- **plan:** validate the changes in the terraform plan to build.
- **-o:** output to a customized file-
- **"file.tf":** name of file.tf to save the terraform plan, for apply the deploy of changes.

~~~
terraform output
~~~
- **output:** validate the output values.

~~~
terraform console
~~~
- **console:** validate help or manual of the terraform CLI command.


### Deploy.
- Use the followings sentences for deploying the changes.

#### Terraform Commands.

~~~
terraform apply --autoapprobe "terraform.tfplan"
~~~
- **apply:** aplicate the changes.
- **-auto-approve:** auto approve the changes of the plan.

~~~
terraform show state
~~~
- **show:** show contente in the screen.
- **state:** statefile of the current plan saved by terraform.



### Please, Buy me a toy for my son!
Any support, collaboration or help, this is my WhatsApp, Nequi, Daviplata account: "+573058288031", paypal: omaciasnarvaez@gmail.com.

Thank you for the support and attention provided!
