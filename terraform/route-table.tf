### PRIVATE-AZ-1
resource "outscale_route_table" "private-az-1" {
  net_id = outscale_net.net.net_id
}

resource "outscale_route_table_link" "private-az-1" {
  subnet_id      = outscale_subnet.private-az-1.subnet_id
  route_table_id = outscale_route_table.private-az-1.route_table_id
}

### PUBLIC-AZ-1
resource "outscale_route_table" "public-az-1" {
  net_id = outscale_net.net.net_id

  tags {
    key   = "OscK8sClusterID/${var.cluster_name}"
    value = "owned"
  }
}

resource "outscale_route_table_link" "public-az-1" {
  subnet_id      = outscale_subnet.public-az-1.subnet_id
  route_table_id = outscale_route_table.public-az-1.route_table_id
}