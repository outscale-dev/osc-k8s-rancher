resource "outscale_nat_service" "nat-az-1" {
  subnet_id    = outscale_subnet.public-az-1.subnet_id
  public_ip_id = outscale_public_ip.nat-az-1.id
}