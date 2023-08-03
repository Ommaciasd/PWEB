# environments/dev/terragrunt.hcl
terraform {
  source = "../../modules/vms"
}

inputs = {
  name     = "dev-vm"
  location = "East US"
}
