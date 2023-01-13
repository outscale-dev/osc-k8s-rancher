terraform {
  required_providers {
    outscale = {
      source  = "outscale-dev/outscale"
      version = "0.5.0"
    }
    shell = {
      source  = "scottwinkler/shell"
      version = "1.7.7"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.2.3"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "3.4.0"
    }
  }
  required_version = ">= 1.0.0"
}

provider "outscale" {
  access_key_id = var.access_key_id
  secret_key_id = var.secret_key_id
  region        = var.region
}
