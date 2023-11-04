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

variable "hostname" {
  description = "Name of the virtual machines"
  type        = string
}

variable "cloud_image" {
  description = "Name of the virtual machine template to clone"
  type        = string
}

variable "target_node" {
  description = "The Proxmox node on which to create the VM"
  type        = string
}

variable "storage" {
  description = "The Proxmox storage pool on which to store the VM"
  type        = string
}

variable "bridge" {
  description = "Bridge to which to patch the VM"
  type        = string
  default     = "vmbr0"
}

variable "vlan" {
  description = "The VLAN tag for the VM's primary interface"
  type        = number
}

variable "ciuser" {
  description = "The cloud-init username for provisioning"
  type        = string
}

variable "cipassword" {
  description = "The password for the cloud-init user"
  type        = string
}

variable "ssh_pubkey_file" {
  description = "The public SSH key to authorize for the cloud-init user"
  type        = string
}

variable "ssh_privkey_file" {
  description = "The cloud-init user's private SSH key (for provisioners)"
  type        = string
}

variable "ip" {
  description = "The virtual machine's IP address"
  type        = string
}

variable "ipconfig0" {
  description = "The cloud-init network configuration string"
  type        = string
}

variable "searchdomain" {
  description = "The cloud-init DNS search domain"
  type        = string
}

variable "nameserver" {
  description = "The cloud-init DNS nameserver"
  type        = string
}

variable "disk_size" {
  description = "Size of the primary disk"
  type        = string
  default     = "2G"
}
