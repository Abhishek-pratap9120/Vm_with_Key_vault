module "rg" {
  source = "../../child/azurerm_resource_group"
  rg = var.rg
}

module "virtual_network" {
  depends_on = [ module.rg ]
  source = "../../child/azurerm_virtual_network"
  vnet = var.vnet
}

module "subnet" {
  depends_on = [ module.virtual_network ]
  source = "../../child/azurerm_subnet"
  subnet = var.subnet
}

module "pip" {
  depends_on = [ module.rg ]
  source = "../../child/azurerm_public_ip"
  pip = var.public_ip
}

module "vm" {
  depends_on = [ module.subnet ,module.key_vault ]
  source = "../../child/azurerm_virtual_machine"
  vm = var.vm
}

module "key_vault" {
  depends_on = [ module.rg ]
  source = "../../child/azurerm_key_vault"
  key_vault = var.key
  
}

# module "bastion" {
#   depends_on = [  module.subnet , module.pip]
#   source = "../../child/azurerm_bastion_Host"
#   bastion = var.bastion
  
# }

