resource "aws_instance" "Bhanu-bastion" {
  ami = var.AMIS[var.AWS_REGION]

  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.Bhanu-public-1.id

  # the security group
  vpc_security_group_ids = [aws_security_group.bhanu-bastion-sg.id]

  # the public SSH key
  key_name = aws_key_pair.Bhanu-mykeypair.key_name

  tags = {
      Name = "Bhanu-bastion"
  }


}
resource "aws_instance" "Bhanu-ansible" {
  ami = var.AMIS[var.AWS_REGION]

  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.Bhanu-private-1.id

  associate_public_ip_address = "false"

  # the security group
  vpc_security_group_ids = [aws_security_group.bhanu-ansible-sg.id]

  # the public SSH key
  key_name = aws_key_pair.Bhanu-mykeypair.key_name

  tags = {
      Name = "Bhanu-ansible"
  }

}
 # provisioner "local-exec" {
 #       command = "ansible-playbook -i ${aws_instance.bhanu-ansible.public_ip}, --private-key ${var.PATH_TO_PRIVATE_KEY} play.yaml"
#  }



