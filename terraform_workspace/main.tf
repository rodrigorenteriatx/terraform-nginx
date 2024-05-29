provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "ssh_key" {
    key_name = "ec2-key"
    public_key = file(var.public_key)
}

# Creates the EC2 Security Group with Inbound and Outbound rules.
resource "aws_security_group" "sg" {
  name = "sg"
  vpc_id = aws_vpc.myvpc.id

    # This will allow us to access the HTTP server on Port 80, where our WP will be accessible.
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    # This will allow us to SSH into the instance for Ansible to do it's magic.
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "lb-sg" {
  name = "lb-sg"
  vpc_id = aws_vpc.myvpc.id

    # This will allow us to access the HTTP server on Port 80, where our WP will be accessible.
  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "server" {
  ami = var.ami
  instance_type = "t2.micro"
  count = var.ec2-count
  key_name = aws_key_pair.ssh_key.key_name
  associate_public_ip_address = true
  subnet_id = aws_subnet.PublicSubnet.id
  vpc_security_group_ids = count.index == 2 ? [aws_security_group.sg.id, aws_security_group.lb-sg.id] : [aws_security_group.sg.id]


  tags = {
    Name = "server-${count.index}"
  }

  depends_on = [ aws_security_group.lb-sg, aws_security_group.sg ]
}