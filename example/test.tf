terraform {
  required_version = "~> 1.6.0"
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.9.14"
    }
  }
}

# See the argument reference documentation for how to configure the Proxmox
# Provider for Terraform:
# https://github.com/Telmate/terraform-provider-proxmox/blob/master/docs/index.md
provider "proxmox" {
  pm_api_url          = var.pm_api_url
  pm_api_token_secret = var.pm_api_token_secret
  pm_api_token_id     = var.pm_api_token_id
  pm_tls_insecure     = true
  pm_log_enable       = true
  pm_log_file         = "terraform-plugin-proxmox.log"
  pm_debug            = true
  pm_log_levels = {
    _default    = "debug"
    _capturelog = ""
  }
}

module "test" {
  source              = "git@github.com:dmbrownlee/proxmox-cloud-init.git"
  pm_api_url          = var.pm_api_url
  pm_api_token_secret = var.pm_api_token_secret
  pm_api_token_id     = var.pm_api_token_id
  hostname            = var.hostname
  cloud_image         = var.cloud_image
  target_node         = var.target_node
  storage             = var.storage
  vlan                = var.vlan
  ciuser              = var.ciuser
  cipassword          = var.cipassword
  ssh_pubkey_file     = var.ssh_pubkey_file
  ssh_privkey_file    = var.ssh_privkey_file
  ip                  = var.ip
  ipconfig0           = var.ipconfig0
  searchdomain        = var.searchdomain
  nameserver          = var.nameserver
}

output "test" {
  value = module.test.vm
}

output "resources" {
  value     = module.test.resources
  sensitive = true
}
