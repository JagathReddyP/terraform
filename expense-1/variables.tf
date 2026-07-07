variable "instance_names" {
  type        = list(string)
  default     = ["mysql", "backend", "frontend"]
  description = "description"

}

variable "domain_name" {
  default = "jagathlearn.art"
}

variable "zone_id" {
  default = "Z05044682OYMGNDUWBHY0"
}