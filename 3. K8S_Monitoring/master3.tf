resource "aws_instance" "master3" {
    ami           = "ami-0cd59ecaf368e5ccf"
    instance_type = "t2.medium" # recommended t3, however i'm broke
    key_name="your_key_name"
    user_data = <<-EOT
    ${data.template_file.start.rendered}

    sudo hostnamectl set-hostname master3
    EOT
    associate_public_ip_address = true
    tags = {
        Name = "master3"
    }
}

resource "aws_network_interface_sg_attachment" "master3" {
    security_group_id    = "${aws_security_group.sec_group.id}"
    network_interface_id = "${aws_instance.master3.primary_network_interface_id}"
}