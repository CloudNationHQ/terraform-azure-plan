# Service Plans

This terraform module simplifies the deployment and management of azure service plans, offering flexible configuration options. It facilitates efficient scaling and optimizes resource allocation, streamlining the overall management process.

## Features

Manages multiple service plans.

Utilization of Terratest for robust validation.

Auto-scaling and zone balancing capabilities.

SKU validation and compatibility checks.

Several workload usage examples.

Enterprise-grade application isolation

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

- [azurerm_service_plan.plans](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/service_plan) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_plans"></a> [plans](#input\_plans)

Description: contains all service plans configuration

Type:

```hcl
map(object({
    name                            = string
    os_type                         = string
    sku_name                        = string
    resource_group_name             = optional(string, null)
    location                        = optional(string, null)
    app_service_environment_id      = optional(string, null)
    premium_plan_auto_scale_enabled = optional(bool, false)
    maximum_elastic_worker_count    = optional(number, null)
    worker_count                    = optional(number, null)
    per_site_scaling_enabled        = optional(bool, false)
    zone_balancing_enabled          = optional(bool, false)
    tags                            = optional(map(string))
  }))
```

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_location"></a> [location](#input\_location)

Description: default azure region to be used.

Type: `string`

Default: `null`

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

### <a name="output_plans"></a> [plans](#output\_plans)

Description: contains all service plans configuration
<!-- END_TF_DOCS -->

## Goals

For more information, please see our [goals and non-goals](./GOALS.md).

## Testing

For more information, please see our testing [guidelines](./TESTING.md)

## Notes

Using a dedicated module, we've developed a naming convention for resources that's based on specific regular expressions for each type, ensuring correct abbreviations and offering flexibility with multiple prefixes and suffixes.

Full examples detailing all usages, along with integrations with dependency modules, are located in the examples directory.

To update the module's documentation run `make doc`

## Contributors

We welcome contributions from the community! Whether it's reporting a bug, suggesting a new feature, or submitting a pull request, your input is highly valued.

For more information, please see our contribution [guidelines](./CONTRIBUTING.md). <br><br>

<a href="https://github.com/cloudnationhq/terraform-azure-plan/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=cloudnationhq/terraform-azure-plan" />
</a>

## License

MIT Licensed. See [LICENSE](https://github.com/cloudnationhq/terraform-azure-plan/blob/main/LICENSE) for full details.

## References

- [Documentation](https://learn.microsoft.com/en-us/azure/app-service/overview-hosting-plans)
- [Rest Api](https://learn.microsoft.com/en-us/rest/api/appservice/app-service-plans?view=rest-appservice-2023-12-01)
