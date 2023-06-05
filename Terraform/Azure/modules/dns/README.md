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

#### version.tf
~~~
terraform {
  required_version = ">= 1.3.7"
}
~~~

#### terraform.tfvars
~~~
# Nanaykuna Enviroments.
enviroment-dev  = "dev"
enviroment-sta  = "sta"
enviroment-prod = "prod"
~~~

#### variables.tf
~~~
variable "enviroment-dev" {
  type = string
}

variable "enviroment-sta" {
  type = string
}

variable "enviroment-prod" {
  type = string
}
~~~

#### providers.tf
~~~
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
  features {}
  environment     = var.enviroment-dev
  subscription_id = "d11da572-d15e-42c4-a61c-9bd28afc17ce" # Cuenta Azure Dev
  tenant_id       = "141d8fe2-bf63-4de7-8782-1e1b896f03c9" # Suscripcion Nanaykuna Dev
}
~~~

#### main.tf
~~~
module "resource-group" {
  source     = ".//modules//resource-group"
  name       = "name" # Add Resource's Group Name.
  enviroment = var.enviroment-dev
}

module "application-insights" {
  source              = ".//modules//application-insights"
  name                = "name" # Add Resource's Application Insights Name.
  enviroment          = var.enviroment-dev
  resource_group_name = module.resource-group.resource-group_name_out
}
~~~

### output.tf
~~~
# Outputs
output "resource-group_name_out" {
  value = module.resource-group.resource-group_name_out
}

output "instrumentation_key_out" {
  value     = module.application-insights.instrumentation_key_out
  sensitive = true
}

output "app_id_out" {
  value = module.application-insights.app_id_out
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
