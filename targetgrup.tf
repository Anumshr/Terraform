resource "aws_lb_target_group" "target1" {
    name = "target1"
    port = 80
    protocol = "HTTP"
    vpc_id = "vpc-8b02f7e0"
    tags = {
        Name = "target1"
    }
}

resource "aws_lb_target_group_attachment" "attachment1" {
    target_group_arn = "${aws_lb_target_group.target1.arn}"
    target_id = "aws_instance.instance_1.id"
    port = 80
}


resource "aws_lb_target_group" "target2" {
    name = "target2"
    port = 80
    protocol = "HTTP"
    vpc_id = "vpc-8b02f7e0"
    tags = {
        Name = "target2"
    }
}


resource "aws_lb_target_group_attachment" "attachment2" {
    target_group_arn = "${aws_lb_target_group.target2.arn}"
    target_id = "aws_instance.instance_2.id"
    port = 80
}


