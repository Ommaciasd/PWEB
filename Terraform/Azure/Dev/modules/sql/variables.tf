locals {
  location    = "eastus"
  group       = var.group
  assetname   = "nanaykuna"
  environment = var.environment
  db          = format("%s-SupportDb", var.environment)
  sql         = format("db%s-%s", var.environment, local.assetname)
}

variable "db" {
  type        = string
  description = "The resource db's name"
}

variable "sql" {
  type        = string
  description = "The resource sql's name"
}

variable "group" {
  type        = string
  description = "The resource group's name"
}

variable "environment" {
  type = string
}
