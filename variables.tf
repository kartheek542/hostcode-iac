variable "aws_region" {
    description = "Region in which AWS resources are provisioned"
    type = string
    default = "ap-south-1"
}

variable "ami_id" {
    description = "AMI id of the image"
    type = string 
    default = "ami-053b12d3152c0cc71" # Ubuntu Server 24.04 LTS
}

variable "instance_type" {
    description = "Type of the instance"
    type = string
    default = "t2.micro"
}

variable "az" {
    description = "Availability Zone of the subnet"
    type = string
    default = "ap-south-1a"
}

variable "master_instance_name" {
    description = "Name of the master instance"
    type = string 
    default = "kube-master"
}

variable "nodejs_instance_name" {
    description = "Name of the node instance"
    type = string 
    default = "hostcode-nodejs"
}

variable "reactjs_instance_name" {
    description = "Name of the react instance"
    type = string 
    default = "hostcode-reactjs"
}

variable "rem_instance_names" {
    description = "Name of the remaining instances"
    type = list(string)
    default = [ "kube-slave-1", "kube-slave-2", "kube-slave-3", "kube-slave-4" ]
}

variable "master_private_ip" {
    description = "Private IP of the master instance"
    type = string
    default = "10.0.1.10"
}

variable "nodejs_private_ip" {
    description = "Private IP of the nodejs instance"
    type = string
    default = "10.0.1.14"
}

variable "reactjs_private_ip" {
    description = "Private IP of the reactjs instance"
    type = string
    default = "10.0.1.13"
}

variable "rem_private_ips" {
    description = "Private IPs of remaining instances"
    type = list(string)
    default = [ "10.0.1.11", "10.0.1.12" ]
}