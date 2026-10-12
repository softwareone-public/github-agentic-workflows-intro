resource "terraform_data" "platform" {
  input = {
    module_version = "2.0.0"
    name           = var.name
    location       = var.location
    subnet_names   = join(",", sort(keys(var.subnets)))
  }
}
