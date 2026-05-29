variable "pip" {
    type = map(object({
      pip_name = string
      rg_name = string
      pip_location = string
      allocation_method =string
    }))
}