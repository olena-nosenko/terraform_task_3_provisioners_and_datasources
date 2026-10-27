data "azurerm_resource_group" "task3" {
  name = var.resource_group_name
}

data "azurerm_virtual_network" "task3" {
  name                = var.virtual_network_name
  resource_group_name = data.azurerm_resource_group.task3.name
}

data "azurerm_subnet" "task3" {
  name                 = var.subnet_name
  resource_group_name  = data.azurerm_resource_group.task3.name
  virtual_network_name = data.azurerm_virtual_network.task3.name
}

data "azurerm_network_interface" "task3" {
  name                = var.network_interface_name
  resource_group_name = data.azurerm_resource_group.task3.name
}

data "azurerm_virtual_machine" "task3" {
  name                = var.virtual_machine_name
  resource_group_name = data.azurerm_resource_group.task3.name
}