# Create Event Hub Namespace
resource "azurerm_eventhub_namespace" "logging" {
  name                = var.logging_eventhub_namespace_name
  location            = var.logging_eventhub_location
  resource_group_name = var.logging_eventhub_resource_group_name
  sku                 = "Standard"
}
