output "bucket_index_url" {
  description = "URL of the index.html"
  value       = "http://${aws_s3_bucket_website_configuration.s3_bucket.website_endpoint}/index.html"
}

output "bucket_name" {
  description = "Name of the S3 Bucket"
  value       = aws_s3_bucket.main.bucket
}
