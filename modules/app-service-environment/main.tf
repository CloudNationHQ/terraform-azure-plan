# environment
resource "azurerm_app_service_environment_v3" "env" {
  resource_group_name = coalesce(
    lookup(
      var.environment, "resource_group_name", null
    ), var.resource_group_name
  )

  name                                   = var.environment.name
  internal_load_balancing_mode           = var.environment.internal_load_balancing_mode
  zone_redundant                         = var.environment.zone_redundant
  subnet_id                              = var.environment.subnet_id
  allow_new_private_endpoint_connections = var.environment.allow_new_private_endpoint_connections
  remote_debugging_enabled               = var.environment.remote_debugging_enabled
  dedicated_host_count                   = var.environment.dedicated_host_count

  dynamic "cluster_setting" {
    for_each = try(
      var.environment.cluster_settings, {}
    )

    content {
      name  = cluster_setting.value.name
      value = cluster_setting.value.value
    }
  }

  tags = coalesce(
    var.environment.tags, var.tags
  )
}
