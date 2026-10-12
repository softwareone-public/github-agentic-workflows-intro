variable "name" {
  description = "Name of the platform landing zone."
  type        = string
}

variable "location" {
  description = "Azure region label used by the platform contract."
  type        = string
}

variable "subnet_definitions" {
  description = "Legacy list-based subnet contract in module 1.x."
  type = list(object({
    name           = string
    address_prefix = string
  }))
}
