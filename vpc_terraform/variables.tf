variable "vpc_parameters" {
  description = "VPC parameters"
  type = map(object({
    cidr_block           = string
    enable_dns_support   = optional(bool, true)
    enable_dns_hostnames = optional(bool, true)
    tags                 = optional(map(string), {})
  }))
  default = {}
}


variable "subnet_parameters" {
  description = "Subnet parameters"
  type = map(object({
    cidr_block = string
    vpc_name   = string
    tags       = optional(map(string), {})
  }))
  default = {}
}

variable "igw_parameters" {
  description = "IGW parameters"
  type = map(object({
    vpc_name = string
    tags     = optional(map(string), {})
  }))
  default = {}
}


variable "rt_parameters" {
  description = "RT parameters"
  type = map(object({
    vpc_name = string
    tags     = optional(map(string), {})
    routes = optional(list(object({
      cidr_block = string
      use_igw    = optional(bool, true)
      gateway_id = string
    })), [])
  }))
  default = {}
}
variable "rt_association_parameters" {
  description = "RT association parameters"
  type = map(object({
    subnet_name = string
    rt_name     = string
  }))
  default = {}
}
