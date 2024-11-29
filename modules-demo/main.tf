terraform {
  cloud {
    organization = "r2-org"
    workspaces {
      name = "hashicat-demo"
      project = "ADNOC demos"
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

module "hashicat-networking" {
  source        = "app.terraform.io/r2-org/hashicat-networking/azurerm"
  version       = "0.0.1"
  prefix        = var.prefix
  location      = var.location
}

module "hashicat-compute" {
  source                = "app.terraform.io/r2-org/hashicat-compute/azurerm"
  version               = "0.0.1"
  prefix                = var.prefix
  location              = var.location
  resource_group_name   = module.hashicat-networking.resource_group_name
  vm_subnet_id          = module.hashicat-networking.vm_subnet_id
  security_group_id     = module.hashicat-networking.security_group_id
  vault_addr            = var.vault_addr
  vault_app_token       = var.vault_app_token
}

module "hashicat-app-gateway" {
  source                = "app.terraform.io/r2-org/hashicat-app-gateway/azurerm"
  version               = "0.0.1"
  prefix                = var.prefix
  location              = var.location
  resource_group_name   = module.hashicat-networking.resource_group_name
  appgw_subnet_id       = module.hashicat-networking.appgw_subnet_id
  vm_ips                = module.hashicat-compute.vm_ips
}
