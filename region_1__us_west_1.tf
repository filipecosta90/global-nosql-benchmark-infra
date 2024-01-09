# Create VPC for us_west_1
resource "aws_vpc" "us_west_1_vpc" {
  cidr_block = var.us_west_1_vpc_cidr_block
  provider   = aws.us_west_1
  #  enable_dns_hostnames = true
  tags = {
    Name = "us_west_1_vpc"
  }
}

# Create Internet Gateway for eu_west_3
resource "aws_internet_gateway" "us_west_1-igw" {
  vpc_id   = aws_vpc.us_west_1_vpc.id
  provider = aws.us_west_1
  tags = {
    Name = "eu_west_3-igw"
  }
}

# Create Route Table for us_west_1
resource "aws_route_table" "route_table_us_west_1" {
  vpc_id   = aws_vpc.us_west_1_vpc.id
  provider = aws.us_west_1


  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.us_west_1-igw.id
  }


  route {
    cidr_block                = var.eu_west_3_subnet_cidr_block
    vpc_peering_connection_id = aws_vpc_peering_connection.eu_west_3.id
  }

  route {
    cidr_block                = var.sa_east_1_subnet_cidr_block
    vpc_peering_connection_id = aws_vpc_peering_connection.sa_east_1.id
  }

  route {
    cidr_block                = var.ap_south_1_subnet_cidr_block
    vpc_peering_connection_id = aws_vpc_peering_connection.ap_south_1.id
  }
}


# Create Subnet for us_west_1
resource "aws_subnet" "subnet_us_west_1" {
  provider                = aws.us_west_1
  vpc_id                  = aws_vpc.us_west_1_vpc.id
  cidr_block              = var.us_west_1_subnet_cidr_block
  map_public_ip_on_launch = true
  availability_zone       = var.us_west_1_availability_zone
  tags = {
    Name = "us_west_1-subnet"
  }
}

# Associate us_west_1 Subnet to us_west_1 Route Table
resource "aws_route_table_association" "route_table_us_west_1" {
  provider       = aws.us_west_1
  subnet_id      = aws_subnet.subnet_us_west_1.id
  route_table_id = aws_route_table.route_table_us_west_1.id
}

resource "aws_instance" "us_west_1_db" {
  provider      = aws.us_west_1
  ami           = var.ami_id_us_west_1
  instance_type = var.instance_type
  # This is an existing key pair that has already been created in the specified region
  key_name               = var.ami_key_pair_name_us_west_1
  vpc_security_group_ids = [aws_security_group.us_west_1_security_group.id]
  subnet_id              = aws_subnet.subnet_us_west_1.id
  monitoring             = false

  tags = {
    Name = "us_west_1_db"
  }
}


resource "aws_instance" "us_west_1_client" {
  provider      = aws.us_west_1
  ami           = var.ami_id_us_west_1
  instance_type = var.instance_type
  # This is an existing key pair that has already been created in the specified region
  key_name               = var.ami_key_pair_name_us_west_1
  vpc_security_group_ids = [aws_security_group.us_west_1_security_group.id]
  subnet_id              = aws_subnet.subnet_us_west_1.id
  monitoring             = false

  tags = {
    Name = "us_west_1_client"
  }
}

