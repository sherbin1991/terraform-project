# terraform-project
Terraform Project for creating a custom VPC with 2 Subnets and application installed

git clone https://github.com/sherbin1991/terraform-project.git
terraform validate
terraform plan
terraform apply

This will create an Infrasturcture with a custom VPC with a Public and Private subnet. Jenkins and Ansible are installed using User-data at the time of server provision itself. There is a NAT gateway on Public Subnet which makes the instance on private subnet to communicate for performng updates. Also there is an Internet Gateway which allows communication between VPC and Internet.
