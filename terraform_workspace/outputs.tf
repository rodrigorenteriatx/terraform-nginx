resource "local_file" "inventory" {
  # content = <<-EOF
  # [servers]
  # ${join("\n", slice(aws_instance.server.*.public_ip, 0, 2))}
  # [load_balancer]
  # ${element(aws_instance.server.*.public_ip, 2)}
  # EOF

  content = <<-EOF
  [servers]
  ${aws_instance.server.public_ip}
  EOF
  filename = "../ansible_workspace/hosts.ini"
}

resource "local_file" "output" {
  content = jsonencode({
    domain_name = "rodrigonginx.com"
    zoneid     = data.aws_route53_zone.domain.zone_id
    ip = resource.aws_instance.server.public_ip
    # api_id = data.aws_api_gateway_rest_api.updateRecordsAPI.id
  })
  filename = "../domain_values.json"
}