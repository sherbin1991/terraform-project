# Creating an AWS instance for the Webserver!
resource "aws_instance" "webserver" {
  
  # AMI ID [I have used my custom AMI which has some softwares pre installed]
  ami = "ami-00826bd51e68b1487"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet1.id

  # Keyname and security group are obtained from the reference of their instances created above!
  # Here I am providing the name of the key which is already uploaded on the AWS console.
  key_name = "MyKeyFinal"
  
  # Security groups to use!
  vpc_security_group_ids = [aws_security_group.WS-SG.id] 

  tags = {  
   Name = "Webserver_From_Terraform"
  }
  user_data = file("provision.sh")
}