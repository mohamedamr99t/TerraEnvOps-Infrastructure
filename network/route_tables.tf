#Public Route Table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "public_route_table"
  }
}

# Allocate EIP
resource "aws_eip" "nat_eip" {
  domain = "vpc" 
}

# Create public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.public_subnet_cidr_block[0]
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zones[0]
} 

resource "aws_subnet" "public_subnet2" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.public_subnet_cidr_block[1]
  map_public_ip_on_launch = true 
  availability_zone       = var.availability_zones[1]
}

# Create NAT Gateway 
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet.id
}

#Create Private Route Table
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name = "private"
  }
}

# Create a private subnet within the VPC
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.private_subnet_cidr_block[0]
  availability_zone       = var.availability_zones[0]
}

resource "aws_subnet" "private_subnet2" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.private_subnet_cidr_block[1]
  availability_zone       = var.availability_zones[1]
}

# Associate the private subnet with the private route table
resource "aws_route_table_association" "private_subnet" {
  subnet_id      = aws_subnet.private_subnet.id # ID of the private subnet
  route_table_id = aws_route_table.private_route_table.id # ID of the private route table
}

#Attach the public route table with the public subnet 
resource "aws_route_table_association" "public_subnet" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

# Associate the private subnet with the private route table
resource "aws_route_table_association" "private_subnet2" {
  subnet_id      = aws_subnet.private_subnet2.id # ID of the private subnet
  route_table_id = aws_route_table.private_route_table.id # ID of the private route table
}

#Attach the public route table with the public subnet 
resource "aws_route_table_association" "public_subnet2" {
  subnet_id      = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.public_route_table.id
}
