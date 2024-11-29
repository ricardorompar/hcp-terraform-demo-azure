provider "hcp" {
    project_id = var.hcp_project_id
}

module "vault" {
  source = "./vault-cluster"
  prefix = var.prefix
}

module "vault-config" {
  source        = "./vault-config"
  vault_addr    = module.vault.vault_addr
  vault_token   = module.vault.vault_token
}