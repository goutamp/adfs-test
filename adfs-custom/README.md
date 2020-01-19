# This is for the module of the ADFS custom role
   A Terraform module to create an custom ADFS role  

# usage 
  ```hcl

  
  We need to use the following syntax to call this module.
  module "aws-adfs" {
     source            = "path of the git repo where module code has been configured"
     app_name          = "${var.app_name}"  # pass the variable name as per the requirement.
     app_parent        = "${var.app_parent}"
     target_region     =  "${var.target_region}"
     aws_account_name  =  "${var.aws_account_name}"
}
  ```
 

# Variables

  - `app_name` = Need to put the app name 
  - `app_parent` = Need to put the app parent name 
  - `target_region` = need to put the target region where policy will be setup 
  - `aws_account_name` = need to put the aws account where policy will be setup.



# NB 
    We need to fixed the path value of the template file for the source value
    when this will be run in the Circle CI, That time we need to check the code
    base also.
