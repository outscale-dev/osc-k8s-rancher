<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_local"></a> [local](#requirement\_local) | 2.2.3 |
| <a name="requirement_outscale"></a> [outscale](#requirement\_outscale) | 0.5.0 |
| <a name="requirement_shell"></a> [shell](#requirement\_shell) | 1.7.7 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | 3.4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_local"></a> [local](#provider\_local) | 2.2.3 |
| <a name="provider_outscale"></a> [outscale](#provider\_outscale) | 0.5.0 |
| <a name="provider_shell"></a> [shell](#provider\_shell) | 1.7.7 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 3.4.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_rancher_common"></a> [rancher\_common](#module\_rancher\_common) | ./rancher-common | n/a |

## Resources

| Name | Type |
|------|------|
| [local_file.bastion-az-1-pem](https://registry.terraform.io/providers/hashicorp/local/2.2.3/docs/resources/file) | resource |
| [local_file.ssh_config](https://registry.terraform.io/providers/hashicorp/local/2.2.3/docs/resources/file) | resource |
| [outscale_internet_service.internet_service](https://registry.terraform.io/providers/outscale-dev/outscale/0.5.0/docs/resources/internet_service) | resource |
| [outscale_internet_service_link.internet_service_link](https://registry.terraform.io/providers/outscale-dev/outscale/0.5.0/docs/resources/internet_service_link) | resource |
| [outscale_keypair.bastion-az-1](https://registry.terraform.io/providers/outscale-dev/outscale/0.5.0/docs/resources/keypair) | resource |
| [outscale_nat_service.nat-az-1](https://registry.terraform.io/providers/outscale-dev/outscale/0.5.0/docs/resources/nat_service) | resource |
| [outscale_net.net](https://registry.terraform.io/providers/outscale-dev/outscale/0.5.0/docs/resources/net) | resource |
| [outscale_public_ip.bastion](https://registry.terraform.io/providers/outscale-dev/outscale/0.5.0/docs/resources/public_ip) | resource |
| [outscale_public_ip.nat-az-1](https://registry.terraform.io/providers/outscale-dev/outscale/0.5.0/docs/resources/public_ip) | resource |
| [outscale_public_ip_link.bastion-az-1](https://registry.terraform.io/providers/outscale-dev/outscale/0.5.0/docs/resources/public_ip_link) | resource |
| [outscale_route.bastion-az-1-default](https://registry.terraform.io/providers/outscale-dev/outscale/0.5.0/docs/resources/route) | resource |
| [outscale_route.node-az-1-default](https://registry.terraform.io/providers/outscale-dev/outscale/0.5.0/docs/resources/route) | resource |
| [outscale_route_table.private-az-1](https://registry.terraform.io/providers/outscale-dev/outscale/0.5.0/docs/resources/route_table) | resource |
| [outscale_route_table.public-az-1](https://registry.terraform.io/providers/outscale-dev/outscale/0.5.0/docs/resources/route_table) | resource |
| [outscale_route_table_link.private-az-1](https://registry.terraform.io/providers/outscale-dev/outscale/0.5.0/docs/resources/route_table_link) | resource |
| [outscale_route_table_link.public-az-1](https://registry.terraform.io/providers/outscale-dev/outscale/0.5.0/docs/resources/route_table_link) | resource |
| [outscale_security_group.bastion-az-1](https://registry.terraform.io/providers/outscale-dev/outscale/0.5.0/docs/resources/security_group) | resource |
| [outscale_security_group.control-plane-az-1](https://registry.terraform.io/providers/outscale-dev/outscale/0.5.0/docs/resources/security_group) | resource |
| [outscale_security_group.node](https://registry.terraform.io/providers/outscale-dev/outscale/0.5.0/docs/resources/security_group) | resource |
| [outscale_security_group.worker-az-1](https://registry.terraform.io/providers/outscale-dev/outscale/0.5.0/docs/resources/security_group) | resource |
| [outscale_security_group_rule.bastion-az-1-ssh](https://registry.terraform.io/providers/outscale-dev/outscale/0.5.0/docs/resources/security_group_rule) | resource |
| [outscale_security_group_rule.control-plane-az-1-ssh](https://registry.terraform.io/providers/outscale-dev/outscale/0.5.0/docs/resources/security_group_rule) | resource |
| [outscale_security_group_rule.worker-az-1-rules](https://registry.terraform.io/providers/outscale-dev/outscale/0.5.0/docs/resources/security_group_rule) | resource |
| [outscale_subnet.private-az-1](https://registry.terraform.io/providers/outscale-dev/outscale/0.5.0/docs/resources/subnet) | resource |
| [outscale_subnet.public-az-1](https://registry.terraform.io/providers/outscale-dev/outscale/0.5.0/docs/resources/subnet) | resource |
| [outscale_vm.bastion-az-1](https://registry.terraform.io/providers/outscale-dev/outscale/0.5.0/docs/resources/vm) | resource |
| [shell_script.known_hosts](https://registry.terraform.io/providers/scottwinkler/shell/1.7.7/docs/resources/script) | resource |
| [tls_private_key.bastion-az-1](https://registry.terraform.io/providers/hashicorp/tls/3.4.0/docs/resources/private_key) | resource |
| [outscale_public_ip.rancher_server](https://registry.terraform.io/providers/outscale-dev/outscale/0.5.0/docs/data-sources/public_ip) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_key_id"></a> [access\_key\_id](#input\_access\_key\_id) | Outscale access key | `string` | n/a | yes |
| <a name="input_image_id"></a> [image\_id](#input\_image\_id) | Outscale machine Image to use for all instances | `string` | n/a | yes |
| <a name="input_rancher_server_admin_password"></a> [rancher\_server\_admin\_password](#input\_rancher\_server\_admin\_password) | Admin password to use for Rancher server bootstrap, min. 12 characters | `string` | n/a | yes |
| <a name="input_secret_key_id"></a> [secret\_key\_id](#input\_secret\_key\_id) | Outscale secret key | `string` | n/a | yes |
| <a name="input_bastion_iops"></a> [bastion\_iops](#input\_bastion\_iops) | Number of IOPS in case of io1 disk type (https://docs.outscale.com/en/userguide/About-Volumes.html#_volume_types_and_iops) | `string` | `"1500"` | no |
| <a name="input_bastion_vm_type"></a> [bastion\_vm\_type](#input\_bastion\_vm\_type) | Instance type used for the VM (https://docs.outscale.com/en/userguide/Instance-Types.html) | `string` | `"tinav4.c2r4p1"` | no |
| <a name="input_bastion_volume_size"></a> [bastion\_volume\_size](#input\_bastion\_volume\_size) | Size of the volume | `string` | `"15"` | no |
| <a name="input_bastion_volume_type"></a> [bastion\_volume\_type](#input\_bastion\_volume\_type) | Type of volume to use (https://docs.outscale.com/en/userguide/About-Volumes.html#_volume_types_and_iops) | `string` | `"gp2"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the first cluster | `string` | `"phandalin"` | no |
| <a name="input_region"></a> [region](#input\_region) | Outscale region | `string` | `"eu-west-2"` | no |
| <a name="input_subregion-1"></a> [subregion-1](#input\_subregion-1) | Region to deploy these resources | `string` | `"eu-west-2a"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_control-plane-sg"></a> [control-plane-sg](#output\_control-plane-sg) | n/a |
| <a name="output_node-sg"></a> [node-sg](#output\_node-sg) | n/a |
| <a name="output_node_subnet"></a> [node\_subnet](#output\_node\_subnet) | n/a |
| <a name="output_rancher_node_ip"></a> [rancher\_node\_ip](#output\_rancher\_node\_ip) | n/a |
| <a name="output_rancher_server_url"></a> [rancher\_server\_url](#output\_rancher\_server\_url) | n/a |
| <a name="output_worker-sg"></a> [worker-sg](#output\_worker-sg) | n/a |
<!-- END_TF_DOCS -->