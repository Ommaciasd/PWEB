# Nanaykuna
#Apps.
variable "wa" { type = string }
variable "fa" { type = string }

# SQL.
variable "db" { type = string }
variable "sql" { type = string }

#Storage Accounts.
variable "sa" { type = string }
variable "psa" { type = string }

# Resources.
variable "dns" { type = string }
variable "ivm" { type = string }
variable "key" { type = string }
variable "lan" { type = string }
variable "pvm" { type = string }
variable "vms" { type = string }
variable "pdns" { type = string }
variable "dns2" { type = string }
variable "dns3" { type = string }
variable "dns4" { type = string }
variable "public" { type = string }
variable "network" { type = string }
variable "private" { type = string }
variable "internet" { type = string }
variable "security" { type = string }
variable "ifunction" { type = string }
variable "pfunction" { type = string }
variable "aspnetcore" { type = string }
variable "environment" { type = string }

# Resources Groups.
variable "vm" { type = string }
variable "apps" { type = string }
variable "storage" { type = string }
variable "networking" { type = string }

# Azure Providers.
variable "destroy" {}
variable "resources" {}
variable "tenant" { type = string }
variable "subscription" { type = string }

locals {
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
  dns         = var.dns
  ivm         = var.ivm
  key         = var.key
  lan         = var.lan
  pvm         = var.pvm
  sql         = var.sql
  vms         = var.vms
  pdns        = var.pdns
  dns2        = var.dns2
  dns3        = var.dns3
  dns4        = var.dns4
  public      = var.public
  network     = var.network
  private     = var.private
  security    = var.security
  internet    = var.internet
  ifunction   = var.ifunction
  pfunction   = var.pfunction
  aspnetcore  = var.aspnetcore
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
    "payments" = {
      function = "payments"
      node     = "storybook"
      net      = "backoffice-api"
    },

    "nanaykuna" = {
      node     = "nanaykuna"
      function = "invoices-functions"
      net      = "bff-integration-infra"
    },

    # BackOffice
    "backoffice" = {
      net      = "backoffice"
      node     = "ticket-manager"
      function = "back-office-functions"
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

    "ticket-manager" = {
      node     = ""
      net      = ""
      function = "shipping-dates"
    },

    "customer-loyalty" = {
      net      = ""
      node     = ""
      function = "customer-loyalty"
    },

    "shipping-reports" = {
      net      = ""
      node     = ""
      function = "shipping-reports"
    },

    "products-functions" = {
      node     = ""
      net      = ""
      function = "products-functions"
    },

    "bff-integration-infra" = {
      node     = ""
      net      = ""
      function = "shipping-experience"
    }
  }
}
