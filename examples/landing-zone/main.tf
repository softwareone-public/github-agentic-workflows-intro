module "platform" {
  source = "../../modules/azure-platform/v2"

  name     = "demo-landing-zone"
  location = "westeurope"

  subnets = {
    snet-app = {
      address_prefix = "10.20.1.0/24"
    }
    snet-data = {
      address_prefix = "10.20.2.0/24"
    }
  }
}

output "platform_id" {
  value = module.platform.platform_id
}
