locals {
  account_name = [
    "sbx1+jkrusic19",
    "sbx2+jkrusic19"
  ]


}
module "sandbox" {
  for_each = toset(local.account_name)
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "${each.key}@gmail.com"
    AccountName               = split("+", each.key)[0]
    ManagedOrganizationalUnit = "Sandbox"
    SSOUserEmail              = "jkrusic19@gmail.com"
    SSOUserFirstName          = "Sandbox"
    SSOUserLastName           = "AFT"
  }

  account_tags = {
    "Learn Tutorial" = "AFT"
  }

  change_management_parameters = {
    change_requested_by = "HashiCorp Learn"
    change_reason       = "Learn AWS Control Tower Account Factory for Terraform"
  }

  custom_fields = {
    group = "non-prod"
  }

  account_customizations_name = "sandbox"
}