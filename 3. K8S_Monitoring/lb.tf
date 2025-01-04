resource "aws_instance" "lb" {
    ami           = "ami-0cd59ecaf368e5ccf"
    instance_type = "t2.medium" # recommended t3, however i'm broke
    key_name="your_key_name"
    user_data = <<-EOT
    #!/bin/bash
    sudo apt update
    sudo hostnamectl  set-hostname loadbalancer
    sudo apt install -y nginx
    sudo systemctl enable nginx 
    sudo apt install net-tools -y
    EOT
    associate_public_ip_address = true
    tags = {
        Name = "lb"
    }
}

resource "aws_network_interface_sg_attachment" "lb" {
    security_group_id    = "${aws_security_group.sec_group.id}"
    network_interface_id = "${aws_instance.lb.primary_network_interface_id}"
}