locals {
  # Nanaykuna
  # Apps.
  wa       = var.wa
  fa       = var.fa
  endpoint = var.endpoint

  # Resources Groups.
  vm         = var.vm
  apps       = var.apps
  storage    = var.storage
  networking = var.networking

  # Resources.
  db          = var.db
  sql         = var.sql
  lan         = var.lan
  key         = var.key
  dns         = var.dns
  pdns        = var.pdns
  dns2        = var.dns2
  dns3        = var.dns3
  dns4        = var.dns4
  vnet        = var.vnet
  public      = var.public
  network     = var.network
  private     = var.private
  security    = var.security
  internet    = var.internet
  insights    = var.insights
  environment = var.environment

  # Azure Providers.
  tenant       = var.tenant
  destroy      = var.destroy
  resources    = var.resources
  subscription = var.subscription
}

# SQL.
variable "sql" {
  type = string
}

# Resources.
variable "db" {
  type = string
}

variable "lan" {
  type = string
}

variable "dns" {
  type = string
}

variable "key" {
  type = string
}

variable "vnet" {
  type = string
}

variable "pdns" {
  type = string
}

variable "dns2" {
  type = string
}

variable "dns3" {
  type = string
}

variable "dns4" {
  type = string
}

variable "public" {
  type = string
}

variable "network" {
  type = string
}

variable "private" {
  type = string
}

variable "internet" {
  type = string
}

variable "insights" {
  type = string
}

variable "security" {
  type = string
}

variable "environment" {
  type = string
}

# Azure Providers.
variable "tenant" {
  type = string
}

variable "destroy" {}
variable "resources" {}

variable "subscription" {
  type = string
}

#Apps.
variable "wa" {
  type = string
}

variable "fa" {
  type = string
}

variable "webs" {
  type = map(any)
  default = {
    "nanaykuna" = {
      web = "nanaykuna"
    },

    "storybook" = {
      web = "storybook"
    },

    # BackOffice
    "backoffice" = {
      web = "backoffice"
    },

    "backoffice-ui" = {
      web = "backoffice-ui"
    },

    "backoffice-api" = {
      web = "backoffice-api"
    },

    "ticket-manager" = {
      web = "ticket-manager"
    },

    "bff-integration-infra" = {
      web = "bff-integration-infra"
    }
  }
}

variable "functions" {
  type = map(any)
  default = {
    "payments" = {
      function = "payments"
    },

    "marketing" = {
      function = "marketing"
    },

    "notification" = {
      function = "notification"
    },

    "shipping-dates" = {
      function = "shipping-dates"
    },

    "shipping-reports" = {
      function = "shipping-reports"
    },

    "customer-loyalty" = {
      function = "customer-loyalty"
    },

    "products-functions" = {
      function = "products-functions"
    },

    "shipping-experience" = {
      function = "shipping-experience"
    },

    "back-office-functions" = {
      function = "back-office-functions"
    }
  }
}

# Resources Groups.
variable "vm" {
  type = string
}

variable "apps" {
  type = string
}

variable "storage" {
  type = string
}

variable "networking" {
  type = string
}

variable "endpoint" {
  type        = string
  description = "The base name for every resource"
}
