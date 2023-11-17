variable "plan" {
  type    = list(string)
  default = ["webs", "functions"]
}

locals {
  db          = var.db
  vm          = var.vm
  lvmss       = var.lvmss
  dns         = var.dns
  key         = var.key
  sql         = var.sql
  apps        = var.apps
  pdns        = var.pdns
  tenant       = var.tenant
  destroy      = var.destroy
  security     = var.security
  network      = var.network
  resources    = var.resources
  aspnetcore   = var.aspnetcore
  environment  = var.environment
  subscription = var.subscription
}

variable "gateway" {
  type = list(object({
    name           = string
    address_prefix = string
  }))
  default = [

    {
      name           = "gw-01"
      address_prefix = "10.10.0.0/24"
    },

    {
      name           = "functions"
      address_prefix = "10.10.2.0/24"
    }
  ]
}

variable "dns" {
  type = list(object({
    name      = string
    host_name = string
  }))
  default = [

    {
      name      = "progresolmas.pe"
      host_name = "ns1-35.azure-dns.com"
    },

    {
      name      = "progresolplus.pe"
      host_name = "ns1-34.azure-dns.com"
    },

    {
      name      = "progresolmas.com"
      host_name = "ns1-33.azure-dns.com"
    },

    {
      name      = "progresolplus.com"
      host_name = "ns1-37.azure-dns.com"
    }
  ]
}

variable "subnet" {
  type = list(object({
    name           = string
    address_prefix = string
  }))
  default = [

    {
      name           = "snet-01"
      address_prefix = "10.10.1.0/24"
    },

    {
      name           = "vms"
      address_prefix = "10.10.3.0/24"
    }
  ]
}

variable "destroy" {}
variable "resources" {}
variable "db" { type = string }
variable "vm" { type = string }
variable "key" { type = string }
variable "sql" { type = string }
variable "apps" { type = string }
variable "pdns" { type = string }
variable "lvmss" { type = string }
variable "tenant" { type = string }
variable "network" { type = string }
variable "security" { type = string }
variable "aspnetcore" { type = string }
variable "environment" { type = string }
variable "subscription" { type = string }

variable "data" {
  type    = list(string)
  default = ["nanaykuna", "public", "private"]
}

variable "group" {
  type    = list(string)
  default = ["vms", "apps", "storage", "networking"]
}

variable "node" {
  type = list(string)
  default = ["nanaykuna", "ticket-manager", "storybook-nanaykuna"
  ]
}

variable "net" {
  type    = list(string)
  default = ["backoffice", "backoffice-api", "bff-integration-infra"]
}

variable "function" {
  type = list(string)
  default = ["marketing", "payments", "notification", "shipping-reports",
  "shipping-dates", "customer-loyalty", "invoices-functions", "products-functions",
  "shipping-experience", "back-office-functions"]
}
