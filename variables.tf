variable "location" {
  description = "default azure region to be used."
  type        = string
  default     = null
}

variable "resource_group" {
  description = "default resource group to be used."
  type        = string
  default     = null
}

variable "plans" {
  description = "contains service plans configuration"
  type        = any
}

variable "tags" {
  description = "tags to be added to the resources"
  type        = map(string)
  default     = {}
}
