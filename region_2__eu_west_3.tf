# Create VPC for eu_west_3
resource "aws_vpc" "eu_west_3_vpc" {
  cidr_block = var.eu_west_3_vpc_cidr_block
  provider   = aws.eu_west_3
  #  enable_dns_hostnames = true
  tags = {
    Name = "eu_west_3_vpc"
  }
}

# Create Internet Gateway for eu_west_3
resource "aws_internet_gateway" "eu_west_3-igw" {
  vpc_id   = aws_vpc.eu_west_3_vpc.id
  provider = aws.eu_west_3
  tags = {
    Name = "eu_west_3-igw"
  }
}

# Create Route Table for eu_west_3
resource "aws_route_table" "route_table_eu_west_3" {
  vpc_id   = aws_vpc.eu_west_3_vpc.id
  provider = aws.eu_west_3

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eu_west_3-igw.id
  }

  route {
    cidr_block                = var.us_west_1_subnet_cidr_block
    vpc_peering_connection_id = aws_vpc_peering_connection.eu_west_3.id
  }
}


# Create Subnet for eu_west_3
resource "aws_subnet" "subnet_eu_west_3" {
  provider                = aws.eu_west_3
  vpc_id                  = aws_vpc.eu_west_3_vpc.id
  cidr_block              = var.eu_west_3_subnet_cidr_block
  map_public_ip_on_launch = true # This makes public subnet
  availability_zone       = var.eu_west_3_availability_zone
  tags = {
    Name = "eu_west_3-subnet"
  }
}

# Associate eu_west_3 Subnet to eu_west_3 Route Table
resource "aws_route_table_association" "route_table_eu_west_3" {
  provider       = aws.eu_west_3
  subnet_id      = aws_subnet.subnet_eu_west_3.id
  route_table_id = aws_route_table.route_table_eu_west_3.id
}


resource "aws_instance" "eu_west_3_db" {
  provider      = aws.eu_west_3
  ami           = var.ami_id_eu_west_3
  instance_type = var.instance_type
  # This is an existing key pair that has already been created in the specified region
  key_name               = var.ami_key_pair_name_eu_west_3
  vpc_security_group_ids = [aws_security_group.eu_west_3_security_group.id]
  subnet_id              = aws_subnet.subnet_eu_west_3.id
  monitoring             = false

  tags = {
    Name = "eu_west_3_db"
  }
}


resource "aws_instance" "eu_west_3_client" {
  provider      = aws.eu_west_3
  ami           = var.ami_id_eu_west_3
  instance_type = var.instance_type
  # This is an existing key pair that has already been created in the specified region
  key_name               = var.ami_key_pair_name_eu_west_3
  vpc_security_group_ids = [aws_security_group.eu_west_3_security_group.id]
  subnet_id              = aws_subnet.subnet_eu_west_3.id
  monitoring             = false

  tags = {
    Name = "eu_west_3_client"
  }
}

