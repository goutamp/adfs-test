output "policy-output-name" {
  value = "${aws_iam_role_policy.support_policy.name_prefix}"
}

output "policy-output-role" {
  value = "${aws_iam_role_policy.support_policy.role}"
}


