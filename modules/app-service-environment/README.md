# App Service Environment

This submodule illustrates how to manage app service environments.

<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (~> 1.0)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (~> 4.0)

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) (~> 4.0)

## Resources

The following resources are used by this module:

- [azurerm_app_service_environment_v3.env](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service_environment_v3) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_environment"></a> [environment](#input\_environment)

Description: contains all app service environment configuration

Type:

```hcl
object({
    name                                   = string
    subnet_id                              = string
    resource_group_name                    = optional(string, null)
    internal_load_balancing_mode           = optional(string, "None")
    zone_redundant                         = optional(bool, false)
    allow_new_private_endpoint_connections = optional(bool, null)
    remote_debugging_enabled               = optional(bool, false)
    dedicated_host_count                   = optional(number, null)
    cluster_settings = optional(map(object({
      name  = string
      value = string
    })), {})
    tags = optional(map(string))
  })
```

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name)

Description: default resource group to be used.

Type: `string`

Default: `null`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: tags to be added to the resources

Type: `map(string)`

Default: `{}`

## Outputs

The following outputs are exported:

### <a name="output_environment"></a> [environment](#output\_environment)

Description: contains all app service environment configuration
<!-- END_TF_DOCS -->
