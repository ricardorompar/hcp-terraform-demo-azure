#######################
#     Github auth     #
#######################
resource "tfe_oauth_client" "oauth-client" {
  organization     = var.org-name
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.github-token
  service_provider = "github"
}

#######################
#     Variable set    #
#######################
resource "tfe_variable_set" "azure_creds" {
  name          = "Azure credentials"
  description   = "Credentials needed to log in to Azure."
  organization  = var.org-name
  global        = true
}

# Variables:
resource "tfe_variable" "arm_client_id" {
  key             = "ARM_CLIENT_ID"
  value           = var.arm_client_id
  category        = "env"
  description     = "App ID of the service principal."
  variable_set_id = tfe_variable_set.azure_creds.id
  sensitive       = true
}

resource "tfe_variable" "arm_client_secret" {
  key             = "ARM_CLIENT_SECRET"
  value           = var.arm_client_secret
  category        = "env"
  description     = "Password of the service principal."
  variable_set_id = tfe_variable_set.azure_creds.id
  sensitive       = true
}

resource "tfe_variable" "arm_subscription_id" {
  key             = "ARM_SUBSCRIPTION_ID"
  value           = var.arm_subscription_id
  category        = "env"
  description     = "ID of your subscription."
  variable_set_id = tfe_variable_set.azure_creds.id
}

resource "tfe_variable" "arm_tenant_id" {
  key             = "ARM_TENANT_ID"
  value           = var.arm_tenant_id
  category        = "env"
  description     = "ID of your tenant."
  variable_set_id = tfe_variable_set.azure_creds.id
}

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
  version_pin       = "0.1.4"

  variable_options {
        name    = "placeholder"
        type    = "string"
        options = [ "loremflickr.com", "placebear.com", "placedog.net"]
    }
}