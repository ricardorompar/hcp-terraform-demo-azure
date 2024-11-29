variable "vault_tier" {
  description = "Tier of the HCP Vault cluster. Valid options for tiers."
  type        = string
  default     = "dev"
}

variable "hvn_id" {
  description = "The ID of the HCP HVN."
  type        = string
  default     = "hcp-hvn"
}

variable "location" {
  description = "The region of the HCP HVN and Vault cluster."
  type        = string
  default     = "centralus"
}

variable "cloud_provider" {
  description = "The cloud provider of the HCP HVN and Vault cluster."
  type        = string
  default     = "azure"
}

variable "prefix" {
  description = "This prefix will be included in the name of most resources."
}