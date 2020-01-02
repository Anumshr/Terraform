resource "aws_instance" "instance_public" {
  ami = "ami-0b898040803850657"
  instance_type = "t2.micro"
  tags = {
      Name = "instance_public"
  }
  key_name = "keypairnvirginia"
  vpc_security_group_ids = ["${aws_security_group.SG1.id}"]
  subnet_id = "${aws_subnet.mypublicsubnet.id}"
  
  depends_on = ["aws_subnet.mypublicsubnet","aws_security_group.SG1","aws_vpc.my_vpc"]
}


resource "aws_instance" "instance_private" {
  ami = "ami-0b898040803850657"
  instance_type = "t2.micro"
  tags = {
      Name = "instance_private"
  }
  key_name = "keypairnvirginia"
  vpc_security_group_ids = ["${aws_security_group.SG1.id}"]
  subnet_id = "${aws_subnet.myprivatesubnet.id}"
  
  depends_on = ["aws_subnet.myprivatesubnet","aws_security_group.SG1","aws_vpc.my_vpc"]
}


