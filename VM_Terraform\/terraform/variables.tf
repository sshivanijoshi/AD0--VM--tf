variable "rg_name" { type = string }

variable "vm_name" { type = string }
variable "vm_size" { type = string }
variable "vm_timezone" {
  type    = string
  default = "Eastern Standard Time"
}



variable "static_ips" {
  type    = list(string)
  default = []
}

variable "disk_sizes" {
  type    = list(number)
  default = []
}
variable "disk_storage_account_types" {
  type = map(any)
  default = {
    1 = "StandardSSD_LRS"
  }
}
variable "disk_cachings" {
  type = map(any)
  default = {
    1 = "ReadOnly"
  }
}
variable "vm_sku" {
  type    = string
  default = "2022-datacenter-azure-edition"
  #"2022-datacenter-azure-edition-core"
}
variable "vm_publisher" {
  type    = string
  default = "MicrosoftWindowsServer"
}
variable "vm_offer" {
  type    = string
  default = "WindowsServer"
}
variable "vm_version" {
  type    = string
  default = "latest"
}
variable "admin_pwd" {
  type    = string
  default = null
}


variable "vm_patch_mode" {
  type    = string
  default = "AutomaticByOS"
}

variable "vm_enable_automatic_updates" {
  type    = bool
  default = true
}
variable "vm_hotpatching_enabled" {
  type    = bool
  default = false
}
variable "vm_data_disks" {
  type    = map(any)
  default = null
}

variable "osdisk_storage_account_type" {

  type    = string
  default = "StandardSSD_LRS"


  validation {
    condition     = contains(["Standard_LRS", "StandardSSD_LRS", "Premium_LRS", "PremiumV2_LRS", "UltraSSD_LRS", "StandardSSD_ZRS", "Premium_ZRS"], var.osdisk_storage_account_type)
    error_message = "Valid values for var: vm_os_disks are (Standard_LRS, StandardSSD_ZRS, Premium_LRS, PremiumV2_LRS, Premium_ZRS, StandardSSD_LRS or UltraSSD_LRS)."
  }
  # StandardSSD_LRS,Premium_LRS, PremiumV2_LRS, UltraSSD_LRS, Standard_LRS, StandardSSD_ZRS,  Premium_ZRS
}


variable "win_user_id" { type = string }
#variable "linux_user_id"    { type = string }

variable "snet_name" { type = string }
variable "subscription_id" { type = string }
variable "subscription_id_it-mgmt-001" {
  type    = string
  default = "1b996d81-8d39-47ee-bc3c-436b7f6214fe" #change
}







variable "uami_name" {
  type    = string
  default = "ID-CLOUDOPS-AUTOMATION-CANADACENTRAL-001-P"
}

/*variable "rg_uami" {
  type    = string
  default = "RG-AZURE-MONITORING-CANADA-CENTRAL-001"

} */
variable "vnet" { type = string }
variable "vnet_rg" { type = string }
variable "azure_location" { type = string }

variable "accelerated_networking" {
  type    = list(string)
  default = [false]

}

variable "cluster_name" {
  type    = string
  default = null
}
variable "cluster_data_disks" {
  type    = map(any)
  default = null
}


variable "resource_type" {
  type    = string
  default = "Microsoft.Resources/resourceGroups"
}

variable "vm_tags" {
  type = map(any)
  default = {

    APPLICATION_MAINTENANCE_WINDOW = "TBD"
    AUTO-POWER_OFF_ON              = "FALSE"
    DR                             = "FALSE"
    BACKUP                         = "TRUE"
    END_DATE                       = "NO EXPIRATION"

  }

}
variable "resource_tags" {
  type = map(any)
  default = {

    DIVISION               = "CORP"
    ENVIRONMENT            = "DEVELOPMENT"
    APPLICATION_NAME       = ""
    APPLICATION_MANAGED_BY = "CaPS (EXPERT) - Cloud Ops"
    TERRAFORM              = "TRUE"
    CREATED_BY             = "CaPS (EXPERT) - Cloud Ops"
  }
}






variable "avaset_id" {
  type    = string
  default = null
}
#variable "avaset_name"      { type = string }
variable "vm" {

  default = {
    "VMTSTAPP001D" = {
      "1" = {
        "name"                          = "internal",
        "subnet_id"                     = "",
        "private_ip_address"            = "10.10.10.104",
        "enable_accelerated_networking" = true

      },
      "2" = {
        "name"                          = "nic2",
        "subnet_id"                     = "",
        "private_ip_address"            = "10.10.10.104",
        "enable_accelerated_networking" = true
      }
    }

  }
}
