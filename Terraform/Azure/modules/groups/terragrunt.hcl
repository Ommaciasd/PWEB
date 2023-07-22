locals {
    env_vars      = read_terragrunt_config(find_in_parent_folders("env.hcl"))
    global_vars   = read_terragrunt_config(find_in_parent_folders("global.hcl"))
    location_vars = read_terragrunt_config(find_in_parent_folders("location.hcl"))

    env      = local.env_vars.locals.env
    location = local.location.vars.locals.location
    suffix



}
