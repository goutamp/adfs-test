module "aws-adfs" {
  source           = "git::github.com/travelex/it-infra-modules.git//terraform_modules/iam-adfs?ref=feature/iam_custom_adfs"
  app_name         = "${var.app_name}"
  app_parent       = "${var.app_parent}"
  target_region    = "${var.target_region}"
  aws_account_name = "${var.aws_account_name}"
  provider_name    = "${var.provider_name}"
}
