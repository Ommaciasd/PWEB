# Define Terraform provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.53.0"
    }
  }
}

provider "azurerm" {
  # Configure the Microsoft Azure Provider
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
  subscription_id = "cu3v74-4zur3" # Cuenta Azure
  tenant_id       = "5v5cr1q710v-4zur3" # Suscripcion Azure
}
