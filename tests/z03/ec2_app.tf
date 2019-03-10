


/*resource "aws_eip" "this" {
  vpc      = true
  instance = "${module.ec2.id[0]}"
}*/

module "ec2_app" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "1.19.0"

  # insert the 4 required variables here
  ami = "${data.aws_ami.ubuntu_xenial.id}" 
  instance_type = "t2.nano"
  name = "app"
  vpc_security_group_ids = ["${module.sg_app.this_security_group_id}"]

  instance_count = 3

  subnet_ids =  ["${module.vpc.private_subnets}"]
  #subnet_id                   = "${element(module.vpc.public_subnets, 0)}"
  #subnet_id = "${element(module.vpc.public_subnets,count.index)}"
  associate_public_ip_address = true
}

#"${element(data.aws_subnet_ids.all.ids, 0)}"

#Make an encrypted AMI for use
#This example creates an encrypted image from the latest ubuntu 16.04 base image.
/*
resource "aws_ami_copy" "ubuntu-xenial-encrypted-ami" {
  name              = "ubuntu-xenial-encrypted-ami"
  description       = "An encrypted root ami based off ${data.aws_ami.ubuntu-xenial.id}"
  source_ami_id     = "${data.aws_ami.ubuntu-xenial.id}"
  source_ami_region = "eu-west-2"
  encrypted         = "true"

  tags {
    Name = "ubuntu-xenial-encrypted-ami"
  }
}

data "aws_ami" "encrypted-ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu-xenial-encrypted"]
  }

  owners = ["self"]
}

data "aws_ami" "ubuntu-xenial" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  owners      = ["099720109477"]
}*/