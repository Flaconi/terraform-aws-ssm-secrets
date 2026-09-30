# Moves all parameters (keyed by name) from the former Flaconi/terraform-aws-ssm-store module.
moved {
  from = module.ssm.aws_ssm_parameter.this
  to   = aws_ssm_parameter.this
}
