output "plans" {
  description = "contains all service plans configuration"
  value = {
    for k, plan in azurerm_service_plan.plans : k => plan
  }
}
