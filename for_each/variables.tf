variable "instances" {
    type = map
    default = {
        db = "t3.small"
        backend = "t3.micro"
        frontend = "t3.micro"
    }
}

variable "domain_name" {
  default = "jagathlearn.art"
}

variable "zone_id" {
  default = "Z05044682OYMGNDUWBHY0"
}

# db (KEY) = "t3.small" (value)