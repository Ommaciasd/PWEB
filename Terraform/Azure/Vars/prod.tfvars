# Nanaykuna
# Databases.
db  = "db"
sql = "sql"

network   = "10.10.0.0/16" # Networking

# Resources.
environment = "prod"
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
subscription = "443c2864-91d7-499d-877b-04179227ab3b" # Cuenta Azure PROD.
tenant       = "e4d8f2a9-2e24-4297-94cc-d8e3d3607ed1" # Suscripcion Nanaykuna PROD.
