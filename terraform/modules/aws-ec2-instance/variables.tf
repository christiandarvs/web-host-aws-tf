variable "ami_id" {
  description = "EC2 AMI - Amazon Linux"
  type        = string
  default     = "ami-093dc6859d9315726"
}

variable "instance_type" {
  description = "AWS EC2 Instance Type"
  type        = string
  default     = "t2.micro"
}

variable "instance_name" {
  description = "Name of the EC2 Instance"
  type        = string
}

