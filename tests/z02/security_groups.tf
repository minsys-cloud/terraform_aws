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

module "security-group_ssh" {
  source  = "terraform-aws-modules/security-group/aws//modules/ssh"
  version = "2.15.0"

  # insert the 2 required variables here
    name = "web-security-group"
    vpc_id = "${module.vpc.vpc_id}"
}