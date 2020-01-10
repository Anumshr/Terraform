resource "aws_lb" "my_alb" {
    name = "my_alb"
    internal = false
    load_balancer_type = "application"
    security_groups = "${aws_security_group.loadbalancer_sg.id}"
    subnets = ["subnet-12105a68","subnet-359a2879"]

}

resource "aws_lb_listener" "listerner1" {
    load_balancer_arn = "${aws_lb.my_alb.arn}"
    port = 80
    protocol = "HTTP"
    default_action {
        type = "forward"
        target_group_arn = "${aws_lb_target_group.target1.arn}"
    }
}