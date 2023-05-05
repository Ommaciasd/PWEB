variable "dotnet-version" {
  type = string
  default = "6.0"
}
variable "location-name" {
  type = string
  description = "Location of service"
  default = "eastus"
}
variable "allowed_origins" {
  type    = list(string)
  default = []
}
variable "app_settings" {
  type = map (string)
}

variable "func-service-name-netcore" {
  type = string
  description = "Name of function linux service"
}

variable "resource_group_name" {
  type = string
  description = "Name of resource group"
}

variable "service-plan-id" {
  type = string
  description = "Name of resource group"
}
variable "storage-name" {
  type = string
  description = "Storage name"
}

variable "primary_access_key" {
  type = string
  description = "Storage primary access key"
}

#variable "db-connection-string" {
#  type = string
#  description = "Db connection string"
#}

#variable "app-insight-instrumentation-key" {
#  type = string
#  description = "Application insight instrumentation key"
#}
#variable "app-insight-connection-string" {
#  type = string
#  description = "Application insight iconnection string"
#}