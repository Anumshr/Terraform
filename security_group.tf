resource "aws_security_group" "allow_http_ssh" {
    name = "allow_http_ssh"
    description = " allow ssh and http traffic"
    vpc_id = "vpc-8b02f7e0"

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

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        }
}

resource "aws_security_group" "loadbalancer_sg" {
    name = "allow_http"
    desctription = "allow http traffic to and from the load balancer"
    vpc_id = "vpc-8b02f7e0"

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

     egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        }

}