# Outputs
# Resource Groups.
output "vms" {
  value = module.groups.vm
}

output "apps" {
  value = module.groups.apps
}

output "storage" {
  value = module.groups.storage
}

output "networking" {
  value = module.groups.networking
}

# Storage Accounts.
output "sapps" {
  value = module.storage.apps
}
