terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.37.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "DOJO-HP" {
  name     = "DOJO-HP"
  location = "East Us"
}

resource "azurerm_network_security_group" "HoneyPot04-nsg" {
  name                = "HoneyPot04-nsg"
  location            = azurerm_resource_group.DOJO-HP.location
  resource_group_name = azurerm_resource_group.DOJO-HP.name

  security_rule {
    name                       = "DONOTDOTHIS"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_virtual_network" "DOJO-network" {
  name                = "DOJO-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.DOJO-HP.location
  resource_group_name = azurerm_resource_group.DOJO-HP.name
}

resource "azurerm_subnet" "DOJO-subnet" {
  name                 = "DOJO-subnet"
  resource_group_name  = azurerm_resource_group.DOJO-HP.name
  virtual_network_name = azurerm_virtual_network.DOJO-network.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_public_ip" "DOJO-ip" {
  name                = "DOJO-ip"
  resource_group_name = azurerm_resource_group.DOJO-HP.name
  location            = azurerm_resource_group.DOJO-HP.location
  allocation_method   = "Dynamic"


}

resource "azurerm_network_interface" "DOJO-nic" {
  name                = "DOJO-nic"
  location            = azurerm_resource_group.DOJO-HP.location
  resource_group_name = azurerm_resource_group.DOJO-HP.name

  ip_configuration {
    name                          = "internal"
    public_ip_address_id          = azurerm_public_ip.DOJO-ip.id
    subnet_id                     = azurerm_subnet.DOJO-subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "HoneyPot04" {
  name                = "HoneyPot04"
  resource_group_name = azurerm_resource_group.DOJO-HP.name
  location            = azurerm_resource_group.DOJO-HP.location
  size                = "Standard_B1s"
  admin_username      = "silverfang88"
  admin_password      = "M0nkey3DLuffy!988"
  network_interface_ids = [
    azurerm_network_interface.DOJO-nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsDesktop"
    offer     = "windows-11"
    sku       = "win11-21h2-pro"
    version   = "latest"
  }
}

resource "azurerm_log_analytics_workspace" "DOJO-LAW" {
  name                = "DOJO-LAW"
  location            = azurerm_resource_group.DOJO-HP.location
  resource_group_name = azurerm_resource_group.DOJO-HP.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}