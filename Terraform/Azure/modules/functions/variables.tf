locals {      
  location  = "eastus"
  assetname = "nanaykuna"
  always     = true
  action = "Deny" 
  rule = "Block Access Public"
  priority = 1
  ip = "0.0.0.0/0"
  environment = var.environment
  group = var.group
  public = var.public
  private = var.private
  storage = var.storage
  plan = var.plan
  manual     = "false" # ENABLE PRIVATE LINK ENDPOINT.
  subresource     = "sites" # PSC subresource names.
  function = format("lfa-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.function)
}

variable "environment" {
  type = string
  description = "The environment for all resources"
}

variable "plan" {
  type        = string
  description = "The service plan's ID"
}

variable "function" {
  type        = string
  description = "The base name for every resource"
}

variable "group" {
  type        = string
  description = "The resource group's name"
}

variable "storage" {
  type        = string
  description = "The storage account's name"
}

variable "public" {
  type        = string
  description = "The subnet's ID"
}

variable "private" {
  type        = string
  description = "The subnet's ID"
}
