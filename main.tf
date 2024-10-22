provider "aws" {
    region = "us-west-1"
}

resource "aws_instance" "example" {
    ami = "ami-0da424eb883458071"
    instance_type = "t2.micro"

    tags = {
        Name = "my-ubuntu"
    }
}