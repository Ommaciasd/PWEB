# Configure Azure DNS for Public name resolution.
# progresolplus.pe
resource "azurerm_dns_zone" "dns" {
  name                = local.dns
  resource_group_name = local.group

  soa_record {
    tags = {
      created_by  = local.created
      environment = local.environment
    }

    host_name = "ns1-34.azure-dns.com"
    email     = "azuredns-hostmaster.microsoft.com"
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
  zone_name           = azurerm_dns_zone.dns.name
}

resource "azurerm_dns_a_record" "test" {
  ttl                 = local.ttl
  name                = local.test
  resource_group_name = local.group
  zone_name           = azurerm_dns_zone.dns.name
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
  zone_name           = azurerm_dns_zone.dns.name
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
  zone_name           = azurerm_dns_zone.dns.name

  record {
    preference = 0
    exchange   = "progresolplus-pe.mail.protection.outlook.com"
  }
}

# backoffice-dev.progresolplus.pe
resource "azurerm_dns_cname_record" "backoffice-dev" {
  ttl                 = local.ttl
  resource_group_name = local.group
  zone_name           = azurerm_dns_zone.dns.name
  name                = "backoffice-${local.environment}"
  record              = "backoffice-dev.progresolplus.pe.cdn.cloudflare.net"
}

# front-dev.progresolplus.pe
resource "azurerm_dns_cname_record" "front-dev" {
  ttl                 = local.ttl3
  resource_group_name = local.group
  zone_name           = azurerm_dns_zone.dns.name
  name                = "front-${local.environment}"
  record              = "front-dev.progresolplus.pe.cdn.cloudflare.net"
}

resource "azurerm_dns_cname_record" "storybook-dev" {
  ttl                 = local.ttl3
  resource_group_name = local.group
  record              = "storybook-dev"
  zone_name           = azurerm_dns_zone.dns.name

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
  zone_name           = azurerm_dns_zone.dns.name
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
  zone_name           = azurerm_dns_zone.dns.name
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
  zone_name           = azurerm_dns_zone.dns.name
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
  zone_name           = azurerm_dns_zone.dns.name
}

resource "azurerm_dns_txt_record" "asuid-storybook-dev" {
  tags = {
    created_by  = local.created
    environment = local.environment
  }

  ttl                 = local.ttl3
  resource_group_name = local.group
  zone_name           = azurerm_dns_zone.dns.name
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
  zone_name           = azurerm_dns_zone.dns.name
}

# progresolmas.com
resource "azurerm_dns_zone" "dns2" {
  name                = local.dns2
  resource_group_name = local.group

  soa_record {
    tags = {
      created_by  = local.created
      environment = local.environment
    }

    host_name = "ns1-33.azure-dns.com"
    email     = "azuredns-hostmaster.microsoft.com"
  }
}

/* resource "azurerm_dns_ns_record" "progresolmas" {
  name                = "@"
  zone_name           = azurerm_dns_zone.dns2.name
  resource_group_name = local.group
  ttl                 = local.ttl2
  records              = ["ns1-33.azure-dns.com", "ns2-33.azure-dns.net", "ns3-33.azure-dns.org", "ns4-33.azure-dns.info"]
} */

# progresolmas.pe
resource "azurerm_dns_zone" "dns3" {
  name                = local.dns3
  resource_group_name = local.group

  soa_record {
    tags = {
      created_by  = local.created
      environment = local.environment
    }

    host_name = "ns1-35.azure-dns.com"
    email     = "azuredns-hostmaster.microsoft.com"
  }
}

/* resource "azurerm_dns_ns_record" "progresolmas-pe-ns" {
  name                = "@"
  zone_name           = azurerm_dns_zone.dns3.name
  resource_group_name = local.group
  ttl                 = local.ttl2
  records              = ["ns1-35.azure-dns.com", "ns2-35.azure-dns.net", "ns3-35.azure-dns.org", "ns4-35.azure-dns.info"]
} */

resource "azurerm_dns_a_record" "progresolmas-test" {
  ttl                 = 10
  name                = local.test
  resource_group_name = local.group
  records             = ["10.0.1.2"]
  zone_name           = azurerm_dns_zone.dns3.name
}

# progresolplus.com
resource "azurerm_dns_zone" "dns4" {
  name                = local.dns4
  resource_group_name = local.group

  soa_record {
    tags = {
      created_by  = local.created
      environment = local.environment
    }

    host_name = "ns1-37.azure-dns.com"
    email     = "azuredns-hostmaster.microsoft.com"
  }
}

/* resource "azurerm_dns_ns_record" "progresolplus-com-ns" {
  name                = "@"
  zone_name           = azurerm_dns_zone.dns4.name
  resource_group_name = local.group
  ttl                 = local.ttl2
  records              = ["ns1-37.azure-dns.com", "ns2-37.azure-dns.net", "ns3-37.azure-dns.org", "ns4-37.azure-dns.info"]

  tags = {
    environment = local.environment
  }
} */
