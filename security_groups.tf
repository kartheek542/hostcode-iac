resource "aws_security_group" "vpc_sg" {
    name = "vpc-ssh"
    description = "VPC for ssh"
    vpc_id = aws_vpc.main.id
}

resource "aws_vpc_security_group_ingress_rule" "ports_with_80" {
    security_group_id = aws_security_group.vpc_sg.id
    from_port = 8080
    to_port = 8085
    ip_protocol = "tcp"
    cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "port_22" {
    security_group_id = aws_security_group.vpc_sg.id
    from_port = 22
    to_port = 22
    ip_protocol = "tcp"
    cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "port_2377" {
    security_group_id = aws_security_group.vpc_sg.id
    from_port = 2377
    to_port = 2377
    ip_protocol = "tcp"
    cidr_ipv4 = "10.0.1.0/24"
}

resource "aws_vpc_security_group_ingress_rule" "port_7946" {
    security_group_id = aws_security_group.vpc_sg.id
    from_port = 7946
    to_port = 7946
    ip_protocol = "tcp"
    cidr_ipv4 = "10.0.1.0/24"
}

resource "aws_vpc_security_group_ingress_rule" "port_4789" {
    security_group_id = aws_security_group.vpc_sg.id
    from_port = 4789
    to_port = 4789
    ip_protocol = "tcp"
    cidr_ipv4 = "10.0.1.0/24"
}

resource "aws_vpc_security_group_ingress_rule" "port_9200" {
    security_group_id = aws_security_group.vpc_sg.id
    from_port = 9200
    to_port = 9200
    ip_protocol = "tcp"
    cidr_ipv4 = "10.0.1.0/24"
}

resource "aws_vpc_security_group_ingress_rule" "port_8228" {
    security_group_id = aws_security_group.vpc_sg.id
    from_port = 8288
    to_port = 8288
    ip_protocol = "tcp"
    cidr_ipv4 = "10.0.1.0/24"
}

resource "aws_vpc_security_group_ingress_rule" "port_5432" {
    security_group_id = aws_security_group.vpc_sg.id
    from_port = 5432
    to_port = 5432
    ip_protocol = "tcp"
    cidr_ipv4 = "10.0.1.0/24"
}

resource "aws_vpc_security_group_egress_rule" "outgoing" {
  security_group_id = aws_security_group.vpc_sg.id
  from_port   = 0
  to_port     = 0
  ip_protocol = "-1"
  cidr_ipv4   = "0.0.0.0/0"
}