# Creating a VPC!
resource "aws_vpc" "custom" {
  
  # IP Range for the VPC
  cidr_block = "172.20.0.0/16"
  
  # Enabling automatic hostname assigning
  enable_dns_hostnames = true
  tags = {
    Name = "custom"
  }
}