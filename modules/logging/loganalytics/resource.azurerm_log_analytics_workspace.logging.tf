# Create Log Analytics Workspace
resource "azurerm_log_analytics_workspace" "logging" {
  name                = var.logging_loganalytics_workspace_name
  location            = var.logging_loganalytics_location
  resource_group_name = var.logging_loganalytics_resource_group_name
}
