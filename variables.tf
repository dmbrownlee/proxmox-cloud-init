#===========================================================
# These variables are used by the Terraform Proxmox provider
#===========================================================
variable "pm_api_url" {
  description = "URL of the Proxmox cluster API"
  type        = string
}

variable "pm_api_token_secret" {
  description = "Proxmox API token secret"
  type        = string
}

variable "pm_api_token_id" {
  description = "Proxmox API token ID"
  type        = string
}

#==========================================
# Mandatory vars
#==========================================
variable "hostname" {
  description = "Virtual machine hostname"
  type        = string
}

variable "cloud_image" {
  description = "Cloud-init enabled virtual machine template name"
  type        = string
}

variable "target_node" {
  description = "Proxmox node onto which you want to clone the VM"
  type        = string
}

variable "ip" {
  description = "The IP address of the virtual machine"
  type        = string
}

#==========================================
# Cloud-init specific vars
#==========================================
variable "ciuser" {
  description = "The cloud-init username"
  type        = string
}

variable "cipassword" {
  description = "The cloud-init user's password"
  type        = string
}

variable "ssh_pubkey_file" {
  description = "The filename of an SSH public key for the cloud-init user"
  type        = string
}

variable "ssh_privkey_file" {
  description = "The filename of an SSH private key for the cloud-init user"
  type        = string
}

variable "nameserver" {
  description = "The DNS nameserver the virtual machine should use"
  type        = string
}

variable "searchdomain" {
  description = "The DNS domain name for the virtual machine"
  type        = string
}

#==========================================
# Optional vars (vars with defaults)
#==========================================
variable "vmid" {
  description = "Proxmox ID number (0 = next available)"
  type        = number
  default     = 0
}

variable "cores" {
  description = "The number of CPU cores per socket"
  type        = number
  default     = 2
}

variable "memory" {
  description = "The amount of RAM in megabytes"
  type        = number
  default     = 2048
}

variable "vlan" {
  description = "VLAN ID"
  type        = number
  #default     = -1
}

variable "ipconfig0" {
  description = "The ipconfig0 argument for cloud-init"
  type        = string
  #default     = "[ip=dhcp]"
}

variable "full_clone" {
  description = "Creates a new harddrive copy that is independent"
  type        = bool
  default     = true
}

variable "storage" {
  description = "Which Proxmox storage pool to store the VM on"
  type        = string
  #default     = "local-lvm"
}
