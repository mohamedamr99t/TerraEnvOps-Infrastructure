#9
resource "aws_instance" "bastion" {
  ami           = "ami-00983e8a26e4c9bd9"
  instance_type = "t2.micro"         
  subnet_id     = module.network.public_subnet.id
  key_name      = "deployer" 
  
  provisioner "local-exec" {
    command = "echo 'Bastion-Instance Public IP: ${self.public_ip}'"
  }

  security_groups = [aws_security_group.allow_ssh.id]
  user_data =<<-EOF
  #!/bin/bash
  echo '''${tls_private_key.my_key_pair.private_key_pem}''' > /home/ubuntu/priv_key_ec2.pem
  chown ubuntu /home/ubuntu/priv_key_ec2.pem
  chmod 0600 /home/ubuntu/priv_key_ec2.pem 
  EOF 
  tags = {
    Name = "Bastion-Instance"
  }
}
#10
resource "aws_instance" "Application" {
  ami           = "ami-00983e8a26e4c9bd9"
  instance_type = "t2.micro"         
  subnet_id     = module.network.private_subnet.id   
  key_name      = "deployer" 

  security_groups = [aws_security_group.allow_ssh_and_port_3000.id]

  tags = {
    Name = "Application"
  }
}

#9
resource "aws_instance" "bastion2" {
  ami           = "ami-00983e8a26e4c9bd9"
  instance_type = "t2.micro"         
  subnet_id     = module.network.public_subnet2.id 
  key_name      = "deployer" 

    provisioner "local-exec" {
    command = "echo 'Bastion-Instance2 Public IP: ${self.public_ip}'"
  }
  
  security_groups = [aws_security_group.allow_ssh.id]
  user_data =<<-EOF
  #!/bin/bash
  echo '''${tls_private_key.my_key_pair.private_key_pem}''' > /home/ubuntu/priv_key_ec2.pem
  chown ubuntu /home/ubuntu/priv_key_ec2.pem
  chmod 0600 /home/ubuntu/priv_key_ec2.pem 
  EOF 
  tags = {
    Name = "Bastion-Instance2"}
}
#10
resource "aws_instance" "Application2" {
  ami           = "ami-00983e8a26e4c9bd9"
  instance_type = "t2.micro"         
  subnet_id     = module.network.private_subnet2.id     
  key_name      = "deployer" 

  security_groups = [aws_security_group.allow_ssh_and_port_3000.id]

  tags = {
    Name = "Application2"
  }
}