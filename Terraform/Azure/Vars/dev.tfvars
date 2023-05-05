# Network
network = "10.30.0.0/16"
public  = "10.30.0.0/24"
private = "10.30.1.0/24"

# Nanaykuna Resources.
environment = "dev"
saccount    = "noprodnotification"
sdata       = "edevbackofficestacc"
internet    = "e-dev-gw-01"
lan         = "e-dev-snet-01"
vnet        = "e-dev-vnet"
plan        = "app-dev"
prod        = "app-prd"
security    = "vm-bastionwin01-dev-e-nsg"
key         = "ticketmanager-dev"

# DNS
dns  = "dev-nanaykuna.azurewebsites.net"
dns2 = "front-dev.progresolplus.pe"
dns3 = "dev-nanaykuna-backoffice.azurewebsites.net"
dns4 = "backoffice-dev.progresolplus.pe"
dns5 = "dev-nanaykuna-bff-integration-infra.azurewebsites.net"
dns6 = "dev-nanaykuna-ticket-manager.azurewebsites.net"

# Insights.
insights  = "dev-nanaykuna-app-insights"

# Nanaykuna Resources Groups.
apps       = "apps"
storage    = "storage"
vm         = "vms"
networking = "networking"
