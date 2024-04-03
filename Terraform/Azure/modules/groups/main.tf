# Create Resources Groups.
resource "azurerm_resource_group" "apps" {
  count               = length(var.app)
  name                = "${local.name}-${var.app[count.index]}"
  location = var.location

  tags = {
    created_by  = var.created
    environment = var.environment
  }
}
