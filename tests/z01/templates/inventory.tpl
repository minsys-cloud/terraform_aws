
[all:vars]

ansible_user="${aws_ubuntu_default_user}"


[all]
${bastion_ip_list}
${connection_strings_front}

[bastion]
${bastion_ip_list}

[front]
${front_ip_list}


[app]
${app_ip_list}


