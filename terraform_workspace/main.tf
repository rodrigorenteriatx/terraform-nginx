provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "ssh_key" {
    key_name = "ec2-key"
    public_key = file(var.public_key)
}


resource "aws_instance" "server" {
  ami = var.ami
  instance_type = "t2.micro"
  count = var.ec2-count
  key_name = aws_key_pair.ssh_key.key_name
  associate_public_ip_address = true
  subnet_id = aws_subnet.PublicSubnet.id
  vpc_security_group_ids = count.index == 2 ? [aws_security_group.sg.id, aws_security_group.lb_sg.id] : [aws_security_group.sg.id]


  tags = {
    Name = "server-${count.index}"
  }
}