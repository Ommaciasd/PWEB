# configure Azure DNS for internal name resolution.
# dev-nanaykuna.azurewebsites.net
resource "azurerm_private_dns_zone" "dns" {
  name                = local.dns
  resource_group_name = local.group
}

resource "azurerm_private_dns_cname_record" "private" {
  name                = "private"
  zone_name           = azurerm_private_dns_zone.dns.name
  resource_group_name = local.group
  ttl                 = 300
  record              = "contoso.com"
}

resource "azurerm_private_dns_a_record" "dev-nanaykuna-shipping-reports" {
  name                = "dev-nanaykuna-shipping-reports"
  zone_name           = azurerm_private_dns_zone.dns.name
  resource_group_name = local.group
  ttl                 = 10
  records             = ["10.3.0.5"]
}

resource "azurerm_private_dns_a_record" "dev-nanaykuna-shipping-reportsscm" {
  name                = "dev-nanaykuna-shipping-reports.scm"
  zone_name           = azurerm_private_dns_zone.dns.name
  resource_group_name = local.group
  ttl                 = 10
  records             = ["10.3.0.5"]
}

resource "azurerm_private_dns_a_record" "dev-nanaykuna-notification" {
  name                = "dev-nanaykuna-notification"
  zone_name           = azurerm_private_dns_zone.dns.name
  resource_group_name = local.group
  ttl                 = 10
  records             = ["10.3.0.10"]
}

resource "azurerm_private_dns_a_record" "dev-nanaykuna-notificationscm" {
  name                = "dev-nanaykuna-notification.scm"
  zone_name           = azurerm_private_dns_zone.dns.name
  resource_group_name = local.group
  ttl                 = 10
  records             = ["10.3.0.10"]
}

resource "azurerm_private_dns_a_record" "dev-nanaykuna-products-functions" {
  name                = "dev-nanaykuna-products-functions"
  zone_name           = azurerm_private_dns_zone.dns.name
  resource_group_name = local.group
  ttl                 = 10
  records             = ["10.3.0.11"]
}

resource "azurerm_private_dns_a_record" "dev-nanaykuna-products-functionsscm" {
  name                = "dev-nanaykuna-products-functions.scm"
  zone_name           = azurerm_private_dns_zone.dns.name
  resource_group_name = local.group
  ttl                 = 10
  records             = ["10.3.0.11"]
}

resource "azurerm_private_dns_a_record" "e-dev-back-office-function-pl" {
  name                = "e-dev-back-office-function-pl"
  zone_name           = azurerm_private_dns_zone.dns.name
  resource_group_name = local.group
  ttl                 = 10
  records             = ["10.3.0.15"]
}

resource "azurerm_private_dns_a_record" "edevbackofficefunctionplscm" {
  name                = "e-dev-back-office-function-pl.scm"
  zone_name           = azurerm_private_dns_zone.dns.name
  resource_group_name = local.group
  ttl                 = 10
  records             = ["10.3.0.15"]
}

# front-dev.progresolplus.pe
resource "azurerm_private_dns_zone" "dns2" {
  name                = local.dns2
  resource_group_name = local.group
}

resource "azurerm_private_dns_a_record" "storageaccountsfundev" {
  name                = "storageaccountsfundev"
  zone_name           = azurerm_private_dns_zone.dns2.name
  resource_group_name = local.group
  ttl                 = 10
  records             = ["10.3.0.6"]
}

# dev-nanaykuna-backoffice.azurewebsites.net
resource "azurerm_private_dns_zone" "dns3" {
  name                = local.dns3
  resource_group_name = local.group
}

# backoffice-dev.progresolplus.pe
resource "azurerm_private_dns_zone" "dns4" {
  name                = local.dns4
  resource_group_name = local.group
}

# dev-nanaykuna-bff-integration-infra.azurewebsites.net
resource "azurerm_private_dns_zone" "dns5" {
  name                = local.dns5
  resource_group_name = local.group
}

# dev-nanaykuna-ticket-manager.azurewebsites.net
resource "azurerm_private_dns_zone" "dns6" {
  name                = local.dns6
  resource_group_name = local.group
}
