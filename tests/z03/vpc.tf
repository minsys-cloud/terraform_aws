module "vpc" {

  source  = "terraform-aws-modules/vpc/aws"
  version = "1.59.0"

  name = "${var.aws_vpc_name}"

  cidr = "${var.aws_vpc_cidr_block}"
  
  azs             = "${var.aws_vpc_azs}"
  private_subnets = "${var.aws_vpc_private_subnets}"
  public_subnets  = "${var.aws_vpc_public_subnets}"

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_nat_gateway = true
  single_nat_gateway = true
  
  // Specific Ressources tags 

  vpc_tags = {
    Name = "simple-vpc-name"
  }

  private_subnet_tags = {
    Name = "private-subnet"
  }
  
  public_subnet_tags = {
    Name = "public-subnet"
  }
  
  // Global tags 

  tags = {
    user = "${var.aws_vpc_tag_tags_user}"
    environment = "${var.aws_vpc_tag_tags_environment}"
  }


}