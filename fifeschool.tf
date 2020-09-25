provider "aws" {
  access_key = "AKIASQJBKFJC5S2KRX4L"
  secret_key = "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"
  region     = "us-east-1"
}

resource "aws_instance" "Windows" {
  ami           = "ami-0eb7fbcc77e5e6ec6"
  instance_type = "t2.micro"
  key_name = "fifeterraform-key"
  security_groups = ["${aws_security_group.allow_rdp.name}"]

}

resource "aws_security_group" "allow_rdp" {
  name        = "allow_rdp"
  description = "Allow rdp traffic"


  ingress {

    from_port   = 3389 #  By default, the windows server listens on TCP port 3389 for RDP
    to_port     = 3389
    protocol =   "tcp"

    cidr_blocks =  ["0.0.0.0/0"]
  }
}