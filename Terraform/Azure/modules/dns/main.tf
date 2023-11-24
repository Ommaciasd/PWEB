resource "azurerm_dns_zone" "dns" {
  for_each            = var.create_dns_resource ? { for idx, dns in var.dns : idx => dns } : {}
  name                = "${tostring(each.value.name)}"
  resource_group_name = local.group

  soa_record {
    tags = {
      created_by  = local.created
      environment = local.environment
    }

    host_name = "${tostring(each.value.host_name)}"
    email     = local.email
  }
}

resource "azurerm_private_dns_zone" "private" {
  count               = var.create_dns_resource ? 1 : 0
  resource_group_name = local.group
  name                = local.private

  soa_record {
    tags = {
      created_by  = local.created
      environment = local.environment
    }

    email = "azureprivatedns-host.microsoft.com"
  }
}

resource "azurerm_dns_a_record" "backoffice" {
  count               = var.create_dns_resource ? 1 : 0
  ttl                 = local.ttl
  resource_group_name = local.group
  name                = "backoffice"
  records             = ["20.119.0.4"]
  zone_name           = var.create_dns_resource ? azurerm_dns_zone.dns[1].name : null
}

resource "azurerm_dns_a_record" "test" {
  count               = var.create_dns_resource ? 1 : 0
  ttl                 = local.ttl
  name                = local.test
  resource_group_name = local.group
  zone_name           = var.create_dns_resource ? azurerm_dns_zone.dns[1].name : null
  records             = ["20.172.245.13", "20.119.0.4"]
}

resource "azurerm_dns_a_record" "www" {
  count               = var.create_dns_resource ? 1 : 0
  name                = "www"
  ttl                 = local.ttl3
  resource_group_name = local.group
  records             = ["20.172.245.13"]
  zone_name           = var.create_dns_resource ? azurerm_dns_zone.dns[1].name : null
}

resource "azurerm_dns_a_record" "progresolmas-test" {
  count               = var.create_dns_resource ? 1 : 0
  ttl                 = 10
  name                = local.test
  resource_group_name = local.group
  records             = ["10.0.1.2"]
  zone_name           = var.create_dns_resource ? azurerm_dns_zone.dns[0].name : null
}
