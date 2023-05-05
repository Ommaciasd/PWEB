# Network
network = "10.30.0.0/16"
public  = "10.30.0.0/24"
private = "10.30.1.0/24"

# Nanaykuna Resources.
environment = "sta"
saccount    = "noprodnotification"
sdata       = "estabackofficestacc"
internet    = "e-sta-gw-01"
lan         = "e-sta-snet-01"
vnet        = "e-sta-vnet"
plan        = "app-sta"
prod        = "app-prd"
security    = "vm-bastionwin01-sta-e-nsg"
key         = "ticketmanager-sta"

# DNS
dns  = "sta-nanaykuna.azurewebsites.net"
dns2 = "front-sta.progresolplus.pe"
dns3 = "sta-nanaykuna-backoffice.azurewebsites.net"
dns4 = "backoffice-sta.progresolplus.pe"
dns5 = "sta-nanaykuna-bff-integration-infra.azurewebsites.net"
dns6 = "sta-nanaykuna-ticket-manager.azurewebsites.net"

# Insights.
insights  = "sta-nanaykuna-app-insights"

# Nanaykuna Resources Groups.
apps       = "apps"
storage    = "storage"
vm         = "vms"
networking = "networking"
