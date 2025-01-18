output "kube_master_public_ip" {
    description = "Public IPs of master instance"
    value = aws_instance.kube_master.public_ip
}

output "kube_slave_public_ip" {
    description = "Public IP's of EC2 instances"
    value = aws_instance.kube_slave[*].public_ip
}

# output "reactjs_public_ip" {
#     description = "Public IPs of reactjs instance"
#     value = aws_instance.reactjs_server.public_ip
# }
# 
# output "nodejs_public_ip" {
#     description = "Public IPs of nodejs instance"
#     value = aws_instance.nodejs_server.public_ip
# }