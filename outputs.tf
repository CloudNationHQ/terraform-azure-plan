output "plans" {
  description = "contains service plans configuration"
  value = {
    for k, plan in azurerm_service_plan.plans : k => plan
  }
}
