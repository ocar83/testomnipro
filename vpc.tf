module "vpc" {
  source             = "terraform-aws-modules/vpc/aws"
  name               = "app-vpc"
  cidr               = "10.1.0.0/16"
  azs                = ["us-east-1a", "us-east-1b"]
  private_subnets    = ["10.1.3.0/24", "10.1.4.0/24"]
  public_subnets     = ["10.1.1.0/24", "10.1.2.0/24"]
  enable_nat_gateway = true

}