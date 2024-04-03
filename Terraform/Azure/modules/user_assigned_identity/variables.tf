// variables.tf

variable "identity_name" {
  description = "Nombre de la identidad administrada"
  type        = string
}

variable "group" {
  description = "El nombre del grupo de recursos de Azure"
  type        = string
}

variable "location" {
  description = "The name of the resource group location."
  type        = string
}
