resource "aws_instance" "installer" {
    ami           = "ami-0cd59ecaf368e5ccf"
    instance_type = "t2.medium" # recommended t3, however i'm broke
    key_name="your key name"
    user_data = "${data.template_file.start.rendered}"
    associate_public_ip_address = true
    tags = {
        Name = "installer"
    }
}

resource "aws_network_interface_sg_attachment" "installer" {
    security_group_id    = "${aws_security_group.sec_group.id}"
    network_interface_id = "${aws_instance.installer.primary_network_interface_id}"
}