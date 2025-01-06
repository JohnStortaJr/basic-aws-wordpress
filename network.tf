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
  Create subnets
*/
// Collect list of all availability zones in this region
data "aws_availability_zones" "available" {}

// Create one public subnet in the first 2 AZs
// NOTE, this code works for us-east-1 where there are 6 AZs
// In other regions, you will want to adjust the count accordingly
resource "aws_subnet" "basic-aws-wordpress-subnet-pub1" {
  count = "${length(data.aws_availability_zones.available.names)/3}"
  vpc_id = "${aws_vpc.basic-aws-wordpress-vpc.id}"
  cidr_block = "10.0.${10+count.index}.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  
  tags = {
    Name = "Basic WordPress Public Subnet ${count.index}"
  }
}

// Create one private subnet in the first 2 AZs
resource "aws_subnet" "basic-aws-wordpress-subnet-pri1" {
  count = "${length(data.aws_availability_zones.available.names)/3}"
  vpc_id = "${aws_vpc.basic-aws-wordpress-vpc.id}"
  cidr_block = "10.0.${20+count.index}.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  
  tags = {
    Name = "Basic WordPress Private Subnet ${count.index}"
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

# Associate the route table to the public subnets
resource "aws_route_table_association" "basic-aws-wordpress-route-association" {
  count = "${length(data.aws_availability_zones.available.names)}"
  subnet_id = "${element(aws_subnet.basic-aws-wordpress-subnet-pub1.*.id, count.index)}"
  route_table_id = "${aws_route_table.basic-aws-wordpress-route-table.id}"
}