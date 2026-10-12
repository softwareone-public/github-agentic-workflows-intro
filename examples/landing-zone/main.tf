module "platform" {
  # Workshop starting point: this consumer is intentionally one major version behind.
  source = "../../modules/azure-platform/v1"

  name     = "demo-landing-zone"
  location = "westeurope"

  subnet_definitions = [
    {
      name           = "snet-app"
      address_prefix = "10.20.1.0/24"
    },
    {
      name           = "snet-data"
      address_prefix = "10.20.2.0/24"
    }
  ]
}

output "platform_id" {
  value = module.platform.platform_id
}
