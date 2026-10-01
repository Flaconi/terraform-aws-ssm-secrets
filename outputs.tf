output "parameter_arns" {
  description = "Map of parameter name and arn"
  value       = { for name, parameter in aws_ssm_parameter.this : name => parameter.arn }
}
