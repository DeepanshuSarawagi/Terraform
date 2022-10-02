# Create VPC
resource "aws_vpc" "vpc-dev" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "vpc-dev-us-east-1"
  }
}

#Create public subnet in vpc-dev
resource "aws_subnet" "vpc-dev-public-subnet-1" {
  vpc_id = aws_vpc.vpc-dev.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "vpc-dev-public-subnet-1"
  }
}

# Create the internet gateway and attach it to vpc-dev
resource "aws_internet_gateway" "vpc-dev-igw" {
  vpc_id = aws_vpc.vpc-dev.id
  tags = {
    Name = "vpc-dev-igw"
  }
}

# Create a route table for VPC
resource "aws_route_table" "vpc-dev-public-route-table" {
  vpc_id = aws_vpc.vpc-dev.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc-dev-igw.id
  }

  tags = {
    Name = "vpc-dev-public-route-table"
  }
}

# Associate route table with public subnet
resource "aws_route_table_association" "vpc-dev-route-table-associate" {
  route_table_id = aws_route_table.vpc-dev-public-route-table.id
  subnet_id = aws_subnet.vpc-dev-public-subnet-1.id
}

# Create security group in VPC
resource "aws_security_group" "vpc-dev-sg-east-1" {
  name = "vpc-dev-sg-east-1"
  description = "Allow SSH and HTTP access from internet"
  vpc_id = aws_vpc.vpc-dev.id

  ingress {
    from_port = 22
    protocol  = "tcp"
    to_port   = 22
    description = "SSH access from internet"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    protocol  = "tcp"
    to_port   = 80
    description = "HTTP access from internet"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    protocol  = "-1"
    to_port   = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "vpc-dev-sg-east-1"
  }
}