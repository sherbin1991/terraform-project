
# Creating security group for MySQL, this will allow access only from the instances having the security group created above.
resource "aws_security_group" "Ansible_Tomcat-SG" {

  depends_on = [
    aws_vpc.custom,
    aws_subnet.subnet1,
    aws_subnet.subnet2,
    aws_security_group.WS-SG
  ]

  description = "Tomcat Access only from the Webserver Instances!"
  name = "Ansible_Tomcat-sg"
  vpc_id = aws_vpc.custom.id

  # Created an inbound rule for MySQL
  ingress {
    description = "Tomcat Access"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    security_groups = [aws_security_group.WS-SG.id]
  }

  # Created an inbound rule for SSH
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.WS-SG.id]
  }

  egress {
    description = "output from MySQL"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}