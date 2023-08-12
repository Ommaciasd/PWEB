# environments/production/terragrunt.hcl
terraform {
  source = "../../modules/vms"
}

inputs = {
  name     = "prod-vm"
  location = "East US"
}
