data "aws_kms_key" "this" {
  count  = anytrue([for parameter in var.parameters : parameter.type == "SecureString"]) ? 1 : 0
  key_id = var.kms_alias
}

resource "aws_ssm_parameter" "this" {
  for_each = { for parameter in var.parameters : parameter.name => parameter }

  name   = "${var.name_prefix}${each.value.name}"
  type   = each.value.type
  value  = each.value.value
  key_id = each.value.type == "SecureString" ? one(data.aws_kms_key.this[*].arn) : null
  tags   = var.tags

  overwrite = true
}

module "secrets" {
  source = "github.com/terraform-aws-modules/terraform-aws-secrets-manager?ref=v2.2.0"

  create = length(var.parameters) > 0

  tags = var.tags

  kms_key_id = "alias/aws/secretsmanager"

  name        = trimsuffix(var.name_prefix, "/")
  description = "Secrets for the ${var.tags.Project} application"

  secret_string = jsonencode({ for parameter in var.parameters : parameter.name => parameter.value })
}
