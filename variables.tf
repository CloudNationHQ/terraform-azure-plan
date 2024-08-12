variable "naming" {
  description = "used for naming purposes"
  type        = map(string)
  default     = {}
}
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
  description = "service plans configuration"
  type        = any
}

variable "tags" {
  description = "tags to be added to the resources"
  type        = map(string)
  default     = {}
}