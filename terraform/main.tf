resource "azurerm_resource_group" "rg" {
  name     = "RG-Terraform-Lab"
  location = "West Europe"
}
resource "azurerm_virtual_network" "vnet" {
  name                = "Terraform-VNet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}
resource "azurerm_subnet" "management" {
  name                 = "management-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "server" {
  name                 = "server-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}
resource "azurerm_network_security_group" "server_nsg" {

  name                = "server-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

}
