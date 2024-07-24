/*  resource "azurerm_marketplace_agreement" "this" {

  plan      = var.vm_sku
  offer     = var.vm_offer
  publisher = var.vm_publisher
}
 */
locals {

  vm_tags = merge(var.vm_tags, var.resource_tags)


  if_resourcegroup_exists = length(data.azurerm_resource_group.rg) > 0
  # Checking to create the storage account or not

}



resource "azurerm_resource_group" "rg" {
  # Checking if the account exists or not

  name = var.rg_name

  location = var.azure_location



  tags = var.resource_tags

  #depends_on = [    data.azurerm_resource_group.rg  ] #change
  #azurerm_resource_group.rg
}
resource "azurerm_network_interface" "vm" {
  count                         = length(var.static_ips)
  name                          = "${var.vm_name}-NIC${count.index+ 1}"
  location                      = data.azurerm_resource_group.rg.location
  resource_group_name           = data.azurerm_resource_group.rg.name
  accelerated_networking_enabled = var.accelerated_networking[count.index]
  lifecycle { ignore_changes = [tags] }

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = "Static"
    #private_ip_address            = var.vm_ip
    private_ip_address = var.static_ips[count.index]
  }
}


resource "azurerm_windows_virtual_machine" "vm" {
  # for_each = var.vm["VMTSTAPP001D"]
  name                = var.vm_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  #zone                = "1"
  #lifecycle { ignore_changes = [tags] }
  timezone                   = var.vm_timezone
  encryption_at_host_enabled = true
  tags                       = local.vm_tags

  availability_set_id = try(var.avaset_id, null)
  size                = var.vm_size
  admin_username      = var.win_user_id
  admin_password      = var.admin_pwd != "" ? random_password.this.result : var.admin_pwd
  license_type        = "Windows_Server"
  patch_mode          = var.vm_hotpatching_enabled == true ? "AutomaticByPlatform" : var.vm_patch_mode


  enable_automatic_updates = var.vm_enable_automatic_updates

  network_interface_ids =    azurerm_network_interface.vm[*].id

  os_disk {
    name                 = "${var.vm_name}-OS"
    caching              = "ReadWrite"
    storage_account_type = var.osdisk_storage_account_type
  }

  source_image_reference {
    publisher = var.vm_publisher #"MicrosoftWindowsServer"
    offer     = var.vm_offer     #"WindowsServer"
    sku       = var.vm_sku
    version   = var.vm_version #"latest"

  }



  dynamic "plan" {
    for_each = var.vm_publisher == "MicrosoftWindowsServer" ? [] : [1]
    content {
      name      = var.vm_sku
      product   = var.vm_offer
      publisher = var.vm_publisher
    }


    #name      = "${var.vm_publisher == "MicrosoftWindowsServer" ? "" : var.vm_sku}"
    #product   = "${var.vm_publisher == "MicrosoftWindowsServer" ? "" : var.vm_offer}"
    #publisher = "${var.vm_publisher == "MicrosoftWindowsServer" ? "" : var.vm_publisher}"

  }
identity {
  type = "SystemAssigned"
  /* #change
    type = "SystemAssigned, UserAssigned"
    identity_ids = [
      data.azurerm_user_assigned_identity.uami_cloudops.id
    ]*/ #change
  }
  depends_on = [    azurerm_network_interface.vm ]
}


