# SUBNETS.
variable "public"      { type = string }
variable "private"     { type = string }
variable "pfunction"   { type = string }

variable "key"         { type = string }
variable "net"         { type = string }
variable "node"        { type = string }
variable "plan"        { type = string }
variable "plan2"       { type = string }
variable "group"       { type = string }
variable "storage"     { type = string }
variable "function"    { type = string }
variable "connection"  { type = string }
variable "environment" { type = string }

locals {
  priority    = 1
  extension   = "~2"
  always      = true
  action      = "Deny"
  feature     = "1.0.0"
  key         = var.key
  location    = "eastus"
  plan        = var.plan
  plan2       = var.plan2
  group       = var.group
  portal      = "ASP.NET"
  ip          = "0.0.0.0/0"
  private     = var.private
  storage     = var.storage
  created     = "terraform"
  assetname   = "nanaykuna"
  connection  = var.connection
  environment = var.environment
  rule        = "Block Access Public"
  public      = var.public    # ID PUBLIC SUBNET.
  subresource = "sites"       # PSC subresource names.
  manual      = "false"       # ENABLE PRIVATE LINK ENDPOINT.
  pfunction   = var.pfunction # ID PUBLIC SUBNET APP Functions.
  net         = format("lwa-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.net)
  node        = format("lwa-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.node)
  function    = format("lfa-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.function)

  # Private Endpoints.
  endpoint    = format("pe-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.function)
  pscendpoint = format("psce-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.function)
}
