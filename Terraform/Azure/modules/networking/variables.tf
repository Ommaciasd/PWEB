variable "apps"        { type = string }
variable "group"       { type = string }
variable "network"     { type = string }
variable "created"     { type = string }
variable "location"    { type = string }
variable "assetname"   { type = string }
variable "environment" { type = string }

variable "subnet" {
  type = list(object({
    name           = string
    address_prefix = string
  }))
}

variable "gateway" {
  type = list(object({
    name            = string
    address_prefix  = string
  }))
}

locals {
  name        = format("sn-%s-%s-tf-%s", var.assetname, var.environment, var.location)
  apps        = format("vn-%s-%s-tf-%s-%s", var.assetname, var.environment, var.location, var.apps)
}
