provider "aws" {
  region = var.region
}

resource "aws_security_group" "web_sg" {
  name = "docker-web-sg"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "docker_ec2" {
  ami                    = var.instance_ami # Amazon Linux 2 (ap-south-1)
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  user_data = <<EOF
#!/bin/bash
sudo yum update -y
sudo yum install docker -y
sudo systemctl start docker
ssudo ystemctl enable docker

docker run -d -p 80:3000 node:18-alpine sh -c "
npm install http-server &&
echo 'Hello from Docker + Terraform' > index.html &&
http-server -p 3000
"
EOF

  tags = {
    Name = "terraform-docker-project"
  }
}
