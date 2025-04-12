output "Security_Group_id" {
  value = aws_security_group.Allow_SG.id
}
output "Public_Subnet_id" {
  value = aws_subnet.Public_subnet.id
}