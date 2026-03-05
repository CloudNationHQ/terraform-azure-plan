resource "azurerm_service_plan" "plans" {
  for_each = var.plans

  resource_group_name = coalesce(
    lookup(
      each.value, "resource_group_name", null
    ), var.resource_group_name
  )

  location = coalesce(
    lookup(each.value, "location", null
    ), var.location
  )

  name                            = each.value.name
  os_type                         = each.value.os_type
  sku_name                        = each.value.sku_name
  app_service_environment_id      = each.value.app_service_environment_id
  premium_plan_auto_scale_enabled = each.value.premium_plan_auto_scale_enabled
  maximum_elastic_worker_count    = each.value.maximum_elastic_worker_count
  worker_count                    = each.value.worker_count
  per_site_scaling_enabled        = each.value.per_site_scaling_enabled
  zone_balancing_enabled          = each.value.zone_balancing_enabled

  tags = coalesce(
    each.value.tags, var.tags
  )
}
