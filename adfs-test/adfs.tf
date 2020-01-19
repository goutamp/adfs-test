module "aws-adfs" {
#  source           =  "./${file("../infra-code-module/iam.tf")}"
  source            =  "/opt/adfs-test/adfs-custom/"
  app_name          =  "${var.app_name}"
  app_parent        =  "${var.app_parent}"
  target_region     =  "${var.target_region}"
  aws_account_name  =  "${var.aws_account_name}"
}
