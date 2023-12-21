variable "created"     { type = string }
variable "location"    { type = string }
variable "assetname"   { type = string }
variable "environment" { type = string }

variable "access_policies" {
  description = "List of access policies for the Key Vault."
  type        = list(object({
    tenant_id = string
    object_id = string
  }))
}

variable "group" {
  description = "Resource group name."
  type        = string
}

variable "active" {
  description = "Flag to enable/disable certain features."
  type        = bool
}
