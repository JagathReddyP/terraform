resource "aws_route53_record" "expense" {
    count = length(var.instance_names)
  zone_id = var.zone_id
  #ex:backend.jagathlearn.art
  name    = "${var.instance_names[count.index]}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.expense[count.index].private_ip]
}

#zone_id -- the id of hosted zone --goto route 53 on aws console--click on hosted zone