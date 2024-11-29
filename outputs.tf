output "parameter_arns" {
  description = "Map of parameter name and arn"
  value       = module.ssm.parameter_arns
}
