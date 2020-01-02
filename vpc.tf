# -------resource vpc creation ------------------
resource "aws_vpc" "my_vpc"{

	cidr_block = "10.0.0.0/26"
	instance_tenancy = "default"
	tags = {
	 Name = "My_vpc"
	}
	enable_dns_hostnames = true
}

# rsource creation of security group -------------------

resource "aws_security_group" "SG1"{
	name = "my_sg1"
	description = "allow http and ssh traffc"
	vpc_id = " ${aws_vpc.my_vpc.id}"
	ingress {
	from_port = 80
	to_port = 80
	protocol = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
	}

	ingress {
	from_port = 22
	to_port = 22
	protocol = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
	}
    
    
    depends_on = ["aws_vpc.my_vpc"]
}

# --- recource internet gteway ----

resource "aws_internet_gateway" "my_igw" {
	vpc_id = "${aws_vpc.my_vpc.id}"
	tags = {
	Name = "my_igw"
	}
	depends_on = ["aws_vpc.my_vpc"]
}

# ---------- resource nat gateway _---------

resource "aws_nat_gateway" "mynatgateway"{
	allocation_id ="${aws_eip.eip.id}"
	subnet_id = "${aws_subnet.mypublicsubnet.id}"

	depends_on = ["aws_eip.eip","aws_subnet.mypublicsubnet"]
}


#-------------Elastic IP for nat gateway -----------

resource "aws_eip" "eip" {
	vpc = true 
	tags = {
	Name = "eip"
	}

}