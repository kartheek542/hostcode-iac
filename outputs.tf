output "kube_master_instance_public_ip" {
    description = "Public IPs of master instance"
    value = aws_instance.kube_master.public_ip
}

# output "kube_slave_instance_public_ip" {
#     description = "Public IP's of EC2 instances"
#     value = aws_instance.kube_slave[*].public_ip
# }