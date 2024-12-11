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
#     Demo Project    #
#######################
resource "tfe_project" "demo_project" {
  organization  = var.org-name
  name          = "ADNOC Demos"
  description   = "Demo project for ADNOC"
}

resource "tfe_team_project_access" "admin" {
  access       = "maintain"
  team_id      = "team-KZA3dCWFFVtR8QXh" #my already existing team
  project_id   = tfe_project.demo_project.id
}