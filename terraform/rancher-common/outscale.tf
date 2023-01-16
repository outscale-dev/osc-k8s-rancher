resource "rancher2_node_driver" "outscale" {
  active = true
  builtin = false
  name = "outscale"
  ui_url = "https://oos.eu-west-2.outscale.com/rancher-ui-driver-outscale/v0.2.0/component.js"
  url = "https://github.com/outscale-dev/docker-machine-driver-outscale/releases/download/v0.2.0/docker-machine-driver-outscale_0.2.0_linux_amd64.zip"
  checksum = "bb539ed4e2b0f1a1083b29cbdbab59bde3efed0a3145fefc0b2f47026c48bfe0"
  whitelist_domains = ["oos.eu-west-2.outscale.com"]

  provider = rancher2.admin
}


data "rancher2_cluster_v2" "local" {
  depends_on = [
    helm_release.rancher_server
  ]
  name = "local"
  fleet_namespace = "fleet-local"
  provider = rancher2.admin
}

resource "rancher2_catalog_v2" "foo" {
  cluster_id = data.rancher2_cluster_v2.local.cluster_v1_id
  name = "osc-k8s-rke2"
  #git_repo = "https://github.com/outscale-dev/osc-k8s-rancher"
  #git_branch = "main"
  url = "https://oos.eu-west-2.outscale.com/chart/osc-rke2-template"

  provider = rancher2.admin
}