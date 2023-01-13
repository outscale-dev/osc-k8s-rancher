resource "outscale_security_group" "control-plane-az-1" {
  description = "Kubernetes control-planes-az-1 (${var.cluster_name})"
  net_id      = outscale_net.net.net_id
}

resource "outscale_security_group_rule" "control-plane-az-1-ssh" {
  flow              = "Inbound"
  security_group_id = outscale_security_group.control-plane-az-1.id
  rules {
    from_port_range = "22"
    to_port_range   = "22"
    ip_protocol     = "tcp"
    ip_ranges       = ["10.0.0.0/24"]
  }

  # etcd
  rules {
    from_port_range = "2379"
    to_port_range   = "2380"
    ip_protocol     = "tcp"
    ip_ranges       = ["10.0.2.0/24"]
  }

  # service node port range
  rules {
    from_port_range = "30000"
    to_port_range   = "32767"
    ip_protocol     = "tcp"
    ip_ranges       = ["10.0.0.0/16"] # VPC
  }

  # kube-apiserver
  rules {
    from_port_range = "6443"
    to_port_range   = "6443"
    ip_protocol     = "tcp"
    ip_ranges       = ["10.0.0.0/16"] # VPC
  }
}