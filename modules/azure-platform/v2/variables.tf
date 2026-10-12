variable "name" {
  description = "Name of the platform landing zone."
  type        = string
}

variable "location" {
  description = "Azure region label used by the platform contract."
  type        = string
}

variable "subnets" {
  description = "Map-based subnet contract introduced in module 2.x."
  type = map(object({
    address_prefix = string
  }))
}
