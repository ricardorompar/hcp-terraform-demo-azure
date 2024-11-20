#oauth token for Github:
resource "tfe_oauth_client" "oauth-client" {
  organization     = var.org-name
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.github-token
  service_provider = "github"
}

# demo Project
resource "tfe_project" "demo-project" {
  organization  = var.org-name
  name          = var.proj-name
}
# registry module
resource "tfe_registry_module" "hashicat-complete" {
  organization = var.org-name
  vcs_repo {
    display_identifier = "tf-demos/terraform-azurerm-hashicat-complete"
    identifier         = "tf-demos/terraform-azurerm-hashicat-complete"
    oauth_token_id     = tfe_oauth_client.oauth-client.oauth_token_id
  }
}

# no-code module
resource "tfe_no_code_module" "hashicat-complete" {
  organization = var.org-name
  registry_module = tfe_registry_module.hashicat-complete.id
}