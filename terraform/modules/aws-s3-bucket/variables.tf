variable "bucket_name" {
  description = "Name of the AWS S3 Bucket"
  type        = string
}

variable "tags" {
  description = "S3 Bucket Tags"
  type        = map(string)
  default     = {}
}
