variable "app_settings" {
  type = any #map(string)
}
variable "https_only" {
  type = string
  default = "true"
}
variable "name" {
  type    = string
}
variable "location-name" {
  type    = string
  default = "eastus"
}

variable "node-version-linux" {
  type    = string
  default = "16-lts"
}

variable "dotnet-version-linux" {
  type    = string
  default = "6.0"
}
variable "azurerm_service_plan_name" {
  type    = string 
}
variable "resource_group_name" {
  type = string
}
variable "allowed_origins" {
  type    = list(string)
  default = []
}
