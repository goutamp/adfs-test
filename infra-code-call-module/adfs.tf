module "aws-adfs" {
#  source           =  "./${file("../infra-code-module/iam.tf")}"
  source            =  "/home/ec2-user/infracode/infra-code-module/"
  app_name          =  "${var.app_name}"
  app_parent        =  "${var.app_parent}"
  target_region     =  "${var.target_region}"
  aws_account_name  =  "${var.aws_account_name}"
}
