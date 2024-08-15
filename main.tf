resource "azurerm_service_plan" "plans" {
  for_each = var.plans

  name                         = each.value.name
  location                     = coalesce(lookup(each.value, "location", null), var.location)
  resource_group_name          = coalesce(lookup(each.value, "resource_group", null), var.resource_group)
  os_type                      = each.value.os_type
  sku_name                     = each.value.sku_name
  app_service_environment_id   = try(each.value.app_service_environment_id, null)
  maximum_elastic_worker_count = try(each.value.maximum_elastic_worker_count, null)
  worker_count                 = try(each.value.worker_count, null)
  per_site_scaling_enabled     = try(each.value.per_site_scaling_enabled, false)
  zone_balancing_enabled       = try(each.value.zone_balancing_enabled, false)
  tags                         = try(each.value.tags, var.tags, null)
}
