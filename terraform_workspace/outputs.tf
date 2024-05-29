output "ip_addr" {
  value = [ for instance in aws_aws_instance.server : instance.public_ip ]
}
resource "local_file" "inventory" {
  content = <<-EOF
  [servers]
  ${join("\n", slice(ip_addr, 0, 2))}
  [load_balancer]
  ${ip_addr[2]}
  EOF
  filename = "../ansible_workspace/inventory/hosts"
}