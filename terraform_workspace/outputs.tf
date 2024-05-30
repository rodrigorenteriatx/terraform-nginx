resource "local_file" "inventory" {
  content = <<-EOF
  [servers]
  ${join("\n", slice(aws_instance.server.*.public_ip, 0, 2))}
  [load_balancer]
  ${element(aws_instance.server.*.public_ip, 2)}
  EOF
  filename = "../ansible_workspace/hosts.ini"
}

resource "local_file" "output" {
  content = jsonencode({
    domain_name = "rodrigonginx.com"
    zoneid     = data.aws_route53_zone.selected.zone_id
    ip = aws_instance.server.public_ip.server-1.public_ip
  })
  filename = "domain_values.json"
}