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
# Output the instance's public IP
output "instance_public_ip" {
  value = aws_instance.example.public_ip
}

# Write the public IP to the Ansible inventory file on the Terraform/Ansible server
resource "local_file" "ansible_inventory" {
  content = <<EOF
[ec2_instances]
${aws_instance.example.public_ip} ansible_user=ec2-user ansible_ssh_private_key_file=/var/tmp/private-key.pem
EOF
  filename = "/var/tmp/ansible/inventory.ini"
}

