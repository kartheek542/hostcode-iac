resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = "Main VPC"
    }
}

resource "aws_subnet" "instance_subnet" {
    vpc_id = aws_vpc.main.id 
    cidr_block = "10.0.1.0/24"
    availability_zone = var.az

    tags = {
        Name = "Main subnet"
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id 

    tags = {
        Name = "VPC IG"
    }
}

resource "aws_route_table" "rt" {
    vpc_id = aws_vpc.main.id 

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
        Name = "Route for Internet Access"
    }
}

resource "aws_route_table_association" "route_subnet_asso" {
    subnet_id = aws_subnet.instance_subnet.id
    route_table_id = aws_route_table.rt.id
}