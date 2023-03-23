# Terraform: Azure: Update scripts for Linux Web Apps!

### Description.

- Hi, I built many scripts for the DevOps phase, within the software lifecycle with deployment for Infrastructure as Code. That you can update any changes to one or more repositories from your respective subscription in the cloud tenant with IaaS, PaaS and SaaS.


## Requirements.

- Have a tenant account or cloud provider subscription.
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


## Publish.
- Use the standard structure for publishing the changes.

### main.tf


### output.tf



## Build.
- Use the followings sentences for building the changes.

### Terraform Commands.

### terraform init --update
- terraform: API.
- init: init the API
- --update: update the terraform version, and providers.

## terraform get
- get: sincronice all terraform modules.

## terraform fmt
- fmt: formating the sangria of every fileconfig tf of the Terraform Root module.


## Test.
- Use the followings sentences for testing the changes.

### Terraform Commands.

## terraform validate
- validate: validate the semantic and sintaxis of the code.

## terraform plan -o "terraform.tfplan"
- plan: validate the changes in the terraform plan to build.
- -o: output to a customized file-
- "file.tf": name of file.tf to save the terraform plan, for apply the deploy of changes.

## terraform output
- output: validate the output values.

## terraform console
- console: validate help or manual of the terraform CLI command.


## Deploy.
- Use the followings sentences for deploying the changes.

### Terraform Commands.

## terraform apply --autoapprobe "terraform.tfplan"
- apply: aplicate the changes.
- --autoapprobe: auto approbe the changes of the plan.


## terraform show state
- show: show contente in the screen.
- state: statefile of the current plan saved by terraform.


### Please, Buy me a toy for my son!
Any support, collaboration or help, this is my WhatsApp, Nequi, Daviplata account: "+573058288031", paypal: omaciasnarvaez@gmail.com.

Thank you for the support and attention provided!
