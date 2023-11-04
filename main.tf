terraform {
  required_version = "~> 1.6.0"
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.9.14"
    }
  }
}

#==========================================
# Proxmox VM
#==========================================
resource "proxmox_vm_qemu" "cloud_init" {
  name            = var.hostname
  clone           = var.cloud_image
  target_node     = var.target_node
  vmid            = var.vmid
  agent           = 0
  bios            = "ovmf"
  boot            = "order=scsi0;net0;ide2"
  full_clone      = var.full_clone
  qemu_os         = "l26"
  cores           = var.cores
  memory          = var.memory
  cpu             = "x86-64-v2-AES"
  scsihw          = "virtio-scsi-single"
  ssh_user        = var.ciuser
  ssh_private_key = file(var.ssh_privkey_file)
  oncreate        = true
  disk {
    type        = "scsi"
    storage     = var.storage
    size        = var.disk_size
    format      = "raw"
    cache       = "none"
    backup      = true
    iothread    = 1
    replicate   = 0
    ssd         = 1
    discard     = "on"
    mbps        = 0
    mbps_rd     = 0
    mbps_rd_max = 0
    mbps_wr     = 0
    mbps_wr_max = 0
  }
  vga {
    type   = "qxl"
    memory = 32
  }
  network {
    model  = "virtio"
    bridge = var.bridge
    tag    = var.vlan
  }
  os_type = "cloud-init"
  #
  # cloud-init specific vars
  #
  ci_wait      = 30
  ciuser       = var.ciuser
  cipassword   = var.cipassword
  sshkeys      = file(var.ssh_pubkey_file)
  ipconfig0    = var.ipconfig0
  searchdomain = var.searchdomain
  nameserver   = var.nameserver

  provisioner "remote-exec" {
    inline = [
      "cloud-init status --wait"
    ]
    connection {
      host  = var.ip
      type  = "ssh"
      user  = var.ciuser
      agent = true
    }
  }
}
