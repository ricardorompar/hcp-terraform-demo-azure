#######################
#       Modules       #
#######################
resource "tfe_registry_module" "hashicat-networking" {
  organization = var.org-name
  vcs_repo {
    display_identifier = "tf-demos/terraform-azurerm-hashicat-networking"
    identifier         = "tf-demos/terraform-azurerm-hashicat-networking"
    oauth_token_id     = tfe_oauth_client.oauth-client.oauth_token_id
  }
}

resource "tfe_registry_module" "hashicat-compute" {
  organization = var.org-name
  vcs_repo {
    display_identifier = "tf-demos/terraform-azurerm-hashicat-compute"
    identifier         = "tf-demos/terraform-azurerm-hashicat-compute"
    oauth_token_id     = tfe_oauth_client.oauth-client.oauth_token_id
  }
}

resource "tfe_registry_module" "hashicat-app-gateway" {
  organization = var.org-name
  vcs_repo {
    display_identifier = "tf-demos/terraform-azurerm-hashicat-app-gateway"
    identifier         = "tf-demos/terraform-azurerm-hashicat-app-gateway"
    oauth_token_id     = tfe_oauth_client.oauth-client.oauth_token_id
  }
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
  organization      = var.org-name
  registry_module   = tfe_registry_module.hashicat-complete.id
  version_pin       = "0.1.6"

  variable_options {
        name    = "placeholder"
        type    = "string"
        options = [ "loremflickr.com", "placebear.com", "placedog.net"]
    }
}