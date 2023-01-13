resource "outscale_subnet" "public-az-1" {
  net_id         = outscale_net.net.net_id
  ip_range       = "10.0.0.0/24"
  subregion_name = var.subregion-1

  tags {
    key   = "OscK8sClusterID/${var.cluster_name}"
    value = "owned"
  }
}

resource "outscale_subnet" "private-az-1" {
  net_id         = outscale_net.net.net_id
  ip_range       = "10.0.2.0/24"
  subregion_name = var.subregion-1

  tags {
    key   = "OscK8sClusterID/${var.cluster_name}"
    value = "owned"
  }
}