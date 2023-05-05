variable "name" {
  type = string
}

variable "asp-name" {
  type    = string
  default = "app-dev"
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
variable "aspnetcore_environment" {
  type    = string 
}
variable "api_key_secret" {
  type    = string  
}
variable "resource_group_name" {
  type = string
}
variable "env" {
  type = string
  
}