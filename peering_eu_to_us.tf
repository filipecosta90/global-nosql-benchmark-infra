# Create VPC peering connection between both vpcs in different regions in the eu_west_3 Region
resource "aws_vpc_peering_connection" "eu_west_3" {
  provider    = aws.eu_west_3
  vpc_id      = aws_vpc.eu_west_3_vpc.id
  peer_vpc_id = aws_vpc.us_west_1_vpc.id
  peer_region = var.us_west_1_region
  #auto_accept = false

  tags = {
    Name = "peer_to_us_west_1"
  }

  depends_on = [
    aws_vpc.eu_west_3_vpc,
    aws_vpc.us_west_1_vpc
  ]
}

# Create VPC peering connection between VPC Peering in the eu_west_3 Region and the peering in the us_west_1 Region
resource "aws_vpc_peering_connection_accepter" "eu_west_3" {
  provider                  = aws.us_west_1
  vpc_peering_connection_id = aws_vpc_peering_connection.eu_west_3.id
  auto_accept               = true

  tags = {
    Name = "peer_to_eu_west_3"
  }

  depends_on = [
    aws_vpc.eu_west_3_vpc,
    aws_vpc.us_west_1_vpc
  ]
}
