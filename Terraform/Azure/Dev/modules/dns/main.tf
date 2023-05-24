# configure Azure DNS for internal name resolution.
# dev-nanaykuna.azurewebsites.net
resource "azurerm_private_dns_zone" "private" {
  resource_group_name = local.group
  name                = local.private
  soa_record {
    email = "azureprivatedns-host.microsoft.com"

    tags = {
      environment = local.environment
    }
  }
}

# Configure Azure DNS for Public name resolution.
# progresolplus.pe
resource "azurerm_dns_zone" "dns" {
  name                = local.dns
  resource_group_name = local.group

  soa_record {
    host_name = "ns1-34.azure-dns.com"
    email = "azuredns-hostmaster.microsoft.com"

    tags = {
      environment = local.environment
    }
  }
}

resource "azurerm_dns_a_record" "backoffice" {
  name                = "backoffice"
  zone_name           = azurerm_dns_zone.dns.name
  resource_group_name = local.group
  ttl                 = 300
  records             = ["20.119.0.4"]
}

resource "azurerm_dns_a_record" "test" {
  name                = "test"
  resource_group_name = local.group
  ttl                 = 300
  zone_name           = azurerm_dns_zone.dns.name
  records             = ["20.172.245.13", "20.119.0.4"]
}

resource "azurerm_dns_ns_record" "progresolplus" {
  name                = "private"
  ttl                 = 172800
  resource_group_name = local.group
  zone_name           = azurerm_dns_zone.dns.name
  records             = ["ns1-34.azure-dns.com", "ns2-34.azure-dns.net", "ns3-34.azure-dns.org", "ns4-34.azure-dns.info"]

  tags = {
    environment = local.environment  }
}

resource "azurerm_dns_mx_record" "progresolplus" {
  ttl                 = 3600
  resource_group_name = local.group
  name                = "private"
  zone_name           = azurerm_dns_zone.dns.name

  record {
    preference = 0
    exchange   = "progresolplus-pe.mail.protection.outlook.com"
  }

  tags = {
    environment = local.environment
    }
  }

# backoffice-dev.progresolplus.pe
resource "azurerm_dns_cname_record" "backoffice-dev" {
  ttl                 = 300
  zone_name           = azurerm_dns_zone.dns.name
  resource_group_name = local.group
  name                = "backoffice-${local.environment}"
  record              = "backoffice-dev.progresolplus.pe.cdn.cloudflare.net"
}

# front-dev.progresolplus.pe
resource "azurerm_dns_cname_record" "front-dev" {
  ttl                 = 3600
  resource_group_name = local.group
  zone_name           = azurerm_dns_zone.dns.name
  name                = "front-${local.environment}"
  record              = "front-dev.progresolplus.pe.cdn.cloudflare.net"
}

resource "azurerm_dns_cname_record" "storybook-dev" {
  ttl                 = 3600
  resource_group_name = local.group
  record              = "storybook-dev"
  zone_name           = azurerm_dns_zone.dns.name

  name                = "storybook-${local.environment}"
}

resource "azurerm_dns_txt_record" "progresolplus-pe-asuid" {
  record {
    value = "ms39811096"
  }

  ttl                 = 300
  resource_group_name = local.group
  zone_name           = azurerm_dns_zone.dns.name
  name                = "progresolplus.pe.asuid.backoffice"

  tags = {
    environment = local.environment
  }

  record {
    value = "39m027n32gqb70j39q18560626"
  }

  record {
    value = "ca3-5ee24f2150274d099ceecbf5fb043244"
  }

  record {
    value = "v=spf1 include:spf.protection.outlook.com -all"
  }

  record {
    value = "BE59ABCD5CA8C90D1A3AA0D6B37FCA7854E9A5AC000451FD8B8221B6B4C69B5D"
  }

}

resource "azurerm_dns_cname_record" "autodiscover" {
  ttl                 = 3600
  resource_group_name = local.group
  name                = "autodiscover"
  record              = "autodiscover.outlook.com"
  zone_name           = azurerm_dns_zone.dns.name
}

