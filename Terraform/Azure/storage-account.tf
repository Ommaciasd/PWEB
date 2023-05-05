module "storage_account_function" {
  source = "./modules/storage-accounts"
  storage-account-name = "devfunctionstf"
  location-name = var.location-name
  resource_group_name = var.resource_group_name
}