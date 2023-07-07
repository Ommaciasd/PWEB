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
  days        = 2
  priority    = 1
  length      = 50
  extension   = "~3"
  efunctions  = "~4"
  always      = true
  dotnet      = "6.0"
  file        = "File"
  action      = "Deny"
  override    = "#&%^|"
  profile     = "1.0.0"
  key         = var.key
  location    = "eastus"
  plan        = var.plan
  vnode       = "16-lts"
  plan2       = var.plan2
  group       = var.group
  portal      = "ASP.NET"
  feature     = "disabled"
  runtime     = "dotnet"
  ip          = "0.0.0.0/0"
  private     = var.private
  storage     = var.storage
  created     = "terraform"
  assetname   = "nanaykuna"
  aspnetcore  = "Development"
  recommended = "recommended"
  tz          = "America/Lima"
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
