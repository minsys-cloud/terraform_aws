
####################
# Output Module VPC
####################

output "vpc_id" {
  description = "The ID of the VPC"
  value       = "${module.vpc.vpc_id}"
}

# CIDR blocks
output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = ["${module.vpc.vpc_cidr_block}"]
}

//output "vpc_ipv6_cidr_block" {
//  description = "The IPv6 CIDR block"
//  value       = ["${module.vpc.vpc_ipv6_cidr_block}"]
//}

# Subnets
output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = ["${module.vpc.private_subnets}"]
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = ["${module.vpc.public_subnets}"]
}

# NAT gateways
output "nat_public_ips" {
  description = "List of public Elastic IPs created for AWS NAT Gateway"
  value       = ["${module.vpc.nat_public_ips}"]
}

# AZs
output "azs" {
  description = "A list of availability zones spefified as argument to this module"
  value       = ["${module.vpc.azs}"]
}

###############################
# Output Module Security Groups 
###############################

#Module "sg_bastion_web"

output "security_group_id" {
  description = "The ID of the security group"
  value       = "${module.sg_bastion_web.this_security_group_id}"
}

output "security_group_vpc_id" {
  description = "The VPC ID"
  value       = "${module.sg_bastion_web.this_security_group_vpc_id}"
}

output "security_group_owner_id" {
  description = "The owner ID"
  value       = "${module.sg_bastion_web.this_security_group_owner_id}"
}

output "security_group_name" {
  description = "The name of the security group"
  value       = "${module.sg_bastion_web.this_security_group_name}"
}

output "security_group_description" {
  description = "The description of the security group"
  value       = "${module.sg_bastion_web.this_security_group_description}"
}

###############################
# Output Module EC2 - ec2_bastions
###############################

output "availability_zone_ec2_bastion" {
  description = "List of IDs of instances"
  value       = "${module.ec2_bastion.availability_zone}"
}

output "instance_ids_ec2_bastion" {
  description = "List of IDs of instances"
  value       = "${module.ec2_bastion.id}"
}

output "public_dns_ec2_bastion" {
  description = "List of public DNS names assigned to the instances"
  value       = "${module.ec2_bastion.public_dns}"
}

output "public_ip_ec2_bastion" {
  description = "List of VPC security group ids assigned to the instances"
  value       = "${module.ec2_bastion.public_ip}"
}

output "private_ip_ec2_bastion" {
  description = "List of VPC security group ids assigned to the instances"
  value       = "${module.ec2_bastion.private_ip}"
}



###############################
# Output Module EC2 - ec2_web
###############################

output "availability_zone_ec2_web" {
  description = "List of IDs of instances"
  value       = "${module.ec2_web.availability_zone}"
}

output "instance_ids_ec2_web" {
  description = "List of IDs of instances"
  value       = "${module.ec2_web.id}"
}

output "public_dns_ec2_web" {
  description = "List of public DNS names assigned to the instances"
  value       = "${module.ec2_web.public_dns}"
}

output "public_ip_ec2_web" {
  description = "List of VPC security group ids assigned to the instances"
  value       = "${module.ec2_web.public_ip}"
}

output "private_ip_ec2_web" {
  description = "List of VPC security group ids assigned to the instances"
  value       = "${module.ec2_web.private_ip}"
}





/*output "tags" {
  description = "List of tags"
  value       = "${module.ec2.tags}"
}

output "instance_id" {
  description = "EC2 instance ID"
  value       = "${module.ec2.id[0]}"
}

output "instance_public_dns" {
  description = "Public DNS name assigned to the EC2 instance"
  value       = "${module.ec2.public_dns[0]}"
}*/






