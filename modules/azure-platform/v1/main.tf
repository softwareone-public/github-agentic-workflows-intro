locals {
  subnet_names = [for subnet in var.subnet_definitions : subnet.name]
}

resource "terraform_data" "platform" {
  input = {
    module_version = "1.0.0"
    name           = var.name
    location       = var.location
    subnet_names   = join(",", local.subnet_names)
  }
}
