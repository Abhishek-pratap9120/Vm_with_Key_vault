resource "azurerm_virtual_network" "vnet" {
    for_each = var.vnet
   name                = each.value.vnet_name
   address_space       = each.value.address_space    #["10.0.0.0/16"]
   location            = each.value.vnet_location
   resource_group_name = each.value.rg_name
}

