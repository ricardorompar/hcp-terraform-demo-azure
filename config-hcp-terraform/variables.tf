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

variable "org-name" {
  description = "Name for the (preexisting) organization to create modules in."
  type = string
}

variable "email" {
  description = "Email of the account owner."
  type = string
}


# For authentication to Github:
variable "github-token" {
  description = "Token for GitHub. The following permissions must be allowed: org:read"
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