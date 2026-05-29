resource "azurerm_network_interface" "nic" {
    for_each = var.vm
  name                = each.value.nic_name
  location            = each.value.nic_location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.data_subnet[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
    for_each = var.vm
  name                = each.value.vm_name
  resource_group_name = each.value.rg_name
  location            = each.value.vm_location
  size                = "Standard_D2s_v3"
  admin_username      = data.azurerm_key_vault_secret.data_key_username[each.key].value
  admin_password      = data.azurerm_key_vault_secret.data_key_password[each.key].value
  disable_password_authentication = false 
  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id,
  ]


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

 source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"  
    version   = "latest"
  }
custom_data = base64encode(<<EOF
        #!/bin/bash
        apt update -y
        apt install -y nginx 
        apt istall -y git
        EOF
        )
}