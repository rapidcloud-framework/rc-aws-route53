variable "zone_id" {
    type = string
}
variable "record_name" {
    type = string
    default = "dev"
}
variable "record_type" {
    type = string
    default = "A"
}
variable "ttl" {
    type = number
    default = null
}
variable "record_list" {
    type = list
    default = null
}
variable "alias" {
    type = bool
    default = false
}
variable "alias_conf" {
    type = map(any)
    default = null
}