variable "db"          { type = string }
variable "sql"         { type = string }
variable "group"       { type = string }
variable "environment" { type = string }

locals {
  gb            = "4"
  tls           = "1.2"
  version       = "12.0"
  location      = "eastus"
  group         = var.group
  created       = "terraform"
  assetname     = "nanaykuna"
  environment   = var.environment
  type          = "LicenseIncluded"
  administrator = "missadministrator"
  password      = "#BMfF6SAfKn20Sej52"
  collation     = "SQL_Latin1_General_CP1_CI_AS"
  sql           = format("sql-%s-%s-tf-%s", local.assetname, var.environment, local.location)
  db            = format("db-%s-%s-tf-%s-SupportDb", local.assetname, var.environment, local.location)
}
