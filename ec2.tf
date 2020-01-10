resource "aws_instance" "instance_1" {
    ami = "ami-02ccb28830b645a41"
    instance_type = "t2.micro"
    tags = {
        Name = "instance_1"
    }
    availability_zone = "use-east-2a"
    security_groups = "${aws_security_group.allow_http_ssh.id}"
    user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install -y httpd
                systemctl start httpd.service
                systemctl enable httpd.service
                echo "Hello from server1" > /var/www/html/index.html
                EOF
}


resource "aws_instance" "instance_12" {
    ami = "ami-02ccb28830b645a41"
    instance_type = "t2.micro"
    tags = {
        Name = "instance_2"
    }
    availability_zone = "use-east-2b"
    security_groups = "${aws_security_group.allow_http_ssh.id}"
    user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install -y httpd
                systemctl start httpd.service
                systemctl enable httpd.service
                echo "Hello from server2" > /var/www/html/index.html
                EOF
}