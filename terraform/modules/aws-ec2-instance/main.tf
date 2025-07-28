resource "aws_instance" "main" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.allow_access.id]
  user_data                   = file("${path.module}/init_script.sh")

  key_name = "Simple-Website-Key"
  tags = {
    "Name"        = "Web Server",
    "Environment" = "Dev"
  }
}

resource "aws_security_group" "allow_access" {
  name        = "allow_internet_access"
  description = "Allow HTTP and SSH inbound traffic"

  ingress {
    description = "Allow HTTP access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

