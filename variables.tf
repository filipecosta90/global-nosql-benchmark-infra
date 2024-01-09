variable "eu_west_3_region" {
  type    = string
  default = "eu-west-3"
}

variable "us_west_1_region" {
  type    = string
  default = "us-west-1"
}

variable "eu_west_3_vpc_cidr_block" {
  description = "VPC Cidr Block"
  default     = "99.0.0.0/16"
}

variable "eu_west_3_subnet_cidr_block" {
  description = "eu_west_3 Subnet Cidr Block"
  default     = "99.0.5.0/24"
}


variable "us_west_1_vpc_cidr_block" {
  description = "Peer VPC Cidr Block"
  default     = "99.1.0.0/16"
}

variable "us_west_1_subnet_cidr_block" {
  description = "us_west_1 Subnet Cidr Block"
  default     = "99.1.5.0/24"
}



variable "sa_east_1_vpc_cidr_block" {
  description = "Peer VPC Cidr Block"
  default     = "99.2.0.0/16"
}

variable "sa_east_1_subnet_cidr_block" {
  description = "sa_east_1 Subnet Cidr Block"
  default     = "99.2.10.0/24"
}


variable "us_west_1_availability_zone" {
  description = "az"
  default     = "us-west-1a"
}

variable "eu_west_3_availability_zone" {
  description = "az"
  default     = "eu-west-3a"
}

variable "sa_east_1_availability_zone" {
  description = "az"
  default     = "sa-east-1a"
}


variable "instance_type" {
  type    = string
  default = "t2.micro"
}

# us-west-1 Jammy Jellyfish	22.04 LTS 20231207
variable "ami_id_us_west_1" {
  type    = string
  default = "ami-0ce2cb35386fc22e9"
}

# eu-west-3 Jammy Jellyfish	22.04 LTS 20231207
variable "ami_id_eu_west_3" {
  type    = string
  default = "ami-01d21b7be69801c2f"
}

# sa-east-1 Jammy Jellyfish	22.04 LTS 20231207
variable "ami_id_sa_east_1" {
  type    = string
  default = "ami-0fb4cf3a99aa89f72"
}

# af-south-1 Jammy Jellyfish	22.04 LTS 20231207
variable "ami_id_af_south_1" {
  type    = string
  default = "ami-0e878fcddf2937686"
}

# ap-northeast-1 Jammy Jellyfish	22.04 LTS 20231207
variable "ami_id_ap_northeast_1" {
  type    = string
  default = "ami-07c589821f2b353aa"
}


variable "ami_key_pair_name_eu_west_3" {
  type    = string
  default = "perf-eu-west-3"
}


variable "ami_key_pair_name_us_west_1" {
  type    = string
  default = "perf-us-west-1"
}

variable "ami_key_pair_name_sa_east_1" {
  type    = string
  default = "perf-sa-east-1"
}
