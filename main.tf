terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 4.0"
        }
    }
    backend "s3" {
        bucket = "hostcode-terraform-backend" 
        key    = "terraform.tfstate"
        region = "ap-south-1" 
        encrypt = true 
  }
}

provider "aws" {
}

resource "aws_key_pair" "key" {
    key_name = "terraform-key"
    public_key = file("terr_aws_key.pub")
}

resource "aws_instance" "kube_slave" {
    count = 2
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = aws_key_pair.key.key_name
    vpc_security_group_ids = [aws_security_group.vpc_sg.id]
    subnet_id = aws_subnet.instance_subnet.id 
    private_ip = var.rem_private_ips[count.index]
    associate_public_ip_address = true
    user_data = file("ec2-setup.sh")

    ebs_block_device {
      device_name = "/dev/xvde"
      delete_on_termination = true
      volume_size = 10
    }

    tags = {
        Name = var.rem_instance_names[count.index]
    }
} 

resource "aws_instance" "kube_master" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = aws_key_pair.key.key_name
    vpc_security_group_ids = [aws_security_group.vpc_sg.id]
    subnet_id = aws_subnet.instance_subnet.id
    private_ip = var.master_private_ip
    user_data = file("ec2-setup.sh")
    associate_public_ip_address = true 

    ebs_block_device {
      device_name = "/dev/xvde"
      delete_on_termination = true
      volume_size = 10
    }

    tags = {
        Name = var.master_instance_name
    }
}