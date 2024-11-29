terraform {
  required_providers {
    vault = {
      source = "hashicorp/vault"
      version = "4.5.0"
    }
  }
}

# Now config:
provider "vault" {
  address   = var.vault_addr
  namespace = "admin" # Set for HCP Vault
  token     = var.vault_token
}

resource "vault_mount" "kvv2" {
  path        = "secrets"
  type        = "kv"
  options     = { version = "2" }
  description = "KV Version 2 secret engine mount"
}

resource "vault_kv_secret_v2" "example" {
  mount                      = vault_mount.kvv2.path
  name                       = "example-secret"
  cas                        = 1
  delete_all_versions        = true
  data_json                  = jsonencode(
    {
        username       = "HashiCorp",
        password       = "Example secret. For example a DB password"
    }
  )
}

# example policy to only read
resource "vault_policy" "read_secret" {
  name = "demo-policy"

  policy = <<EOT
path "secrets/data/example-secret" {
  capabilities = ["read"]
}
EOT
}

#token with that policy:
resource "vault_token" "example" {
  policies = ["demo-policy"]
  renewable = true
  ttl = "24h"

  metadata = {
    "purpose" = "service-account"
  }
}