terraform {
  backend "azurerm" {
    resource_group_name  = "RG-TERRAFORM-001"
    storage_account_name = "stcrpsbx001dtf2"  #change 
    container_name       = "canadacentral"
    key                  = "VMHARSH002D.tfstate"
    subscription_id      = "1b996d81-8d39-47ee-bc3c-436b7f6214fe"
  }
}
