# Default

This example illustrates the default setup, in its simplest form.

## Types

```hcl
plans = object({
  name           = string
  location       = string
  resource_group = string
  os_type        = string
  sku_name       = string
})
```