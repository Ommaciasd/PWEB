variable "created"     { type = string }
variable "location"    { type = string }
variable "assetname"   { type = string }
variable "environment" { type = string }
variable "permissions" { type = string }
variable "sku" { type = string }
variable "apps" { type = string }
variable "protection" { type = string }
variable "encryption" { type = string }
variable "days" { type = string }


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

variable "key_vault_reference_identity_id" {
  description = "key vault reference identity id."
  type        = string
}
