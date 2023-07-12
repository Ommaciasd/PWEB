variable "ivm"         { type = string }
variable "pvm"         { type = string }
variable "web"         { type = string }
variable "apps"        { type = string }
variable "group"       { type = string }
variable "public"      { type = string }
variable "network"     { type = string }
variable "private"     { type = string }
variable "function"    { type = string }
variable "ifunction"   { type = string }
variable "pfunction"   { type = string }
variable "environment" { type = string }

locals {
  pvm         = var.pvm
  location    = "eastus"
  group       = var.group
  public      = var.public
  created     = "terraform"
  assetname   = "nanaykuna"
  network     = var.network
  private     = var.private
  pfunction   = var.pfunction
  environment = var.environment
  microsoft   = "Microsoft.Web/serverFarms"
  actions     = "Microsoft.Network/virtualNetworks/subnets/action"
  ivm         = format("sn-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.ivm)
  web         = format("sn-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.web)
  apps        = format("vn-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.apps)
  function    = format("sn-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.function)
  ifunction   = format("sn-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.ifunction)
  divm        = format("sn-%s-%s-tf-%s-%s-delegation", local.assetname, var.environment, local.location, var.ivm)
  dweb        = format("sn-%s-%s-tf-%s-%s-delegation", local.assetname, var.environment, local.location, var.web)
  difunction  = format("sn-%s-%s-tf-%s-%s-delegation", local.assetname, var.environment, local.location, var.ifunction)
}
