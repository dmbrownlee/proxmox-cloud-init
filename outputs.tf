output "vm" {
  value = {
    hostname = var.hostname
    domain   = var.searchdomain
    ip       = var.ip
    ciuser   = var.ciuser
  }
}

output "resources" {
  proxmox_vm_qemu = proxmox_vm_qemu.cloud_init
}
