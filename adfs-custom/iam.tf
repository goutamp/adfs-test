
locals {
  app_env      = "argosfx"
  app_costcode = "IT-ARGOS"

  common_tags = {
    Family      = "${var.app_parent}"
    Application = "${var.app_name}"
    Environment = "${local.app_env}"
    CostCode    = "${local.app_costcode}"
  }
}




resource "aws_iam_role" "support_role" {
  name                 = "ADFS-${var.aws_account_name}-ApplicationAccess"
  assume_role_policy   = "${data.template_file.saml_policy.rendered}"
  max_session_duration = "3600"

  tags = "${merge(
    local.common_tags,
    map(
      "Name", "${local.app_env}-${var.app_parent}-${var.app_name}-application-role"
    )
  )}"
}

data "template_file" "saml_policy" {
  template = "${file(".terraform/assume-saml.json")}"

  vars = {
    account_id    = "${data.aws_caller_identity.this.account_id}"
    region        = "${var.target_region}"
    provider_name = "${var.provider_name}"
  }
}



# Policy for support access.
resource "aws_iam_role_policy" "support_policy" {
  name_prefix = "${local.app_env}-${var.app_parent}-${var.app_name}-support-policy-"
  role        = "${aws_iam_role.support_role.id}"
  policy      = "${data.template_file.support_policy.rendered}"
}

data "template_file" "support_policy" {
  template = "${file(".terraform/support-policy.json")}"

  vars = {
    account_id = "${data.aws_caller_identity.this.account_id}"
    region     = "${var.target_region}"
  }
}

