resource "aws_instance" "master" {
    ami           = "ami-0cd59ecaf368e5ccf"
    instance_type = "t2.medium" # recommended t3, however i'm broke
    key_name="your key name"
    user_data = "${data.template_file.start.rendered}"
    associate_public_ip_address = true
    tags = {
        Name = "master"
    }
}

resource "aws_network_interface_sg_attachment" "master" {
    security_group_id    = "${aws_security_group.sec_group.id}"
    network_interface_id = "${aws_instance.master.primary_network_interface_id}"
}