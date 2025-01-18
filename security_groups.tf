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

resource "aws_vpc_security_group_ingress_rule" "port_2397_80" {
    security_group_id = aws_security_group.vpc_sg.id
    from_port = 2379
    to_port = 2380
    ip_protocol = "tcp"
    cidr_ipv4 = "10.0.1.0/24"
}

resource "aws_vpc_security_group_ingress_rule" "port_6443" {
    security_group_id = aws_security_group.vpc_sg.id
    from_port = 6443
    to_port = 6443
    ip_protocol = "tcp"
    cidr_ipv4 = "10.0.1.0/24"
}

resource "aws_vpc_security_group_ingress_rule" "port_10250_60" {
    security_group_id = aws_security_group.vpc_sg.id
    from_port = 10250
    to_port = 10260
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