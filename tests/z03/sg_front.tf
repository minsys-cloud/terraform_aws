

module "sg_front" {
  source = "terraform-aws-modules/security-group/aws"
  version = "2.15.0"

  name        = "sg_front"
  description = "Security group for the Frontend RProxy with tcp:80:443 ports publicly open, ssh internally"
  vpc_id      = "${module.vpc.vpc_id}"

  ingress_rules = ["http-80-tcp", "https-443-tcp"] 
  ingress_cidr_blocks = ["0.0.0.0/0"]

  #egress_rules = ["all-all"]
  
  ingress_with_cidr_blocks = [
   {
      rule        = "http-8080-tcp"
      cidr_blocks = "${module.vpc.vpc_cidr_block}"
      description = "HTTP_8080"
      #CIDR Block different from ingress_cidr_blocks
      #cidr_blocks = ""10.0.0.0/16"
      #instead of "0.0.0.0/0"  
    },
    {
      from_port   = 0
      to_port     = 8
      protocol    = "ICMP" 
      cidr_blocks = "${module.vpc.vpc_cidr_block}" 
      description = "PING"
    }, 
    {
      rule        = "ssh-tcp"
      cidr_blocks = "${module.vpc.vpc_cidr_block}"
      description = "SSH"
      #CIDR Block different from ingress_cidr_blocks
      #cidr_blocks = ""10.0.0.0/16"
      #instead of "0.0.0.0/0"  
    }
  ]
  
}

/*
module "vote_service_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "user-service"
  description = "Security group for user-service with custom ports open within VPC, and PostgreSQL publicly open"
  vpc_id      = "vpc-12345678"

  ingress_cidr_blocks      = ["10.10.0.0/16"]
  ingress_rules            = ["https-443-tcp"]
  ingress_with_cidr_blocks = [
    {
      from_port   = 8080
      to_port     = 8090
      protocol    = "tcp"
      description = "User-service ports"
      cidr_blocks = "10.10.0.0/16"
    },
    {
      rule        = "postgresql-tcp"
      #CIDR Block different from ingress_cidr_blocks
      cidr_blocks = "2.3.6.1/32". 
    },
  ]
}*/

/*
module "security-group_http-80" {
  source  = "terraform-aws-modules/security-group/aws//modules/http-80"
  version = "2.15.0"

  name        = "http-sg"
  description = "Security group with HTTP ports open for everybody (IPv4 CIDR), egress ports are all world open"
  vpc_id      = "${module.vpc.vpc_id}"

  ingress_cidr_blocks = ["0.0.0.0/0"]

  # insert the 2 required variables here
}

module "security-group_ssh" {
  source  = "terraform-aws-modules/security-group/aws//modules/ssh"
  version = "2.15.0"

  # insert the 2 required variables here

  name        = "ssh-sg"
  description = "Security group with SSH ports open for everybody (IPv4 CIDR), egress ports are all world open"
  vpc_id      = "${module.vpc.vpc_id}"

  ingress_cidr_blocks = ["0.0.0.0/0"]
}*/