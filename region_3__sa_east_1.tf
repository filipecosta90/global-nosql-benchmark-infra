# Create VPC for sa_east_1
resource "aws_vpc" "sa_east_1_vpc" {
  cidr_block = var.sa_east_1_vpc_cidr_block
  provider   = aws.sa_east_1
  #  enable_dns_hostnames = true
  tags = {
    Name = "sa_east_1_vpc"
  }
}

# Create Internet Gateway for sa_east_1
resource "aws_internet_gateway" "sa_east_1-igw" {
  vpc_id   = aws_vpc.sa_east_1_vpc.id
  provider = aws.sa_east_1
  tags = {
    Name = "sa_east_1-igw"
  }
}

# Create Route Table for sa_east_1
resource "aws_route_table" "route_table_sa_east_1" {
  vpc_id   = aws_vpc.sa_east_1_vpc.id
  provider = aws.sa_east_1

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.sa_east_1-igw.id
  }

  route {
    cidr_block                = var.us_west_1_subnet_cidr_block
    vpc_peering_connection_id = aws_vpc_peering_connection.sa_east_1.id
  }
}


# Create Subnet for sa_east_1
resource "aws_subnet" "subnet_sa_east_1" {
  provider                = aws.sa_east_1
  vpc_id                  = aws_vpc.sa_east_1_vpc.id
  cidr_block              = var.sa_east_1_subnet_cidr_block
  map_public_ip_on_launch = true # This makes public subnet
  availability_zone       = var.sa_east_1_availability_zone
  tags = {
    Name = "sa_east_1-subnet"
  }
}

# Associate sa_east_1 Subnet to sa_east_1 Route Table
resource "aws_route_table_association" "route_table_sa_east_1" {
  provider       = aws.sa_east_1
  subnet_id      = aws_subnet.subnet_sa_east_1.id
  route_table_id = aws_route_table.route_table_sa_east_1.id
}


resource "aws_instance" "sa_east_1_db" {
  provider      = aws.sa_east_1
  ami           = var.ami_id_sa_east_1
  instance_type = var.instance_type
  # This is an existing key pair that has already been created in the specified region
  key_name        = var.ami_key_pair_name_sa_east_1
  vpc_security_group_ids = [aws_security_group.sa_east_1_security_group.id]
  subnet_id       = aws_subnet.subnet_sa_east_1.id
  monitoring      = false

  tags = {
    Name = "sa_east_1_db"
  }
}


resource "aws_instance" "sa_east_1_client" {
  provider      = aws.sa_east_1
  ami           = var.ami_id_sa_east_1
  instance_type = var.instance_type
  # This is an existing key pair that has already been created in the specified region
  key_name        = var.ami_key_pair_name_sa_east_1
  vpc_security_group_ids = [aws_security_group.sa_east_1_security_group.id]
  subnet_id       = aws_subnet.subnet_sa_east_1.id
  monitoring      = false

  tags = {
    Name = "sa_east_1_client"
  }
}

