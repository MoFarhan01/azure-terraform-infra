variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
  default     = "West Europe"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "farhan-cloud-rg"
}

variable "environment" {
  description = "Environment tag for all resources"
  type        = string
  default     = "dev"
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "Admin username for the virtual machine"
  type        = string
  default     = "azureadmin"
}

variable "admin_password" {
  description = "Admin password for the virtual machine"
  type        = string
  sensitive   = true
}
