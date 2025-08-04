resource "aws_instance" "main" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.allow_access.id]
  user_data                   = file("${path.module}/init_script.sh")
  key_name                    = "Simple-Website-Key"
  depends_on                  = [aws_iam_instance_profile.ec2_profile]
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile.name

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

resource "aws_iam_role" "ec2_role" {
  name = "Allow_S3_Access"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ec2_policy_attachment" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

resource "aws_iam_instance_profile" "ec2_profile" {
  role = aws_iam_role.ec2_role.name
  name = "AllowS3Access_Profile"
}


