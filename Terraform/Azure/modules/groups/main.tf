# Create Resources Groups.
resource "azurerm_resource_group" "apps" {
  count               = length(var.app)
  name                = "${local.name}-${var.app[count.index]}"
  location = local.location

  tags = {
    created_by  = local.created
    environment = local.environment
  }
}
