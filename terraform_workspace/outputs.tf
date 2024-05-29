resource "local_file" "inventory" {
  content = <<-EOF
  [servers]
  ${join("\n", slice(aws_instance.server.*.public_ip, 0, 2))}
  [load_balancer]
  ${element(aws_instance.server.*.public_ip, 2)}
  EOF
  filename = "../ansible_workspace/hosts.ini"
}