# Create Security Management Group
resource "azurerm_management_group" "security" {
  display_name               = var.security_management_group_display_name
  name                       = var.security_management_group_name
  parent_management_group_id = var.security_parent_management_group_id

  subscription_ids = [
    var.security_subscription_id
  ]
}
