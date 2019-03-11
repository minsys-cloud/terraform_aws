# Configure the AWS Provider
provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region  = "${var.aws_region}"
}



resource "aws_key_pair" "authorized_key" {
  key_name   = "lvi_rsa"
  public_key = "${var.authorized_key_lvi}"
}


    
/*
* Ansible default inventory file 
*/

/*

resource "null_resource" "inventories" {
  provisioner "local-exec" {
      command = "echo '${data.template_file.inventory.rendered}' > ansible_inventory"
  }

  triggers {
      template = "${data.template_file.inventory.rendered}"
  }
}
*/
/*
* SSH Config default file
*/
/*

resource "null_resource" "ssh_config" {
  provisioner "local-exec" {
      command = "echo '${data.template_file.ssh_config.rendered}' > ssh-bastion.config"
  }

  triggers {
      template = "${data.template_file.ssh_config.rendered}"
  }
}
*/