resource "aws_route53_zone" "zone" {
  name              = var.zone_name
  comment           = var.zone_comment
  force_destroy     = var.zone_force_destroy
  tags              = var.tags
  delegation_set_id = ( var.add_delegation_set ? local.zone_del_set_id : null )

  dynamic "vpc" {
    for_each = ( var.private_zone == true ? var.vpc_conf : {} )
    content {
      vpc_id     = var.vpc_conf["vpc_id"]
      vpc_region = var.vpc_conf["vpc_region"]
    }
  }
}
resource "aws_route53_delegation_set" "delegation_set" {
  count = ( var.add_delegation_set && (var.zone_delegation_set_id == "") ? 1 : 0 )
}

locals {
  zone_del_set_id = var.add_delegation_set && (var.zone_delegation_set_id == "") ? tostring(aws_route53_delegation_set.delegation_set[0].id) : var.zone_delegation_set_id
}