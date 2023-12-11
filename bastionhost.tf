resource "aws_instance" "bastion-host" {
  ami                    = data.aws_ami.amazon_ami.id
  instance_type          = "t2.micro"
  availability_zone      = element(var.availability-zones, 0)
  subnet_id              = aws_subnet.public-subnets[0].id
  key_name               = "bastion-host-tf"
  vpc_security_group_ids = [aws_security_group.ingress-bastion-host.id]

  tags = {
    Name = "Bastion SSH"
  }
  depends_on = [aws_subnet.public-subnets]
}

resource "aws_eip" "eip-bastion" {
  domain = "vpc"
  tags = {
    Name = "EIP-Bastion"
  }
}

resource "aws_eip_association" "eip-bastion" {
  instance_id   = aws_instance.bastion-host.id
  allocation_id = aws_eip.eip-bastion.id
}

resource "aws_instance" "private-test-instance" {
  ami                    = data.aws_ami.amazon_ami.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private-subnets[0].id
  key_name               = "bastion-host-tf"
  vpc_security_group_ids = [aws_security_group.egress-bastion-host.id]

  tags = {
    Name = "Private Test Instance"
  }
}