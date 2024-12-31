resource "aws_instance" "worker1" {
    ami           = "ami-0cd59ecaf368e5ccf"
    instance_type = "t2.medium" # recommended t3, however i'm broke
    key_name="your key name"
    user_data = "${data.template_file.start.rendered}"
    associate_public_ip_address = true
    tags = {
        Name = "worker1"
    }
}

resource "aws_network_interface_sg_attachment" "worker1" {
    security_group_id    = "${aws_security_group.sec_group.id}"
    network_interface_id = "${aws_instance.worker1.primary_network_interface_id}"
}