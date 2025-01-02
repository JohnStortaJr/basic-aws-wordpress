/*
  Create the Virtual Private Cloud (VPC), Subnets,
  Internet Gateway, and Route Table that will be used
  for this environment.
*/


/*
  This is a basic VPC that will use IPs in the 10.0.x.x range
  Enabling DNS hostnames will provide Public IPv4 DNS names for 
  any EC2 instances created within the VPC
*/
resource "aws_vpc" "basic-aws-wordpress-vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = "true"

  tags = {
    Name = "Basic Wordpress VPC"
  }
}

/*
  Create a publicly accessible subnet
*/
resource "aws_subnet" "basic-aws-wordpress-subnet-pub1" {
  vpc_id = "${aws_vpc.basic-aws-wordpress-vpc.id}"
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Basic WordPress Public Subnet 1"
  }
}

/*
  Create an internet gateway and attach it to VPC in one step
*/
resource "aws_internet_gateway" "basic-aws-wordpress-igateway" {
  vpc_id = "${aws_vpc.basic-aws-wordpress-vpc.id}"

  tags = {
    Name = "Basic WordPress Internet Gateway"
  }
}

/*
  Create a route table and defines a route that directs
  all outbound traffic to the internet gateway
*/
resource "aws_route_table" "basic-aws-wordpress-route-table" {
  vpc_id = "${aws_vpc.basic-aws-wordpress-vpc.id}"

  route {
    cidr_block = "10.0.0.0/16"
    gateway_id = "local"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.basic-aws-wordpress-igateway.id}"
  }

  tags = {
    Name = "Basic WordPress Route Table"
  }
}

resource "aws_route_table_association" "basic-aws-wordpress-route-association" {
  subnet_id = "${aws_subnet.basic-aws-wordpress-subnet-pub1.id}"
  route_table_id = "${aws_route_table.basic-aws-wordpress-route-table.id}"
}