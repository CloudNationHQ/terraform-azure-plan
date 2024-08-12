output "service_plan_names" {
  description = "Service plan names"
  value = { for k, v in azurerm_service_plan.plans : k => v.name }
}

output "service_plan_ids" {
  description = "Service plan ids"
  value = { for k, v in azurerm_service_plan.plans : k => v.id }
}
