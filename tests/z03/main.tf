# Configure the AWS Provider
provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region  = "${var.aws_region}"
}


/*
resource "aws_key_pair" "authorized_key" {
  key_name   = "terraform-demo"
  public_key = "${var.authorized_key}"
}
*/