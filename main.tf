resource "azurerm_service_plan" "plans" {
  for_each            = var.plans
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group

  os_type                      = each.value.os_type
  sku_name                     = each.value.sku_name
  app_service_environment_id   = try(each.value.app_service_environment_id, null)
  maximum_elastic_worker_count = try(each.value.maximum_elastic_worker_count, null)
  worker_count                 = try(each.value.worker_count, null)
  per_site_scaling_enabled     = try(each.value.per_site_scaling_enabled, false)
  zone_balancing_enabled       = try(each.value.zone_balancing_enabled, false)
  tags                         = try(var.tags, {})
  timeouts {
    create = try(each.value.timeouts.create, "60m")
    read   = try(each.value.timeouts.read, "5m")
    update = try(each.value.timeouts.update, "60m")
    delete = try(each.value.timeouts.delete, "60m")
  }
}