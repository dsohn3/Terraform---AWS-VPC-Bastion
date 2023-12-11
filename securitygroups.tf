resource "aws_security_group" "ingress-bastion-host" {
  name        = "SSH Into Bastion"
  description = "SSH Into Bastion"
  vpc_id      = aws_vpc.demo-vpc.id

  ingress {
    description = "SSH-TCP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "egress-bastion-host" {
  name        = "SSH Into Private"
  description = "SSH Into Private"
  vpc_id      = aws_vpc.demo-vpc.id

  ingress {
    description = "SSH-TCP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.public-subnet-cidrs[0]]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
