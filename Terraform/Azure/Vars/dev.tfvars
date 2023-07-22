# Nanaykuna
# Databases.
db  = "db"
sql = "sql"

network   = "10.10.0.0/16" # Networking

# Resources.
environment = "dev"
apps        = "apps"
vm          = "pipeline"
aspnetcore  = "Development"
key         = "ticketmanager"
security    = "vm-bastionwin01-nsg"

# DNS
pdns = "nanaykuna.azurewebsites.net"

# Azure Provider.
destroy      = true
resources    = false
subscription = "d11da572-d15e-42c4-a61c-9bd28afc17ce" # Cuenta Azure Dev.
tenant       = "141d8fe2-bf63-4de7-8782-1e1b896f03c9" # Suscripcion Nanaykuna Dev
