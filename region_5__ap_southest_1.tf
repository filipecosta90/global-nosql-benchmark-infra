# Create VPC for ap_southeast_2
resource "aws_vpc" "ap_southeast_2_vpc" {
  cidr_block = var.ap_southeast_2_vpc_cidr_block
  provider   = aws.ap_southeast_2
  #  enable_dns_hostnames = true
  tags = {
    Name = "ap_southeast_2_vpc"
  }
}

# Create Internet Gateway for ap_southeast_2
resource "aws_internet_gateway" "ap_southeast_2-igw" {
  vpc_id   = aws_vpc.ap_southeast_2_vpc.id
  provider = aws.ap_southeast_2
  tags = {
    Name = "ap_southeast_2-igw"
  }
}

# Create Route Table for ap_southeast_2
resource "aws_route_table" "route_table_ap_southeast_2" {
  vpc_id   = aws_vpc.ap_southeast_2_vpc.id
  provider = aws.ap_southeast_2

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ap_southeast_2-igw.id
  }

  route {
    cidr_block                = var.us_west_1_subnet_cidr_block
    vpc_peering_connection_id = aws_vpc_peering_connection.ap_southeast_2.id
  }
}


# Create Subnet for ap_southeast_2
resource "aws_subnet" "subnet_ap_southeast_2" {
  provider                = aws.ap_southeast_2
  vpc_id                  = aws_vpc.ap_southeast_2_vpc.id
  cidr_block              = var.ap_southeast_2_subnet_cidr_block
  map_public_ip_on_launch = true # This makes public subnet
  availability_zone       = var.ap_southeast_2_availability_zone
  tags = {
    Name = "ap_southeast_2-subnet"
  }
}

# Associate ap_southeast_2 Subnet to ap_southeast_2 Route Table
resource "aws_route_table_association" "route_table_ap_southeast_2" {
  provider       = aws.ap_southeast_2
  subnet_id      = aws_subnet.subnet_ap_southeast_2.id
  route_table_id = aws_route_table.route_table_ap_southeast_2.id
}


resource "aws_instance" "ap_southeast_2_db" {
  provider      = aws.ap_southeast_2
  ami           = var.ami_id_ap_southeast_2
  instance_type = var.instance_type
  # This is an existing key pair that has already been created in the specified region
  key_name               = var.ami_key_pair_name_ap_southeast_2
  vpc_security_group_ids = [aws_security_group.ap_southeast_2_security_group.id]
  subnet_id              = aws_subnet.subnet_ap_southeast_2.id
  monitoring             = false

  tags = {
    Name = "ap_southeast_2_db"
  }
}


resource "aws_instance" "ap_southeast_2_client" {
  provider      = aws.ap_southeast_2
  ami           = var.ami_id_ap_southeast_2
  instance_type = var.instance_type
  # This is an existing key pair that has already been created in the specified region
  key_name               = var.ami_key_pair_name_ap_southeast_2
  vpc_security_group_ids = [aws_security_group.ap_southeast_2_security_group.id]
  subnet_id              = aws_subnet.subnet_ap_southeast_2.id
  monitoring             = false

  tags = {
    Name = "ap_southeast_2_client"
  }
}

