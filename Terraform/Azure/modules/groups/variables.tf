variable "environment" { type = string }
variable "app"         { type = list(string) }
variable "location"    { type = string }
variable "assetname"   { type = string }
variable "created"     { type = string }

locals {
  name        = format("rg-%s-%s-tf-%s", var.assetname, var.environment, var.location)
}
