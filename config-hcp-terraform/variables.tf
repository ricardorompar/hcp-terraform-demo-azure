# For authentication:
variable "hostname" {
  description = "Name of the host for TFE. In the case of HCP Terraform use the default."
  default = "app.terraform.io"
  type = string
}

variable "token" {
  description = "Authentication token to access the HCP Terraform API."
  type = string
}

# For creating org and workspace:
variable "org-name" {
  description = "Name for the organization to create modules in."
  type = string
  default = "unique-demo-org"
}

variable "email" {
  description = "Email of the account owner."
  type = string
}

variable "workspace-name" {
  description = "Name for the workspace to use the modules in."
  type = string
  default = "workspace-hashicat"
}

# For authentication to Github:
variable "github-token" {
  description = "Token for GitHub. The following permissions must be allowed: repo:*, workflow, write:packages, delete: packages, admin:repo_hook, admin:org_hook, notifications, delete_repo"
  type = string
}

# For authentication to Azure:
variable "arm_client_id" {
  description = "App ID of the service principal."
  type = string
}

variable "arm_client_secret" {
  description = "Password of the service principal."
  type = string
}

variable "arm_subscription_id" {
  description = "ID of your subscription."
  type = string
}

variable "arm_tenant_id" {
  description = "ID of your tenant."
  type = string
}