# Outputs
# Resource Groups.
output "vms" {
  value = module.groups.vms
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
/* output "sapps" {
  value = module.storage.apps
} */

# Networking.
output "napps" {
  value = module.networking.apps
}

output "webs" {
  value = module.networking.webs
}
