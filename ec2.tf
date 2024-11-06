resource "aws_instance" "master" {
    ami = "ami-022ce6f32988af5fa"
    instance_type = "t2.micro"
    key_name = "PrakashAWS"
    subnet_id = aws_subnet.public-subnets["public-subnet1"].id
    vpc_security_group_ids = [aws_security_group.Terra_SG.id]
    associate_public_ip_address = true
    tags = {
      Name= "Ansible Master"
    }
user_data = <<-EOF
#!/bin/bash
useradd abhi
echo "redhat" | passwd --stdin abhi
sed -i "/PasswordAuthentication/s/no/yes/" /etc/ssh/sshd_config
sed -i "/PasswordAuthentication/s/no/yes/" /etc/ssh/sshd_config.d/50-cloud-init.conf
systemctl restart sshd
echo "abhi ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
EOF
}

resource "aws_instance" "worker1" {
    ami = "ami-022ce6f32988af5fa"
    instance_type = "t2.micro"
    key_name = "PrakashAWS"
    subnet_id = aws_subnet.public-subnets["public-subnet2"].id
    vpc_security_group_ids = [aws_security_group.Terra_SG.id]
    associate_public_ip_address = true
    tags = {
      Name = "Ansible Worker1"
    }
  user_data = <<-EOF
#!/bin/bash
useradd abhi
echo "redhat" | passwd --stdin abhi
sed -i "/PasswordAuthentication/s/no/yes/" /etc/ssh/sshd_config
sed -i "/PasswordAuthentication/s/no/yes/" /etc/ssh/sshd_config.d/50-cloud-init.conf
systemctl restart sshd
echo "abhi ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
EOF
}

resource "aws_instance" "worker2" {
    ami = "ami-022ce6f32988af5fa"
    instance_type = "t2.micro"
    key_name = "PrakashAWS"
    subnet_id = aws_subnet.public-subnets["public-subnet1"].id
    vpc_security_group_ids = [aws_security_group.Terra_SG.id]
    associate_public_ip_address = true
    tags = {
      Name = "Ansible Worker2"
    } 

    user_data = <<-EOF
#!/bin/bash
useradd abhi
echo "redhat" | passwd --stdin abhi
sed -i "/PasswordAuthentication/s/no/yes/" /etc/ssh/sshd_config
sed -i "/PasswordAuthentication/s/no/yes/" /etc/ssh/sshd_config.d/50-cloud-init.conf
systemctl restart sshd
echo "abhi ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
EOF 
}

