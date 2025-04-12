variable "instance_type" {
  default = "t2.micro"
}
variable "pub-subnet" {
  type = list(string)
  default = [  ]
}
variable "Pub-sg" {
  type = list(string)
  default = [  ]
}