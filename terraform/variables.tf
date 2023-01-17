variable "access_key_id" {
    type        = string
    description = "Outscale access key"
}
variable "secret_key_id" {
    type        = string
  description = "Outscale secret key"
}
variable "region" {
    type        = string
  description = "Outscale region"
  default     = "eu-west-2" 
}
variable "image_id" {
    type        = string
  description = "Outscale machine Image to use for all instances"
}
variable "bastion_vm_type" {
    type        = string
  description = "Instance type used for the VM (https://docs.outscale.com/en/userguide/Instance-Types.html)"
  default     = "tinav4.c2r4p1"
}
variable "bastion_volume_type" {
    type        = string
  description = "Type of volume to use (https://docs.outscale.com/en/userguide/About-Volumes.html#_volume_types_and_iops)"
  default     = "gp2"
}
variable "bastion_volume_size" {
    type        = string
  description = "Size of the volume"
  default     = "15"
}
variable "bastion_iops" {
    type        = string
  description = "Number of IOPS in case of io1 disk type (https://docs.outscale.com/en/userguide/About-Volumes.html#_volume_types_and_iops)"
  default     = "1500"
}
variable "cluster_name" {
    type        = string
  description = "Name of the first cluster"
  default     = "phandalin"
}

variable "subregion-1" {
    type        = string
  description = "Region to deploy these resources"
  default     = "eu-west-2a" 
}

variable "rancher_server_admin_password" {
    type        = string
  description = "Admin password to use for Rancher server bootstrap, min. 12 characters"
  }