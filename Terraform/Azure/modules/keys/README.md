# Terraform: Azure: Update scripts for Key Vaults

## Troubleshooting

- Failed login.

~~~ bash
az keyvault show --name $KEYVAULT_NAME --resource-group $RESOURCE_GROUP_NAME --query "properties.accessPolicies"
~~~

## Stages

## Publish

- Use the standard structure for publishing the changes

## terraform.tfvars

~~~ go
key = "$KEYVAULT_NAME"
~~~

### main.tf

~~~ go
module "keys" {
  environment = local.environment
  group       = module.groups.apps
  source      = ".//modules//keys"
  apps        = local.key
}
