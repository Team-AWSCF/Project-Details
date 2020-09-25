provider "aws" { # Directs terraform to provider being used and security credentials needed to create an valid instance with the provider
  access_key = "***"
  secret_key = "***"
  region     = "us-east-1"
}

resource "aws_instance" "Windows" { # creates the perameters for the instance i want to create within aws
  ami           = "ami-0eb7fbcc77e5e6ec6"
  instance_type = "t2.micro"
  key_name = "fifeterraform-key"
  security_groups = ["${aws_security_group.allow_rdp.name}"]

}

resource "aws_security_group" "allow_rdp" { # security rules allowing access to the RDP
  name        = "allow_rdp"
  description = "Allow rdp traffic"


  ingress {

    from_port   = 3389 #  By default, the windows server listens on TCP port 3389 for RDP
    to_port     = 3389
    protocol =   "tcp"

    cidr_blocks =  ["0.0.0.0/0"]
  }
}
