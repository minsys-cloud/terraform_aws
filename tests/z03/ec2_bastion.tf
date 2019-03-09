


/*resource "aws_eip" "this" {
  vpc      = true
  instance = "${module.ec2.id[0]}"
}*/

module "ec2_bastion_web" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "1.19.0"

  # insert the 4 required variables here
  ami = "${data.aws_ami.ubuntu_xenial.id}" 
  instance_type = "m4.large"
  name = "example-ec2-M4L"
  vpc_security_group_ids = ["${module.sg_bastion_web.this_security_group_id}"]

  instance_count = 2

  subnet_id                   = "${element(module.vpc.public_subnets.all.ids, 0)}"
  associate_public_ip_address = true
}


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