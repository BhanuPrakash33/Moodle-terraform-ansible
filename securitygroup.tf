resource "aws_security_group" "bhanu-bastion-sg" {
  vpc_id = aws_vpc.Bhanu-main.id
  name = "bhanu-bastion-sg"
  description = "security group that allows ssh and tcp  and all egress traffic"
  egress {
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  } 
  ingress {
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
  Name = "bhanu-bastion-sg"
  } 
}

resource "aws_security_group" "bhanu-ansible-sg" {
  vpc_id = aws_vpc.Bhanu-main.id
  name = "bhanu-ansible-sg"
  description = "security group that allows to communicate with Bhanu-bastion-sg"
  egress {
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
  from_port = 22
  to_port = 22
  protocol = "tcp"
  security_groups = [aws_security_group.bhanu-bastion-sg.id]
  }
  ingress {
  from_port = 80
  to_port = 80
  protocol = "tcp"
  security_groups = [aws_security_group.bhanu-bastion-sg.id]
  }
   tags = {
  Name = "bhanu-ansible-sg"
  }
}

