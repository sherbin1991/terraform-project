# Creating an AWS instance for the Tomcat! It should be launched in the private subnet!
resource "aws_instance" "Tomcat" {
  depends_on = [
    aws_instance.webserver,
  ]

  # Using my custom Private AMI which has most of the things configured for Webserver
  ami = "ami-00826bd51e68b1487"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet2.id

  # Keyname and security group are obtained from the reference of their instances created above!
  key_name = "MyKeyFinal"

  # Attaching 2 security groups here, 1 for the Tomcat Database access by the Web-servers,
  # & other one for the Public Host access for applying updates & patches!
  vpc_security_group_ids = [aws_security_group.Ansible_Tomcat-SG.id, aws_security_group.WS-SG.id]

  tags = {
   Name = "Tomcat_From_Terraform"
  }
}