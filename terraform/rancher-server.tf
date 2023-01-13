module "rancher_common" {
  source = "./rancher-common"

  node_public_ip             = data.outscale_public_ip.rancher_server.public_ip
  node_internal_ip           = outscale_vm.bastion-az-1.private_ip
  node_username              = "outscale"
  ssh_private_key_pem        = tls_private_key.bastion-az-1.private_key_pem
  rancher_server_dns = join(".", ["rancher", data.outscale_public_ip.rancher_server.public_ip, "sslip.io"])
  admin_password = var.rancher_server_admin_password
}

