# Nanaykuna
# Databases.
db  = "db"
sql = "sql"

network   = "10.10.0.0/16" # Networking

# Resources.
environment = "sta"
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
tenant       = "e4d8f2a9-2e24-4297-94cc-d8e3d3607ed1" # Suscripcion Nanaykuna STA.
subscription = "d11da572-d15e-42c4-a61c-9bd28afc17ce" # Cuenta Azure STA.
