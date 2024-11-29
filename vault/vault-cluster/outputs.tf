output "vault_addr" {
  value = hcp_vault_cluster.hcp_vault.vault_public_endpoint_url
}
#only for vault config. This is the admin token!
output "vault_token" {
  value = nonsensitive(hcp_vault_cluster_admin_token.token.token)
}
