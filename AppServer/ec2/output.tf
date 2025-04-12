output "Instance_Public_Ip" {
  value = aws_instance.App_Server.public_ip
}
output "Instance_public_dns" {
  value = aws_instance.App_Server.public_dns
}