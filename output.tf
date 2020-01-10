output "lb_dns" {
    value = "${aws_lb.my_alb.dns}"
}


output "ip1" {
    value = "${aws_instance.instance_1.public_ip}"
}

output "ip2" {
    value = "${aws_instance.instance_2.public_ip}"
}