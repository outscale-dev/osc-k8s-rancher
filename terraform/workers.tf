resource "outscale_security_group" "worker-az-1" {
  description = "Kubernetes workers-az-1 (${var.cluster_name})"
  net_id      = outscale_net.net.net_id
}

resource "outscale_security_group_rule" "worker-az-1-rules" {
  flow              = "Inbound"
  security_group_id = outscale_security_group.worker-az-1.id
  rules {
    from_port_range = "22"
    to_port_range   = "22"
    ip_protocol     = "tcp"
    ip_ranges       = ["10.0.0.0/16"]
  }
  rules {
    ip_protocol = "-1"
    ip_ranges   = ["10.0.0.0/24", "10.0.2.0/24"] # public-az-1, private-az-1
  }
}