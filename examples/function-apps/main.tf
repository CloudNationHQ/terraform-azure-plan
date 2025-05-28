module "naming" {
  source  = "cloudnationhq/naming/azure"
  version = "~> 0.24"

  suffix = ["demo", "dev"]
}

module "rg" {
  source  = "cloudnationhq/rg/azure"
  version = "~> 2.0"

  groups = {
    demo = {
      name     = module.naming.resource_group.name_unique
      location = "westeurope"
    }
  }
}

module "service_plan" {
  source  = "cloudnationhq/plan/azure"
  version = "~> 3.0"

  resource_group_name = module.rg.groups.demo.name
  location            = module.rg.groups.demo.location

  plans = {
    consumption = {
      name     = module.naming.app_service_plan.name_unique
      os_type  = "Linux"
      sku_name = "Y1"
    }
    premium = {
      name     = module.naming.app_service_plan.name_unique
      os_type  = "Linux"
      sku_name = "EP2"

      maximum_elastic_worker_count = 20
    }
  }
}
