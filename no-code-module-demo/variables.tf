variable "org-name" {
  description = "Name for the (preexisting) organization to create modules in."
  type = string
}

variable "proj-name" {
  description = "Name for the demo project to deploy the no-code module in."
  type = string
  default = "Demo Project"
}

variable "github-token" {
  description = "Token for GitHub. The following permissions must be allowed: repo:*, workflow, write:packages, delete: packages, admin:repo_hook, admin:org_hook, notifications, delete_repo"
  type = string
}

variable "token" {
  description = "Authentication token to access the HCP Terraform API."
  type = string
}

variable "email" {
  description = "Email of the account owner."
  type = string
}