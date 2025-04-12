module "ce2" {
  source = "../ec2"
  pub-subnet = ["${module.vpc.Public_Subnet_id}"]
  Pub-sg = ["${module.vpc.Security_Group_id}"]
}
module "vpc" {
  source = "../vcp"
  availability_zone = "ap-south-1a"
}