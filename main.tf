provider "aws" {
    region = "us-west-1"
}

resource "aws_instance" "example" {
    ami = "ami-0da424eb883458071"
    instance_type = "t2.micro"

    vpc_security_group_ids = [aws_security_group.instance.id]

    user_data = <<-EOF
                #!/bin/bash
                echo "Hello, World" > index.html
                nohup busybox httpd -f -p 8080 &
                EOF
    user_data_replace_on_change = true

    tags = {
        Name = "my-ubuntu"
    }
}

resource "aws_security_group" "instance" {
  name = "web"
  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}