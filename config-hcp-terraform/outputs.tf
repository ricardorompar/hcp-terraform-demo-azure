output "organization-name" {
  value = tfe_organization.your-organization.name
}

output "hashicat-networking-source" {
  value = "app.terraform.io/${tfe_organization.your-organization.name}/${tfe_registry_module.hashicat-networking.name}/azurerm"
}

output "hashicat-compute-source" {
  value = "app.terraform.io/${tfe_organization.your-organization.name}/${tfe_registry_module.hashicat-compute.name}/azurerm"
}