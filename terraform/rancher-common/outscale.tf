resource "rancher2_node_driver" "outscale" {
  active = true
  builtin = false
  name = "outscale"
  ui_url = "https://oos.eu-west-2.outscale.com/rancher-ui-driver-outscale/dev/component.js"
  url = "https://oos.eu-west-2.outscale.com/binary/docker-machine-driver-outscale/docker-machine-driver-outscale_0.1.1-SNAPSHOT-ca8ad9e_linux_amd64.zip"
  checksum = "c90cac407adb3232404498d565a9e46685cdda333e835dbd9d38cf430a53c6f9"
  whitelist_domains = ["oos.eu-west-2.outscale.com"]

  provider = rancher2.admin
}