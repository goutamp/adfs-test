provider "aws" {
  # Default
  #alias = "ireland"
  region = "eu-west-1"
}

terraform {
  backend "s3" {}
}

data "aws_caller_identity" "this" {}



