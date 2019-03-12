

// AWS Credentials

variable "aws_access_key" {
  description = "AWS Access Key"
}

variable "aws_secret_key" {
  description = "AWS Secret Key"

}

// AWS SSH Config

variable "authorized_key_lvi" {
  type = "string"
  description = "AWS Public SSH Key user lvi"
}

variable "aws_ubuntu_default_user" {
  type = "string"
  description = "AWS Default SSH Key for GNU/Linux Ubuntu OS - used by Ansible "
}

variable "aws_amazonlinux_default_user" {
  type = "string"
  description = "AWS Default SSH Key for GNU/Linux Amazon Linux OS - used by Ansible "
}
//AWS Region

variable "aws_region" {
  description = "The AWS region to use"
}

//AWS VPC Variables - module VPC 

variable "aws_vpc_name" {
  description = "VPC ID"
}

variable "aws_vpc_azs" {
  description = "A list of availability zones in the region to provision"
  type = "list"  
}

variable "aws_vpc_cidr_block" {
  description = "CIDR Block for VPC"
}

variable "aws_vpc_private_subnets" {
  description = "CIDR Blocks for private subnets in Availability Zones"
  type = "list"  
}

variable "aws_vpc_public_subnets" {
  description = "CIDR Blocks for public subnets in Availability Zones"
  type = "list"
}

variable "aws_vpc_tag_tags_user" {
  description = "Global Tag user"
}

variable "aws_vpc_tag_tags_environment" {
  description = "Global Tag environment"
}