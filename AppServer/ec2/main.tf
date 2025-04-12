/*
provider "aws" {
  region = "ap-south-1"
}
*/
data "aws_ami" "New-Ami" {
  most_recent = true
  owners = [ "amazon" ]
  filter {
    name = "name"
    values = [ "al2023-ami-*" ]
  }
}
resource "aws_instance" "App_Server" {
  ami = data.aws_ami.New-Ami.id
  instance_type = var.instance_type
  subnet_id = var.pub-subnet[0]
  security_groups = var.Pub-sg
  user_data = file("${path.module}/app-install.sh")
  associate_public_ip_address = true
  

  tags = {
    name = "My-App-Server"
  }
  
}