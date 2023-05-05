locals {
      location     = "eastus"
  assetname = "nanaykuna"
    environment = var.environment
    group = var.group
    public = var.public
    plan = var.plan
  web = format("lwa%s%s%s", local.assetname, var.environment, var.web)
}

variable "environment" {
  type = string
}

variable "plan" {
  type        = string
  description = "The service plan's ID"
}

variable "group" {
  type        = string
  description = "The resource group's name"
}

variable "public" {
  type        = string
  description = "The subnet's ID"
}

variable "web" {
  type        = string
  description = "The linux web app name's"
}
