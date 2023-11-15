terraform {
 required_version = "~> 1.5"
 required_providers {
        vault = {
            source  = "hashicorp/vault"
            version =  "~> 3.19.0"
        }
        helm = {
            source  = "hashicorp/helm"
            version = "~> 2.10.1"
        }
        kubernetes = {
            source  = "hashicorp/kubernetes"
            version = "~> 2.22.0"
        }
    }
}

provider "vault" {
  address = var.vault_public_address
  namespace = var.vault_namespace
  token = var.vault_admin_token
} 

provider "kubernetes" {
  config_path           = "~/.kube/config"
  config_context        = "default"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
    config_context = "default"
  }
}
