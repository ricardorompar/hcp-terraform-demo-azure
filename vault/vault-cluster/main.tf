# https://portal.cloud.hashicorp.com/

# https://support.hashicorp.com/hc/en-us/articles/4416229422739-HCP-Vault-Upgrade-FAQ

# https://developer.hashicorp.com/vault/tutorials/cloud-ops/terraform-hcp-provider-vault
# https://developer.hashicorp.com/vault/tutorials/cloud-ops/amazon-peering-hcp

terraform {
  required_providers {
    hcp = {
      source = "hashicorp/hcp"
      version = "0.89.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.9.0"
    }
  }
}

resource "hcp_hvn" "hvn" {
  hvn_id         = var.hvn_id
  cloud_provider = var.cloud_provider
  region         = var.location
}

resource "hcp_vault_cluster" "hcp_vault" {
  hvn_id          = hcp_hvn.hvn.hvn_id
  cluster_id      = "${var.prefix}-vault-cluster"
  tier            = var.vault_tier
  public_endpoint = true
}

resource "hcp_vault_cluster_admin_token" "token" {
  cluster_id = hcp_vault_cluster.hcp_vault.cluster_id
  depends_on = [hcp_vault_cluster.hcp_vault]
}
