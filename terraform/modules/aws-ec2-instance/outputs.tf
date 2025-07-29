output "web_url" {
  description = "Public IP address of the web server"
  value       = aws_instance.main.public_ip
}

