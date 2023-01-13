resource "outscale_route" "bastion-az-1-default" {
  destination_ip_range = "0.0.0.0/0"
  gateway_id           = outscale_internet_service.internet_service.internet_service_id
  route_table_id       = outscale_route_table.public-az-1.route_table_id
}

resource "outscale_public_ip_link" "bastion-az-1" {
  vm_id     = outscale_vm.bastion-az-1.vm_id
  public_ip = outscale_public_ip.bastion.public_ip
}

resource "tls_private_key" "bastion-az-1" {
  algorithm = "RSA"
  rsa_bits  = "4096"
}

resource "local_file" "bastion-az-1-pem" {
  filename        = "${path.module}/bastion/bastion-az-1.pem"
  content         = tls_private_key.bastion-az-1.private_key_pem
  file_permission = "0600"
}

resource "outscale_keypair" "bastion-az-1" {
  public_key = tls_private_key.bastion-az-1.public_key_openssh
}

resource "outscale_security_group" "bastion-az-1" {
  description = "Bastion-az-1 (${var.cluster_name})"
  net_id      = outscale_net.net.net_id
}

resource "outscale_security_group_rule" "bastion-az-1-ssh" {
  flow              = "Inbound"
  security_group_id = outscale_security_group.bastion-az-1.id
  rules {
    from_port_range = "-1"
    to_port_range   = "-1"
    ip_protocol     = "-1"
    ip_ranges       = ["0.0.0.0/0"]
  }
}

resource "outscale_vm" "bastion-az-1" {
  image_id           = var.image_id
  vm_type            = var.bastion_vm_type
  keypair_name       = outscale_keypair.bastion-az-1.keypair_name
  security_group_ids = [outscale_security_group.bastion-az-1.security_group_id]
  subnet_id          = outscale_subnet.public-az-1.subnet_id
  private_ips        = ["10.0.0.10"]

  user_data = filebase64(join("/", [path.module, "user_data/userdata_rancher_server"]))

  block_device_mappings {
    device_name = "/dev/sda1"
    bsu {
      delete_on_vm_deletion = true
      volume_size           = var.bastion_volume_size
      volume_type           = var.bastion_volume_type
      iops                  = var.bastion_volume_type == "io1" ? var.bastion_iops : 0
    }
  }

  tags {
    key   = "osc.fcu.eip.auto-attach"
    value = outscale_public_ip.bastion.public_ip
  }

  tags {
    key   = "name"
    value = "${var.cluster_name}-bastion-az-1"
  }
}

data "outscale_public_ip" "rancher_server" {
  filter {
    name   = "public_ips"
    values = [outscale_public_ip.bastion.public_ip]
  }
  public_ip  = outscale_public_ip.bastion.public_ip
  depends_on = [outscale_public_ip_link.bastion-az-1, outscale_security_group_rule.bastion-az-1-ssh]
}