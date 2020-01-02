#----- public subnet -----

resource "aws_subnet" "mypublicsubnet" {
	vpc_id = "${aws_vpc.my_vpc.id}"
	cidr_block = "10.0.0.0/28"
	tags = {
	Name = "mypublicsubnet"
	}
	availability_zone = "us-east-1a"
	map_public_ip_on_launch = true


	depends_on = [aws_vpc.my_vpc]

}	

# -------- private subnet --------------

resource "aws_subnet" "myprivatesubnet" {
	vpc_id = "${aws_vpc.my_vpc.id}"
	cidr_block = "10.0.0.16/28"
	tags = {
	Name = "myprivatesubnet"
	}
	availability_zone = "us-east-1b"
	depends_on = [aws_vpc.my_vpc]
}