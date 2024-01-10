variable "zone_name" {
  type        = string
  default     = "test.rc.io"
  description = ""
}
variable "zone_comment" {
  type        = string
  default     = ""
  description = "Short comment that help you identify this zone."
}
variable "zone_force_destroy" {
  type        = bool
  default     = true
  description = "Whether to destroy all records (possibly managed outside of Terraform) in the zone when destroying the zone."
}
variable "tags" {
  type = map(any)
  default = {
    managed_by = "terraform"
  }
}
variable "add_delegation_set" {
  type = bool
  default = false
  description = "Set to true if you want to create a delegation set for this hosted zone."
}
variable "zone_delegation_set_id" {
  type = string
  default = ""
  description = "The ID of the reusable delegation set whose NS records you want to assign to the hosted zone. Used in public zones only."
}
variable "private_zone" {
  type = bool
  default = false
  description = "Create this as a private hosted zone."
}
variable "vpc_conf" {
  type = map(any)
  default = {
    vpc_id = ""
    vpc_region = "us-east-1"
  }
  description = "VPC configuration. Private zone only."
}