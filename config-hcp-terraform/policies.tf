resource "tfe_policy_set" "demo" {
  name                = "adnoc-policy-set"
  description         = "A set of example policies for restricting VM size and costs."
  organization        = "r2-org"
  kind                = "sentinel"
  agent_enabled       = "false"

  vcs_repo {
    identifier         = "tf-demos/terraform-hashicat-policies"
    branch             = "main"
    ingress_submodules = false
    oauth_token_id     = tfe_oauth_client.oauth-client.oauth_token_id
  }
}

resource "tfe_project_policy_set" "demo" {
  policy_set_id = tfe_policy_set.demo.id
  project_id    = tfe_project.demo_project.id
}