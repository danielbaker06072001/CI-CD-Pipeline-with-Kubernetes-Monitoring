# ? Since rancher only provide UI, we only need to install docker and run the rancher container
resource "aws_instance" "rancher" {
    ami           = "ami-0cd59ecaf368e5ccf"
    instance_type = "t2.medium" # recommended t3, however i'm broke
    key_name="your_key_name"
    user_data = <<-EOL
    #!/bin/bash
    sudo apt update 
    sudo apt install docker.io -y
    sudo apt install openjdk-11-jdk-headless -y
    sudo docker run -d --restart=unless-stopped -p 80:80 -p 443:443 --privileged rancher/rancher:latest
    EOL
    associate_public_ip_address = true
    tags = {
        Name = "rancher"
    }
}

resource "aws_network_interface_sg_attachment" "rancher" {
    security_group_id    = "${aws_security_group.sec_group.id}"
    network_interface_id = "${aws_instance.rancher.primary_network_interface_id}"
}