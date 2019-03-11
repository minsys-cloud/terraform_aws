

data "aws_availability_zones" "available" {}
# Usage -- 
# aws_avail_zones="${slice(data.aws_availability_zones.available.names,0,2)}"

data "aws_ami" "ubuntu_xenial" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  owners      = ["099720109477"]
}


#############################################################
# Data sources to generate SSH config file & Ansible inventory
#############################################################

    
/*
* Ansible default inventory file
*/

/*
data "template_file" "inventory" {
    template = "${file("${path.module}/templates/inventory.tpl")}"

    vars {
        public_ip_address_bastion = "${join("\n",formatlist("%s ansible_host=%s" , aws_instance.bastion-server.*.tags.Name, aws_instance.bastion-server.*.public_ip))}"
        connection_strings_master = "${join("\n",formatlist("%s ansible_host=%s",aws_instance.master.*.tags.Name, aws_instance.master.*.private_ip))}"
        connection_strings_node = "${join("\n", formatlist("%s ansible_host=%s", aws_instance.worker.*.tags.Name, aws_instance.worker.*.private_ip))}"
        list_master = "${join("\n",aws_instance.master.*.tags.Name)}"
        list_node = "${join("\n",aws_instance.worker.*.tags.Name)}"
        cloud_provider_region = "${var.AWS_DEFAULT_REGION}"
        cloud_provider_name = "${var.cloud_provider_name}"
        cloud_provider_shortname = "${var.cloud_provider_shortname}"
        environment_name = "${var.environment_name}"
        environment_shortname = "${var.environment_shortname}"
        ansible_user = "${var.default_user}"
    }
}
*/

/*
* SSH Config default file
*/

/*
data "template_file" "ssh_config" {
    template = "${file("${path.module}/templates/ssh-bastion.config.tpl")}"

    vars {
        public_ip_address_bastion = "${aws_instance.bastion-server.0.public_ip}"
        list_master = "${join(" ", aws_instance.master.*.private_ip)}"
        list_node = "${join(" ", aws_instance.worker.*.private_ip)}"
        default_user = "${var.default_user}"
    }
}
*/




#############################################################
# Data sources to get VPC and default security group details
#############################################################

/*
data "aws_vpc" "default" {
  default = true
}

data "aws_security_group" "default" {
  name   = "default"
  vpc_id = "${data.aws_vpc.default.id}"
}
*/

#############################################################
# Data sources to get AMI details
#############################################################
# cf ec2_bastion.tf for encrypted AMI 

#1 - Amazon Linux 

/*
data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name = "name"

    values = [
      "amzn-ami-hvm-*-x86_64-gp2",
    ]
  }

  filter {
    name = "owner-alias"

    values = [
      "amazon",
    ]
  }
}
*/
#2 - Ubuntu 



