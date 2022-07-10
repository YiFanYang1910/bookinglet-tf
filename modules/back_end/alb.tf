resource "aws_alb" "bookinglet_alb" {
    name = "bookinglet-alb"
    subnets = aws_subnet.bookinglet_subnet_public.*.id
    security_groups = [aws_security_group.bookinglet_secgroup_alb.id]
}

resource "aws_alb_target_group" "bookinglet_target_group" {
    name = "bookinglet-target-group"
    target_type = "ip"
    port = 80
    #Port on which targets receive traffic, unless overridden when registering a specific target
    #dont need if type is lambda
    protocol = "HTTP"
    #protocol to routing traffic to the target, one of the Geneve, HTTP,HTTPS,TCP,TCP_UDP,TLS or UDP
    #dont need if type is lambda
    vpc_id = aws_vpc.bookinglet_vpc.id
    #identifier of the VPC in which to create the target_group
    #dont need if type is lambda
}

resource "aws_alb_listener" "bookinglet_alb_listener" {
    load_balancer_arn = aws_alb.bookinglet_alb.id
    port = 80
    protocol = "HTTP"
    

    default_action {
        target_group_arn =aws_alb_target_group.bookinglet_target_group.id
        type = "forward"
    }
  #defines the load balancer itself and attaches it to the public subnet in each availability zone with the load balancer security group. 
  #The target group, when added to the load balancer listener tells the load balancer to forward incoming traffic on port 80 to wherever the load balancer is attached. 
}