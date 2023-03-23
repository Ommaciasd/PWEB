variable "base_name" {
  type        = string
  description = "The base name for every resource"
}

variable "resource_group_name" {
  type        = string
  description = "The resource group's name"
}

variable "location" {
  type        = string
  default     = "eastus" # Azure's Datacenter Location.
  description = "The deployment's location"
}

variable "service_plan_id" {
  type        = string
  description = "The service plan's ID"
}

variable "assetname" {
  type = string
}

variable "enviroment" {
  type = string
}

variable "instance_count" {
  type    = number
  default = 1
}
