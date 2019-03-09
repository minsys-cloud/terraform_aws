/*module "security-group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "2.15.0"

  # insert the 2 required variables here

  name = "security-group"
  vpc_id = "${module.vpc.vpc_id}"

}*/

/*module "web_security_group" {
  source = "terraform-aws-modules/security-group/aws//modules/web"
  version = "2.15.0"

  # insert the 2 required variables here

    name = "web-security-group"
    vpc_id = "${module.vpc.vpc_id}"
}*/

/*module "security-group_ssh" {
  source  = "terraform-aws-modules/security-group/aws//modules/ssh"
  version = "2.15.0"

  # insert the 2 required variables here
    name = "web-security-group"
    vpc_id = "${module.vpc.vpc_id}"
}*/

#######
# HTTP
#######
/*module "http_sg" {
  source = "../../modules/http-80"

  name        = "http-sg"
  description = "Security group with HTTP ports open for everybody (IPv4 CIDR), egress ports are all world open"
  vpc_id      = "${module.vpc.vpc_id}"

  ingress_cidr_blocks = ["0.0.0.0/0"]
}
*/
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
}