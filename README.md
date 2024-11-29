# terraform-aws-ssm-secrets

Wrapper to store ssm parameters and also the same values as a secret in secrets manager.

<!-- Uncomment and replace with your module name
[![lint](https://github.com/flaconi/terraform-aws-ssm-secrets/workflows/lint/badge.svg)](https://github.com/flaconi/terraform-aws-ssm-secrets/actions?query=workflow%3Alint)
[![test](https://github.com/flaconi/terraform-aws-ssm-secrets/workflows/test/badge.svg)](https://github.com/flaconi/terraform-aws-ssm-secrets/actions?query=workflow%3Atest)
[![Tag](https://img.shields.io/github/tag/flaconi/terraform-aws-ssm-secrets.svg)](https://github.com/flaconi/terraform-aws-ssm-secrets/releases)
-->
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

For requirements regarding module structure: [style-guide-terraform.md](https://github.com/Flaconi/devops-docs/blob/master/doc/conventions/style-guide-terraform.md)

<!-- TFDOCS_HEADER_START -->


<!-- TFDOCS_HEADER_END -->

<!-- TFDOCS_PROVIDER_START -->
## Providers

No providers.

<!-- TFDOCS_PROVIDER_END -->

<!-- TFDOCS_REQUIREMENTS_START -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.29 |

<!-- TFDOCS_REQUIREMENTS_END -->

<!-- TFDOCS_INPUTS_START -->
## Required Inputs

No required inputs.

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_tags"></a> [tags](#input\_tags)

Description: Tags applied to the resources

Type: `map(string)`

Default: `{}`

### <a name="input_kms_alias"></a> [kms\_alias](#input\_kms\_alias)

Description: kms\_alias sets the kms alias used for SecureString

Type: `string`

Default: `"alias/aws/ssm"`

### <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix)

Description: name\_prefix prefixes the given name with a prefix

Type: `string`

Default: `""`

### <a name="input_parameters"></a> [parameters](#input\_parameters)

Description: A list of dicts with parameter information

Type:

```hcl
list(object({
    name  = string
    type  = optional(string, "SecureString") # String, StringList or SecureString
    value = string
  }))
```

Default: `[]`

<!-- TFDOCS_INPUTS_END -->

<!-- TFDOCS_OUTPUTS_START -->
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_parameter_arns"></a> [parameter\_arns](#output\_parameter\_arns) | Map of parameter name and arn |

<!-- TFDOCS_OUTPUTS_END -->

## License

**[MIT License](LICENSE)**

Copyright (c) 2024 **[Flaconi GmbH](https://github.com/flaconi)**
