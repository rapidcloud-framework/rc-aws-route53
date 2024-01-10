resource "aws_route53_record" "dev" {
  zone_id = var.zone_id
  name    = var.record_name
  type    = var.record_type
  ttl     = var.ttl
  records = var.record_list
  dynamic "alias" {
    for_each = ( var.alias_conf != null ? ["1"] : [] )
    content {
      name                   = var.alias_conf["name"]
      zone_id                = var.alias_conf["zone_id"]
      evaluate_target_health = var.alias_conf["evaluate_target_health"]
    }
  }
}