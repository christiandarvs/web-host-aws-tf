output "bucket_index_url" {
  description = "URL of the index.html"
  value       = module.s3-bucket.bucket_index_url
}

output "ec2_web_url" {
  description = "Public IP of the EC2 instance"
  value       = "http://${module.ec2-instance.web_url}"
}

output "s3_bucket_name" {
  description = "Name of the S3 Bucket"
  value       = module.s3-bucket.bucket_name
}
