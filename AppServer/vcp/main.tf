/*
provider "aws" {
  region = "ap-south-1"
}
*/
resource "aws_vpc" "Public_Vpc" {
  cidr_block = var.Vpc_Cidr
  enable_dns_support = true
  tags = {
    name = "Public_Vpc"
  }
}
resource "aws_subnet" "Public_subnet" {
  vpc_id = aws_vpc.Public_Vpc.id
  cidr_block = var.Subnet_Cidr
  availability_zone = var.availability_zone
  tags = {
    name = "Public_Subnet"
  }
}
resource "aws_internet_gateway" "Public-IGW" {
  vpc_id = aws_vpc.Public_Vpc.id
  tags = {
    name = "Public-IGW"
  }
}
resource "aws_route_table" "public_Route_Table" {
  vpc_id = aws_vpc.Public_Vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Public-IGW.id
  }


}
resource "aws_route_table_association" "name" {
  subnet_id = aws_subnet.Public_subnet.id
  route_table_id = aws_route_table.public_Route_Table.id
}
resource "aws_security_group" "Allow_SG" {
  name = "TCP-Allow-SG"
  vpc_id = aws_vpc.Public_Vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = "App-Server-SG"
  }
}

