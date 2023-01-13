resource "local_file" "ssh_config" {
  filename        = "${path.root}/ssh_config"
  file_permission = "0660"
  content = format("%s\n\n%s",
    format("Host bastion\n     HostName %s\n     User outscale\n     IdentityFile bastion/bastion-az-1.pem\n     IdentitiesOnly yes\n     UserKnownHostsFile known_hosts\n     StrictHostKeyChecking no", outscale_public_ip.bastion.public_ip),
    format("Host bastion-az-1\n     HostName %s\n     ProxyJump bastion\n     User outscale\n     IdentityFile bastion/bastion-az-1.pem\n     IdentitiesOnly yes\n     UserKnownHostsFile known_hosts\n     StrictHostKeyChecking accept-new", "10.0.0.10"),
  )
}


resource "shell_script" "known_hosts" {
  lifecycle_commands {
    create = <<-EOF
        touch known_hosts
    EOF
    read   = <<-EOF
        echo "{}"
    EOF
    delete = <<-EOF
        rm -f known_hosts
    EOF
  }
  depends_on = [local_file.ssh_config]
}
