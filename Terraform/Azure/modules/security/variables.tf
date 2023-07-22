variable "web"         { type = string }
variable "apps"        { type = string }
variable "group"       { type = string }
variable "public"      { type = string }
variable "network"     { type = string }
variable "private"     { type = string }
variable "function"    { type = string }
variable "environment" { type = string }

locals {
  all         = "*"
  name        = "RDP"
  protocol    = "Tcp"
  priority4   = "300"
  port        = "3389"
  access2     = "Deny"
  access      = "Allow"
  priority    = "65000"
  priority2   = "65500"
  priority3   = "65501"
  location    = "eastus"
  group       = var.group
  direction   = "Inbound"
  internet    = "Internet"
  direction2  = "Outbound"
  public      = var.public
  network     = var.network
  private     = var.private
  assetname   = "nanaykuna"
  created     = "terraform"
  source      = "VirtualNetwork"
  environment = var.environment
  denyall     = "DenyAllInBound"
  denyallout  = "DenyAllOutbound"
  allowvnet   = "AllowVnetInBound"
  azure       = "AzureLoadBalancer"
  allowvneto  = "AllowVnetOutbound"
  azurein     = "AllowAzureLoadBalancerInBound"

  internetout = "AllowInternetOutBound"
  web         = format("s-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.web)
  apps        = format("v-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.apps)
  function    = format("spe-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.function)
}
