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
