output "vault_app_token" {
  value = nonsensitive(vault_token.example.client_token)
}