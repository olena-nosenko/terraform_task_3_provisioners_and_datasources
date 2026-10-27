variable "resource_group_name" {
  type    = string
  default = "mate-tf-nginx-task-3-rg"
}

variable "virtual_network_name" {
  type    = string
  default = "vnet"
}

variable "subnet_name" {
  type    = string
  default = "default"
}

variable "network_interface_name" {
  type    = string
  default = "mate-tf-nginx-task-3-vm"
}

variable "virtual_machine_name" {
  type    = string
  default = "mate-tf-nginx-task-3-vm"
}

variable "admin_username" {
  type    = string
  default = "azureuser"
}

variable "private_key_path" {
  type      = string
  default   = "C:/Users/Admin/.ssh/id_rsa"
  sensitive = true
}