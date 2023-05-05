# Outputs
output "apps" {
  value = module.resource-group.apps
}

output "storage" {
  value = module.resource-group.storage
}

output "vms" {
  value = module.resource-group.vm
}

output "networking" {
  value = module.resource-group.networking
}

output "saccount" {
  value = module.storage-account.apps
}
