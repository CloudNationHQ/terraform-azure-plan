variable "plans" {
  description = "contains all service plans configuration"
  type = map(object({
    name                            = string
    os_type                         = string
    sku_name                        = string
    resource_group_name             = optional(string)
    location                        = optional(string)
    app_service_environment_id      = optional(string)
    premium_plan_auto_scale_enabled = optional(bool)
    maximum_elastic_worker_count    = optional(number)
    worker_count                    = optional(number)
    per_site_scaling_enabled        = optional(bool)
    zone_balancing_enabled          = optional(bool, false)
    tags                            = optional(map(string))
  }))
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
