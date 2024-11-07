# Define the AWS instance
resource "aws_instance" "worker1" {
  ami                    = "ami-022ce6f32988af5fa" # Replace with the desired AMI ID
  instance_type          = "t2.micro"
  key_name               = "PrakashAWS"
  subnet_id              = aws_subnet.public-subnets["public-subnet2"].id
  vpc_security_group_ids = [aws_security_group.Terra_SG.id]
  associate_public_ip_address = true

  tags = {
    Name = "Ansible Worker1"
  }
}

# Output the instance's public IP address
output "worker1_public_ip" {
  value = aws_instance.worker1.public_ip
}

# Create an Ansible inventory file with the instance's public IP
resource "local_file" "ansible_inventory" {
  content = <<EOF
[ec2_instances]
${aws_instance.worker1.public_ip} ansible_user=ec2-user ansible_ssh_private_key_file=/var/tmp/private-key.pem
EOF
  filename = "/var/tmp/ansible/inventory.ini"
}

