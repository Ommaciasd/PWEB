#Apps.
variable "wa" {
  type = string
}

variable "fa" {
  type = string
}

# SQL.
variable "db" {
  type = string
}

variable "sql" {
  type = string
}


#Storage Accounts.
variable "sa" {
  type = string
}

variable "psa" {
  type = string
}

# Resources.
variable "vms" {
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

# Azure Providers.
variable "tenant" {
  type = string
}

variable "destroy" {}
variable "resources" {}

variable "subscription" {
  type = string
}

locals {
  # Nanaykuna
  # Apps.
  wa = var.wa
  fa = var.fa

  # Storage Accounts.
  sa  = var.sa
  psa = var.psa

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
  vms         = var.vms
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

# Validar uso de condicionales para deployar estos recursos en terraform. 20230602.
variable "app" {
  type = map(object({
    net      = string
    node     = string
    function = string
  }))

  default = {
    "nanaykuna" = {
      node     = ""
      net      = "nanaykuna"
      function = "invoices-functions"
    },

    "storybook" = {
      node     = ""
      function = "payments"
      net      = "storybook"
    },

    # BackOffice
    "backoffice-api" = {
      node     = ""
      net      = "backoffice-api"
      function = "products-functions"
    },

    "backoffice" = {
      node     = ""
      net      = "backoffice"
      function = "back-office-functions"
    },

    "ticket-manager" = {
      node     = ""
      net      = "ticket-manager"
      function = "shipping-dates"
    },

    "bff-integration-infra" = {
      node     = ""
      net      = "bff-integration-infra"
      function = "shipping-experience"
    },

    "marketing" = {
      net      = ""
      node     = ""
      function = "marketing"
    },

    "notification" = {
      net      = ""
      node     = ""
      function = "notification"
    },

    "shipping-reports" = {
      net      = ""
      node     = ""
      function = "shipping-reports"
    },

    "customer-loyalty" = {
      net      = ""
      node     = ""
      function = "customer-loyalty"
    }
  }
}
