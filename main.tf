moved {
  from = aws_ssm_parameter.this
  to   = module.ssm.aws_ssm_parameter.this
}

module "ssm" {
  source = "github.com/Flaconi/terraform-aws-ssm-store?ref=v1.2.0"

  tags        = var.tags
  kms_alias   = var.kms_alias
  name_prefix = var.name_prefix
  parameters  = var.parameters
}

module "secrets" {
  source = "github.com/terraform-aws-modules/terraform-aws-secrets-manager?ref=v1.1.2"

  create = length(var.parameters) > 0

  tags = var.tags

  kms_key_id = "alias/aws/secretsmanager"

  name        = trimsuffix(var.name_prefix, "/")
  description = "Secrets for the ${var.tags.Project} application"

  secret_string = jsonencode({ for parameter in var.parameters : parameter.name => parameter.value })
}
