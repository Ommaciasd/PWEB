locals {
  environment = var.environment
  apps        = var.apps
  vm          = var.vm
  networking  = var.networking
  storage     = var.storage
  network     = var.network
  public      = var.public
  private     = var.private
  internet    = var.internet
  lan         = var.lan
  vnet        = var.vnet
  plan        = var.plan
  sdata       = var.sdata
  security    = var.security
  key         = var.key
  prod        = var.prod
  dns         = var.dns
  dns2        = var.dns2
  dns3        = var.dns3
  dns4        = var.dns4
  dns5        = var.dns5
  dns6        = var.dns6
  insights    = var.insights
  saccount    = var.saccount
}

variable "webs" {
  type = map(any)
  default = {
    "web" = {
      web = "dev-storybook-nanaykuna"
    }
    "web2" = {
      web = "dev-nanaykuna"
    },
    "web3" = {
      web = "dev-nanaykuna-backoffice"
    },
    "web4" = {
      web = "dev-nanaykuna-bff-integration-infra"
    },
    "web5" = {
      web = "dev-nanaykuna-ticket-manager"
    }
  }
}

variable "functions" {
  type = map(any)
  default = {
    "function" = {
      function = "dev-nanaykuna-back-office-functions"
    }
    "function2" = {
      function = "dev-nanaykuna-customer-loyalty"
    },
    "function3" = {
      function = "dev-nanaykuna-marketing"
    }
    "function4" = {
      function = "dev-nanaykuna-notification"
    }
    "function5" = {
      function = "dev-nanaykuna-payments"
    }
    "function6" = {
      function = "dev-nanaykuna-products-functions"
    },
    "function7" = {
      function = "dev-nanaykuna-shipping-dates"
    }
    "function8" = {
      function = "dev-nanaykuna-shipping-experience"
    }
    "function-nine" = {
      function = "dev-nanaykuna-shipping-reports"
    }
  }
}

variable "environment" {
  type = string
}

variable "network" {
  type = string
}

variable "public" {
  type = string
}

variable "private" {
  type = string
}

variable "apps" {
  type = string
}

variable "storage" {
  type = string
}

variable "vm" {
  type = string
}

variable "networking" {
  type = string
}

variable "internet" {
  type = string
}

variable "lan" {
  type = string
}

variable "vnet" {
  type = string
}

variable "insights" {
  type = string
}

variable "plan" {
  type = string
}

variable "sdata" {
  type = string
}

variable "security" {
  type = string
}

variable "prod" {
  type = string
}

variable "dns" {
  type = string
}

variable "dns2" {
  type = string
}

variable "dns3" {
  type = string
}

variable "dns4" {
  type = string
}

variable "dns5" {
  type = string
}

variable "dns6" {
  type = string
}

variable "key" {
  type = string
}

variable "saccount" {
  type = string
}
