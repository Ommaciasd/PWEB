# Define Terraform provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.66.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.1.0" # Puedes ajustar la versión según tus necesidades
    }

    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "0.7.0"
    }
  }
}

provider "azurerm" {
  # Configure the Microsoft Azure Provider
  subscription_id = local.subscription
  tenant_id       = local.tenant # Suscripcion Nanaykuna

  features {
    key_vault {
      purge_soft_delete_on_destroy    = local.destroy
      recover_soft_deleted_key_vaults = local.destroy
    }

    resource_group {
      prevent_deletion_if_contains_resources = local.resources
    }
  }
}

provider "azuredevops" {
  # Configuration options
}
