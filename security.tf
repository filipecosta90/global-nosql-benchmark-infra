# Create Security Group for EC2 Instance for eu_west_3
resource "aws_security_group" "eu_west_3_security_group" {
  provider    = aws.eu_west_3
  name        = "eu_west_3_security_group"
  description = "eu_west_3 security group"
  vpc_id      = aws_vpc.eu_west_3_vpc.id

  # Allow inbound traffic from 99/*
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["99.0.0.0/8"]
  }

  # Allow inbound traffic from 99/*
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "udp"
    cidr_blocks = ["99.0.0.0/8"]
  }

  # Allow inbound ICMP traffic from 99/*
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["99.0.0.0/8"]
  }

  # Allow SSH for EC2 Connect or SSH from a terminal
  ingress {
    description = "SSH"
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
  tags = {
    Name = "eu_west_3_security_group"
  }
}

# Create Security Group for EC2 Instance for us_west_1
resource "aws_security_group" "us_west_1_security_group" {
  provider    = aws.us_west_1
  name        = "us_west_1_security_group"
  description = "us_west_1 security group"
  vpc_id      = aws_vpc.us_west_1_vpc.id

  # Allow inbound traffic from 99/*
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["99.0.0.0/8"]
  }

  # Allow inbound traffic from 99/*
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "udp"
    cidr_blocks = ["99.0.0.0/8"]
  }

  # Allow inbound ICMP traffic from 99/*
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["99.0.0.0/8"]
  }


  # Allow SSH for EC2 Connect or SSH from a terminal
  ingress {
    description = "SSH"
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
  tags = {
    Name = "us_west_1_security_group"
  }
}


# Create Security Group for EC2 Instance for sa_east_1
resource "aws_security_group" "sa_east_1_security_group" {
  provider    = aws.sa_east_1
  name        = "sa_east_1_security_group"
  description = "sa_east_1 security group"
  vpc_id      = aws_vpc.sa_east_1_vpc.id

  # Allow inbound traffic from 99/*
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["99.0.0.0/8"]
  }

  # Allow inbound traffic from 99/*
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "udp"
    cidr_blocks = ["99.0.0.0/8"]
  }

  # Allow inbound ICMP traffic from 99/*
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["99.0.0.0/8"]
  }

  # Allow SSH for EC2 Connect or SSH from a terminal
  ingress {
    description = "SSH"
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
  tags = {
    Name = "sa_east_1_security_group"
  }
}



resource "aws_security_group" "ap_south_1_security_group" {
  provider    = aws.ap_south_1
  name        = "ap_south_1_security_group"
  description = "ap_south_1 security group"
  vpc_id      = aws_vpc.ap_south_1_vpc.id

  # Allow inbound traffic from 99/*
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["99.0.0.0/8"]
  }

  # Allow inbound traffic from 99/*
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "udp"
    cidr_blocks = ["99.0.0.0/8"]
  }

  # Allow inbound ICMP traffic from 99/*
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["99.0.0.0/8"]
  }

  # Allow SSH for EC2 Connect or SSH from a terminal
  ingress {
    description = "SSH"
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
  tags = {
    Name = "ap_south_1_security_group"
  }
}
