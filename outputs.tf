output "vm" {
  value = {
    hostname = var.hostname
    domain   = var.searchdomain
    ip       = var.ip
    ciuser   = var.ciuser
  }
}
