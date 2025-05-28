variable "environment" {
  description = "contains all app service environment configuration"
  type = object({
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
