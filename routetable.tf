# route table ---

resource "aws_route_table" "public_route_table" {
	vpc_id  =  "${aws_vpc.my_vpc.id}"
	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = "${aws_internet_gateway.my_igw.id}"
	}
	tags = {
	Name = "public_route_table"
	}
	depends_on = ["aws_vpc.my_vpc","aws_internet_gateway.my_igw"]
}

#---- route table associateion for public ---------------

resource "aws_route_table_association" "public" {
	subnet_id = "${aws_subnet.mypublicsubnet.id}"
	route_table_id = "${aws_route_table.public_route_table.id}"
}

# --- private route tabel ---


resource "aws_route_table" "private_route_table" {
	vpc_id  =  "${aws_vpc.my_vpc.id}"
	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = "${aws_nat_gateway.mynatgateway.id}"
	}
	tags = {
	Name = "private_route_table"
	}
	depends_on = ["aws_vpc.my_vpc", "aws_nat_gateway.mynatgateway"]
}

#---- route table associateion for private  ---------------

resource "aws_route_table_association" "private" {
	subnet_id = "${aws_subnet.myprivatesubnet.id}"
	route_table_id = "${aws_route_table.private_route_table.id}"
}