resource "azurerm_dns_txt_record" "progresolplus-asuid" {
  ttl                 = 300
  resource_group_name = local.group
  name                = "asuid.backoffice"
  zone_name           = azurerm_dns_zone.dns.name

  tags = {
    environment = local.environment
  }

  record {
    value = "BE59ABCD5CA8C90D1A3AA0D6B37FCA7854E9A5AC000451FD8B8221B6B4C69B5D"
  }
}

resource "azurerm_dns_txt_record" "cloudflare-verify" {
  ttl                 = 300
  resource_group_name = local.group
  name                = "cloudflare-verify"
  zone_name           = azurerm_dns_zone.dns.name

  record {
    value = "714171566-591479338"
  }

  tags = {
    environment = local.environment
  }
}

resource "azurerm_dns_txt_record" "asuid-storybook-dev" {
  ttl                 = 3600
  resource_group_name = local.group
  zone_name           = azurerm_dns_zone.dns.name
  name                = "asuid.storybook-${local.environment}"

  tags = {
    environment = local.environment
  }

  record {
    value = "storybook-dev.progresolplus.pe.cdn.cloudflare.net"
  }
}

resource "azurerm_dns_a_record" "www" {
  ttl                 = 3600
  name                = "www"
  resource_group_name = local.group
  records             = ["20.172.245.13"]
  zone_name           = azurerm_dns_zone.dns.name
}


# progresolmas.com
resource "azurerm_dns_zone" "dns2" {
  name                = local.dns2
  resource_group_name = local.group

  soa_record {
    host_name = "ns1-33.azure-dns.com"
    email = "azuredns-hostmaster.microsoft.com"

    tags = {
      environment = local.environment
    }
  }
}

/* resource "azurerm_dns_ns_record" "progresolmas" {
  name                = "@"
  zone_name           = azurerm_dns_zone.dns2.name
  resource_group_name = local.group
  ttl                 = 172800
  records              = ["ns1-33.azure-dns.com", "ns2-33.azure-dns.net", "ns3-33.azure-dns.org", "ns4-33.azure-dns.info"]
} */


# progresolmas.pe
resource "azurerm_dns_zone" "dns3" {
  name                = local.dns3
  resource_group_name = local.group

  soa_record {
    host_name = "ns1-35.azure-dns.com"
    email = "azuredns-hostmaster.microsoft.com"

    tags = {
      environment = local.environment
    }
  }
}

/* resource "azurerm_dns_ns_record" "progresolmas-pe-ns" {
  name                = "@"
  zone_name           = azurerm_dns_zone.dns3.name
  resource_group_name = local.group
  ttl                 = 172800
  records              = ["ns1-35.azure-dns.com", "ns2-35.azure-dns.net", "ns3-35.azure-dns.org", "ns4-35.azure-dns.info"]
} */

resource "azurerm_dns_a_record" "progresolmas-test" {
  ttl                 = 10
  name                = "test"
  records             = ["10.0.1.2"]
  zone_name           = azurerm_dns_zone.dns3.name
  resource_group_name = local.group
}


# progresolplus.com
resource "azurerm_dns_zone" "dns4" {
  name                = local.dns4
  resource_group_name = local.group

  soa_record {
    host_name = "ns1-37.azure-dns.com"
    email = "azuredns-hostmaster.microsoft.com"

    tags = {
      environment = local.environment
    }
  }
}

/* resource "azurerm_dns_ns_record" "progresolplus-com-ns" {
  name                = "@"
  zone_name           = azurerm_dns_zone.dns4.name
  resource_group_name = local.group
  ttl                 = 172800
  records              = ["ns1-37.azure-dns.com", "ns2-37.azure-dns.net", "ns3-37.azure-dns.org", "ns4-37.azure-dns.info"]

  tags = {
    environment = local.environment
  }
} */
