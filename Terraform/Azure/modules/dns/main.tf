# Configure Azure DNS for Public name resolution.
# progresolplus.pe
resource "azurerm_dns_zone" "dns" {
  for_each            = { for idx, dns in var.dns : idx => dns }
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

# configure Azure DNS for internal name resolution.
# dev-nanaykuna.azurewebsites.net
resource "azurerm_private_dns_zone" "private" {
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
  ttl                 = local.ttl
  resource_group_name = local.group
  name                = "backoffice"
  records             = ["20.119.0.4"]
  zone_name           = azurerm_dns_zone.dns[1].name
}

resource "azurerm_dns_a_record" "test" {
  ttl                 = local.ttl
  name                = local.test
  resource_group_name = local.group
  zone_name           = azurerm_dns_zone.dns[1].name
  records             = ["20.172.245.13", "20.119.0.4"]
}

resource "azurerm_dns_ns_record" "progresolplus" {
  tags = {
    created_by  = local.created
    environment = local.environment
  }

  ttl                 = local.ttl2
  resource_group_name = local.group
  name                = local.private2
  zone_name           = azurerm_dns_zone.dns[1].name
  records             = ["ns1-34.azure-dns.com", "ns2-34.azure-dns.net", "ns3-34.azure-dns.org", "ns4-34.azure-dns.info"]
}

resource "azurerm_dns_mx_record" "progresolplus" {
  tags = {
    created_by  = local.created
    environment = local.environment
  }

  ttl                 = local.ttl3
  resource_group_name = local.group
  name                = local.private2
  zone_name           = azurerm_dns_zone.dns[1].name

  record {
    preference = 0
    exchange   = "progresolplus-pe.mail.protection.outlook.com"
  }
}

# backoffice-dev.progresolplus.pe
resource "azurerm_dns_cname_record" "backoffice-dev" {
  ttl                 = local.ttl
  resource_group_name = local.group
  zone_name           = azurerm_dns_zone.dns[1].name
  name                = "backoffice-${local.environment}"
  record              = "backoffice-dev.progresolplus.pe.cdn.cloudflare.net"
}

# front-dev.progresolplus.pe
resource "azurerm_dns_cname_record" "front-dev" {
  ttl                 = local.ttl3
  resource_group_name = local.group
  zone_name           = azurerm_dns_zone.dns[1].name
  name                = "front-${local.environment}"
  record              = "front-dev.progresolplus.pe.cdn.cloudflare.net"
}

resource "azurerm_dns_cname_record" "storybook-dev" {
  ttl                 = local.ttl3
  resource_group_name = local.group
  record              = "storybook-dev"
  zone_name           = azurerm_dns_zone.dns[1].name

  name                = "storybook-${local.environment}"
}

resource "azurerm_dns_txt_record" "progresolplus-pe-asuid" {
  record {
    value = local.value
  }

  record {
    value = "ms39811096"
  }

  tags = {
    created_by  = local.created
    environment = local.environment
  }

  record {
    value = "39m027n32gqb70j39q18560626"
  }

  record {
    value = "ca3-5ee24f2150274d099ceecbf5fb043244"
  }

  ttl                 = local.ttl
  resource_group_name = local.group
  zone_name           = azurerm_dns_zone.dns[1].name
  name                = "progresolplus.pe.asuid.backoffice"

  record {
    value = "v=spf1 include:spf.protection.outlook.com -all"
  }
}

resource "azurerm_dns_cname_record" "autodiscover" {
  ttl                 = local.ttl3
  resource_group_name = local.group
  name                = "autodiscover"
  record              = "autodiscover.outlook.com"
  zone_name           = azurerm_dns_zone.dns[1].name
}

resource "azurerm_dns_txt_record" "progresolplus-asuid" {
  record {
    value = local.value
  }

  tags = {
    created_by  = local.created
    environment = local.environment
  }

  ttl                 = local.ttl
  resource_group_name = local.group
  name                = "asuid.backoffice"
  zone_name           = azurerm_dns_zone.dns[1].name
}

resource "azurerm_dns_txt_record" "cloudflare-verify" {
  record {
    value = "714171566-591479338"
  }

  tags = {
    created_by  = local.created
    environment = local.environment
  }

  ttl                 = local.ttl
  resource_group_name = local.group
  name                = "cloudflare-verify"
  zone_name           = azurerm_dns_zone.dns[1].name
}

resource "azurerm_dns_txt_record" "asuid-storybook-dev" {
  tags = {
    created_by  = local.created
    environment = local.environment
  }

  ttl                 = local.ttl3
  resource_group_name = local.group
  zone_name           = azurerm_dns_zone.dns[1].name
  name                = "asuid.storybook-${local.environment}"

  record {
    value = "storybook-dev.progresolplus.pe.cdn.cloudflare.net"
  }
}

resource "azurerm_dns_a_record" "www" {
  name                = "www"
  ttl                 = local.ttl3
  resource_group_name = local.group
  records             = ["20.172.245.13"]
  zone_name           = azurerm_dns_zone.dns[1].name
}

resource "azurerm_dns_a_record" "progresolmas-test" {
  ttl                 = 10
  name                = local.test
  resource_group_name = local.group
  records             = ["10.0.1.2"]
  zone_name           = azurerm_dns_zone.dns[0].name
}
