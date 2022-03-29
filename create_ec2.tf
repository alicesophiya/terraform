resource "aws_instance" "myFirstInstance" {
  ami           = "ami-064ff912f78e3e561"
count=1
key_name = "key_name"
instance_type = "t2.micro"
security_groups= [ "security_jenkins_port"]
tags= {
    Name = "jenkins_instance"
  }
}

resource "aws_security_group" "security_jenkins_port" {
  name        = "security_jenkins_port"
  description = "security group for jenkins"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 # outbound from jenkis server
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

                                                      
