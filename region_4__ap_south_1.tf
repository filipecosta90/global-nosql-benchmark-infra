# Create VPC for ap_south_1
resource "aws_vpc" "ap_south_1_vpc" {
  cidr_block = var.ap_south_1_vpc_cidr_block
  provider   = aws.ap_south_1
  #  enable_dns_hostnames = true
  tags = {
    Name = "ap_south_1_vpc"
  }
}

# Create Internet Gateway for ap_south_1
resource "aws_internet_gateway" "ap_south_1-igw" {
  vpc_id   = aws_vpc.ap_south_1_vpc.id
  provider = aws.ap_south_1
  tags = {
    Name = "ap_south_1-igw"
  }
}

# Create Route Table for ap_south_1
resource "aws_route_table" "route_table_ap_south_1" {
  vpc_id   = aws_vpc.ap_south_1_vpc.id
  provider = aws.ap_south_1

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ap_south_1-igw.id
  }

  route {
    cidr_block                = var.us_west_1_subnet_cidr_block
    vpc_peering_connection_id = aws_vpc_peering_connection.ap_south_1.id
  }
}


# Create Subnet for ap_south_1
resource "aws_subnet" "subnet_ap_south_1" {
  provider                = aws.ap_south_1
  vpc_id                  = aws_vpc.ap_south_1_vpc.id
  cidr_block              = var.ap_south_1_subnet_cidr_block
  map_public_ip_on_launch = true # This makes public subnet
  availability_zone       = var.ap_south_1_availability_zone
  tags = {
    Name = "ap_south_1-subnet"
  }
}

# Associate ap_south_1 Subnet to ap_south_1 Route Table
resource "aws_route_table_association" "route_table_ap_south_1" {
  provider       = aws.ap_south_1
  subnet_id      = aws_subnet.subnet_ap_south_1.id
  route_table_id = aws_route_table.route_table_ap_south_1.id
}


resource "aws_instance" "ap_south_1_db" {
  provider      = aws.ap_south_1
  ami           = var.ami_id_ap_south_1
  instance_type = var.instance_type
  # This is an existing key pair that has already been created in the specified region
  key_name               = var.ami_key_pair_name_ap_south_1
  vpc_security_group_ids = [aws_security_group.ap_south_1_security_group.id]
  subnet_id              = aws_subnet.subnet_ap_south_1.id
  monitoring             = false

  tags = {
    Name = "ap_south_1_db"
  }
}


resource "aws_instance" "ap_south_1_client" {
  provider      = aws.ap_south_1
  ami           = var.ami_id_ap_south_1
  instance_type = var.instance_type
  # This is an existing key pair that has already been created in the specified region
  key_name               = var.ami_key_pair_name_ap_south_1
  vpc_security_group_ids = [aws_security_group.ap_south_1_security_group.id]
  subnet_id              = aws_subnet.subnet_ap_south_1.id
  monitoring             = false

  tags = {
    Name = "ap_south_1_client"
  }
}

