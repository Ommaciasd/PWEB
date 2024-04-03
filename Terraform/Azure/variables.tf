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
      name           = "subnet"
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
      name      = "$WEB_DOMAIN_mas.$COUNTRY_ROOT"
      host_name = "ns1-35.azure-dns.$ROOT"
    }
  ]
}

variable "subnet" {
  type = list(object({
    name           = string
    address_prefix = string
    delegation     = string
  }))
  default = [

    {
      name           = "$snet"
      address_prefix = "$IP_ADDRESS_SNET/$VLSM_SNET"
      delegation     = "none"
    },

    {
      name           = "$snet_postgresql"
      address_prefix = "$IP_ADDRESS_SNET_2/$VLSM_SNET_2"
      delegation     = "Microsoft.DBforPostgreSQL/serverGroups"
    }
  ]
}

locals {
  length                          = 50
  db                              = "db"
  sql                             = "sql"
  active                          = true
  destroy                         = true
  apps                            = "apps"
  vm                              = "robot"
  override_special                = "#&%^|"
  location                        = "$location"
  appinsights                     = "ASP.NET"
  lvmss                           = "$lvmss"
  feature                         = "disabled"
  created                         = "terraform"
  assetname                       = "$ORGANIZATION"
  aspnetcore                      = "Development"
  tz                              = "$tz"
  identity                        = "SystemAssigned"
  key                             = "$ORGANIZATION-cus-kv"
  security                        = "$BASTION"
  pdns                            = "$ORGANIZATION.azurewebsites.net"
  environment                     = ""
  key_vault_reference_identity_id = "$key_vault_reference_identity_id"
  server_name                     = "$postgresql-server"
  identity_name                   = "$Identity"
  delegation                      = "Microsoft.DBforPostgreSQL/flexibleServers"
  actions                         = "Microsoft.Network/virtualNetworks/subnets/join/action"
  microsoft                       = "$MICROSOFT_DELEGATION"
  encryption                      = "$encryption"
  protection                      = "$protection"
  days                            = "$days"
  sku                             = "$sku"
  permissions                     = "$permissions"
  node_version                    = "$node_version"
  extension_version               = "$extension_version"
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
  default = ["$ORGANIZATION", "node-$ORGANIZATION"]
}

variable "net" {
  type    = list(string)
  default = ["net"]
}

variable "function" {
  type    = list(string)
  default = ["function"]
}

variable "network" {
  description = "Espacio de direcciones de la VNet"
  type        = list(string)
  default     = ["$IP_ADDRESS_VNET/$VLSM", "$IP_ADDRESS_VNET_2/$VLSM_2"]
}
