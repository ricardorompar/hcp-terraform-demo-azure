module "tfplan-functions" {
  source = "./common-functions/tfplan-functions/tfplan-functions.sentinel"
}

module "tfstate-functions" {
  source = "./common-functions/tfstate-functions/tfstate-functions.sentinel"
}

module "tfconfig-functions" {
  source = "./common-functions/tfconfig-functions/tfconfig-functions.sentinel"
}

policy "restrict-instance-type" {
    enforcement_level = "soft-mandatory"
}

policy "limit-cost-by-workspace-type" {
    enforcement_level = "hard-mandatory"
}