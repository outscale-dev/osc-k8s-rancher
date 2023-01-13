output "control-plane-sg" {
  value = outscale_security_group.control-plane-az-1.id
}

output "worker-sg" {
  value = outscale_security_group.worker-az-1.id
}

output "node-sg" {
  value = outscale_security_group.node.id
}

output "rancher_server_url" {
  value = module.rancher_common.rancher_url
}

output "rancher_node_ip" {
  value = outscale_vm.bastion-az-1.public_ip
}

output "node_subnet" {
  value = outscale_subnet.private-az-1.id
}