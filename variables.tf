variable "plans" {
  description = "contains all service plans configuration"
  type = map(object({
    name                         = string
    os_type                      = string
    sku_name                     = string
    resource_group_name          = optional(string, null)
    location                     = optional(string, null)
    app_service_environment_id   = optional(string, null)
    maximum_elastic_worker_count = optional(number, null)
    worker_count                 = optional(number, null)
    per_site_scaling_enabled     = optional(bool, false)
    zone_balancing_enabled       = optional(bool, false)
    tags                         = optional(map(string))
  }))

  validation {
    condition = alltrue([
      for plan_key, plan in var.plans : contains(["Linux", "Windows"], plan.os_type)
    ])
    error_message = "All plans must have os_type set to either 'Linux' or 'Windows'."
  }

  validation {
    condition = alltrue([
      for plan_key, plan in var.plans : contains([
        # Free and Shared tiers
        "F1", "D1",
        # Basic tiers
        "B1", "B2", "B3",
        # Standard tiers
        "S1", "S2", "S3",
        # Premium v2 tiers
        "P1v2", "P2v2", "P3v2",
        # Premium v3 tiers
        "P1v3", "P2v3", "P3v3", "P1mv3", "P2mv3", "P3mv3", "P4mv3", "P5mv3",
        # Isolated tiers
        "I1", "I2", "I3", "I1v2", "I2v2", "I3v2", "I4v2", "I5v2", "I6v2",
        # Consumption (Functions)
        "Y1",
        # Elastic Premium (Functions)
        "EP1", "EP2", "EP3"
      ], plan.sku_name)
    ])
    error_message = "All plans must use a valid Azure App Service Plan SKU. Valid options include: F1, D1, B1-B3, S1-S3, P1v2-P3v2, P1v3-P5mv3, I1-I3, I1v2-I6v2, Y1, EP1-EP3."
  }

  validation {
    condition = alltrue([
      for plan_key, plan in var.plans :
      plan.maximum_elastic_worker_count == null || contains(["EP1", "EP2", "EP3"], plan.sku_name)
    ])
    error_message = "maximum_elastic_worker_count can only be specified for Elastic Premium (EP1, EP2, EP3) SKUs."
  }

  validation {
    condition = alltrue([
      for plan_key, plan in var.plans :
      !plan.zone_balancing_enabled || contains([
        "P1v2", "P2v2", "P3v2", "P1v3", "P2v3", "P3v3", "P1mv3", "P2mv3", "P3mv3", "P4mv3", "P5mv3",
        "I1v2", "I2v2", "I3v2", "I4v2", "I5v2", "I6v2", "EP1", "EP2", "EP3"
      ], plan.sku_name)
    ])
    error_message = "zone_balancing_enabled can only be used with Premium v2, Premium v3, Isolated v2, or Elastic Premium SKUs."
  }

  validation {
    condition = alltrue([
      for plan_key, plan in var.plans :
      !plan.per_site_scaling_enabled || !contains(["F1", "D1", "B1", "B2", "B3"], plan.sku_name)
    ])
    error_message = "per_site_scaling_enabled cannot be used with Free, Shared, or Basic SKUs."
  }

  validation {
    condition = alltrue([
      for plan_key, plan in var.plans :
      plan.app_service_environment_id == null || contains([
        "I1", "I2", "I3", "I1v2", "I2v2", "I3v2", "I4v2", "I5v2", "I6v2"
      ], plan.sku_name)
    ])
    error_message = "app_service_environment_id can only be specified with Isolated SKUs (I1, I2, I3, I1v2-I6v2)."
  }
}

variable "location" {
  description = "default azure region to be used."
  type        = string
  default     = null
}

variable "resource_group_name" {
  description = "default resource group to be used."
  type        = string
  default     = null
}

variable "tags" {
  description = "tags to be added to the resources"
  type        = map(string)
  default     = {}
}
