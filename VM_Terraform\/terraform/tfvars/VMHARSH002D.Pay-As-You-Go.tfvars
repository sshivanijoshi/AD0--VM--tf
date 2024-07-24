#backend
subscription_id       = "1b996d81-8d39-47ee-bc3c-436b7f6214fe" # CORP-SANDBOX-001
azure_location = "West US 2"
#change this location if required

rg_name   = "RG-HARSH-CANADACENTRAL-003-D" #change we are going to create a new rg for VM which is not their in portal
vnet      = "VNET-BASTION-CANADACENTRAL-001-D"
vnet_rg   = "RG-BASTION-CANADACENTRAL-001-D"
snet_name = "SNET-DATA"


#avaset_name   = "AVASET-VOCAPP01"
# avaset_name = "AVASET-32Q-ASE"
#avaset_id     = "/subscriptions/d7437b34-58be-4314-b6ba-cc5b538bf0fd/resourceGroups/RG-VOCOLLECT-CANADA-CENTRAL-001/providers/Microsoft.Compute/availabilitySets/AVASET-VOCAPP01"

vm_name                = "VMHARSH007D" #CHANGE
vm_size                = "Standard_B2ms"
static_ips             = ["10.0.0.7"]  #CHANGE
vm_sku                 = "2022-datacenter-azure-edition"
vm_publisher           = "MicrosoftWindowsServer"
vm_offer               = "WindowsServer"
vm_version             = "latest"
accelerated_networking = [false]
disk_storage_account_types = {
  #1 = "StandardSSD_LRS",

}
vm_data_disks = {
  #1 = 128,


}
disk_cachings = {
  #1 = "ReadOnly",


}

cluster_data_disks = {

}
win_user_id = "svr_local" # admin ID saputo-admin

vm_tags = {

  "APPLICATION_MAINTENANCE_WINDOW" = "TBD"
  "AUTO-POWER_OFF_ON"              = "FALSE"
  "DR"                             = "FALSE"
  "BACKUP"                         = "FALSE"
  "END_DATE"                       = "NO EXPIRATION"

}

resource_tags = {

  "DIVISION"               = "CORP"
  "ENVIRONMENT"            = "DEVELOPMENT"
  "APPLICATION_NAME"       = "FOGLIGHT"
  "APPLICATION_MANAGED_BY" = "CaPS (EXPERT) - Cloud Ops"
  "TERRAFORM"              = "TRUE"
  "CREATED_BY"             = "CaPS (EXPERT) - Cloud Ops"
}
