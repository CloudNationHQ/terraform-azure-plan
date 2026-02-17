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
