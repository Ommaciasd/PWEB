variable "plan" {
  type    = list(string)
  default = ["webs", "functions"]
}

variable "gateway" {
  type = list(object({
    name           = string
    address_prefix = string
  }))
  default = [

    {
      name           = "gw-01"
      address_prefix = "10.100.0.0/24"
    },

    {
      name           = "functions"
      address_prefix = "10.100.2.0/24"
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
      name      = "$WEB_DOMAIN_mas.$COUNTRY_ROOT"
      host_name = "ns1-35.azure-dns.$ROOT"
    },

    {
      name      = "$WEB_DOMAIN_plus.$COUNTRY_ROOT"
      host_name = "ns1-34.azure-dns.$ROOT"
    },

    {
      name      = "$WEB_DOMAIN_mas.$ROOT"
      host_name = "ns1-33.azure-dns.$ROOT"
    },

    {
      name      = "$WEB_DOMAIN_plus.$ROOT"
      host_name = "ns1-37.azure-dns.$ROOT"
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
      address_prefix = "10.100.1.0/24"
    },

    {
      name           = "vms"
      address_prefix = "10.100.3.0/24"
    }
  ]
}

locals {
  length           = 50
  db               = "db"
  sql              = "sql"
  active           = true
  destroy          = true
  apps             = "apps"
  vm               = "robot"
  override_special = "#&%^|"
  location         = "eastus"
  appinsights      = "ASP.NET"
  lvmss            = "devtools"
  feature          = "disabled"
  created          = "terraform"
  assetname        = "$ORGANIZATION"
  aspnetcore       = "Development"
  tz               = "America/Lima"
  network          = "10.100.0.0/16"
  identity         = "SystemAssigned"
  key              = "$ORGANIZATION-cus-kv"
  security         = "vm-bastionwin01-nsg"
  pdns             = "$ORGANIZATION.azurewebsites.net"
  environment      = "dev"
}

variable "data" {
  type    = list(string)
  default = ["data", "public", "private"]
}

variable "group" {
  type    = list(string)
  default = ["vms", "apps", "storage", "networking"]
}

variable "node" {
  type    = list(string)
  default = ["$ORGANIZATION", "ticket-manager", "storybook-$ORGANIZATION"]
}

variable "net" {
  type    = list(string)
  default = ["backoffice", "backoffice-api", "bff-integration-infra"]
}

variable "function" {
  type    = list(string)
  default = ["backoffice", "clients", "customer-loyalty", "invoicing", "marketing", "notification", "payments", "products", "sales-orders", "shipping-dates", "shipping-experience", "shipping-reports"]
}

# ToValidate: 20231123 - Deploy Static Web Apps.
# "storefront-b2c",
# "backoffice-ui",
# "storagefront"
