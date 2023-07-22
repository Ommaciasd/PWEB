# SUBNETS.
variable "private"     { type = any }
variable "pfunction"   { type = any }

variable "app"         { type = string }
variable "key"         { type = string }
variable "plan"        { type = string }
variable "group"       { type = string }
variable "storage"     { type = string }
variable "connection"  { type = string }
variable "environment" { type = string }
variable "aspnetcore"  { type = string }

locals {
  days        = 2
  priority    = 1
  length      = 50
  extension   = "~3"
  efunctions  = "~4"
  always      = true
  file        = "File"
  action      = "Deny"
  override    = "#&%^|"
  profile     = "1.0.0"
  key         = var.key
  location    = "eastus"
  plan        = var.plan
  vnode       = "16-lts"
  group       = var.group
  portal      = "ASP.NET"
  feature     = "disabled"
  runtime     = "dotnet"
  ip          = "0.0.0.0/0"
  private     = var.private
  storage     = var.storage
  created     = "terraform"
  assetname   = "nanaykuna"
  recommended = "recommended"
  tz          = "America/Lima"
  aspnetcore  = var.aspnetcore
  connection  = var.connection
  environment = var.environment
  rule        = "Block Access Public"
  subresource = "sites"       # PSC subresource names.
  manual      = "false"       # ENABLE PRIVATE LINK ENDPOINT.
  pfunction   = var.pfunction # ID PUBLIC SUBNET APP Functions.
  function    = format("lfa-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.app)

  # Private Endpoints.
  endpoint    = format("pe-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.app)
  pscendpoint = format("psce-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.app)
}
