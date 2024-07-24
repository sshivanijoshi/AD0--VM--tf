data "azurerm_subnet" "subnet" {
  name                 = var.snet_name
  virtual_network_name = var.vnet
  resource_group_name  = var.vnet_rg
}

data "azurerm_resource_group" "rg" {


  name = var.rg_name




  depends_on = [    azurerm_resource_group.rg  ] #change
}
#this is checking if we have a resource group present or not


/*data "azurerm_resource_group" "rg_uami" {
  name     = var.rg_uami
  provider = azurerm.it-mgmt-001
}*?

/*data "azurerm_user_assigned_identity" "uami_cloudops" {
  name                = var.uami_name
  resource_group_name = data.azurerm_resource_group.rg_uami.name
  provider            = azurerm.it-mgmt-001
}*/
