## AZ-1

resource "outscale_route" "node-az-1-default" {
  destination_ip_range = "0.0.0.0/0"
  nat_service_id       = outscale_nat_service.nat-az-1.nat_service_id
  route_table_id       = outscale_route_table.private-az-1.route_table_id
}

resource "outscale_security_group" "node" {
  description = "Kubernetes node (${var.cluster_name})"
  net_id      = outscale_net.net.net_id
  tags {
    key   = "OscK8sClusterID/${var.cluster_name}"
    value = "owned"
  }

  tags {
    key   = "OscK8sMainSG/${var.cluster_name}"
    value = "True"
  }
}