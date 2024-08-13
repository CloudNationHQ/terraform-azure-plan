# Azure Service Plans Terraform Module

This Terraform module streamlines the creation and management of Azure Service Plans. It provides a flexible and customizable solution for deploying fully-configured instances, incorporating best practices and offering a variety of options to suit different needs.

## Goals

- **Structured Data Management**: Create a logical data structure by combining and grouping related resources together in a complex object.
- **Reusability**: Promote reusability by making the module a repeatable component, simplifying the process of building diverse workloads and platform accelerators consistently.
- **API Alignment**: Utilize keys and values in the object that correspond to the REST API's structure, enabling iterations and increasing practical value over time.
- **Separation of Logic and Configuration**: Separate logic from configuration in the module to enhance scalability, ease of customization, and manageability.

## Non-Goals

These modules are not intended to be complete, ready-to-use solutions; they are designed as components for creating your own patterns.

They are not tailored for a single use case but are meant to be versatile and applicable to a range of scenarios.

Security standardization is applied at the pattern level, while the modules include default values based on best practices but do not enforce specific security standards.

End-to-end testing is not conducted on these modules, as they are individual components and do not undergo the extensive testing reserved for complete patterns or solutions.

## Features

- Manages multiple service plans.
- Supports various configurations for service plans.
- Utilization of Terratest for robust validation.
- Provides maintenance, high availability, and robust management options.
- Ability to generate a user-assigned identity or bring your own if specified.
- Flexible configuration of multiple service plan parameters.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.61 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.61 |

## Resources

| Name                       | Type                              |
|----------------------------|-----------------------------------|
| azurerm_service_plan       | resource                          |

## Inputs

| Name           | Description                                 | Type   | Required |
|----------------|---------------------------------------------|--------|----------|
| plans          | Describes service plan related configuration| object | yes      |
| tags           | Tags to be added to the resources           | map(string) | no      |

## Outputs

| Name               | Description                       |
|--------------------|-----------------------------------|
| service_plan_names | Service plan names                |
| service_plan_ids   | Service plan IDs                  |

## Testing

As a prerequirement, please ensure that both go and terraform are properly installed on your system.

The [Makefile](Makefile) includes two distinct variations of tests. The first one is designed to deploy different usage scenarios of the module. These tests are executed by specifying the TF_PATH environment variable, which determines the different usages located in the example directory.

To execute this test, input the command ```make test TF_PATH=default```, substituting default with the specific usage you wish to test.

The second variation is known as a extended test. This one performs additional checks and can be executed without specifying any parameters, using the command ```make test_extended```.

Both are designed to be executed locally and are also integrated into the github workflow.

Each of these tests contributes to the robustness and resilience of the module. They ensure the module performs consistently and accurately under different scenarios and configurations.

## Notes

Using a dedicated module, we've developed a naming convention for resources that's based on specific regular expressions for each type, ensuring correct abbreviations and offering flexibility with multiple prefixes and suffixes

Full examples detailing all usages, along with integrations with dependency modules, are located in the examples directory

## Authors

Module is maintained by [these awesome contributors](https://github.com/cloudnationhq/terraform-azure-plan/graphs/contributors).

## Contributing

We welcome contributions from the community! Whether it's reporting a bug, suggesting a new feature, or submitting a pull request, your input is highly valued. For more information, please see our contribution [guidelines](https://github.com/CloudNationHQ/terraform-azure-mysql/blob/main/CONTRIBUTING.md).

## License

MIT Licensed. See [LICENSE](https://github.com/cloudnationhq/terraform-azure-mysql/blob/main/LICENSE) for full details.

## Reference

- [Documentation](https://learn.microsoft.com/en-us/azure/app-service/overview-hosting-plans)
- [Rest Api](https://learn.microsoft.com/en-us/rest/api/appservice/app-service-plans?view=rest-appservice-2023-12-01)
