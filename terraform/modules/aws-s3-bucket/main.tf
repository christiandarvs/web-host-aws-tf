resource "aws_s3_bucket" "main" {

  bucket = var.bucket_name
  tags = {
    "Name" = "Simple Bucket"
  }
}

resource "aws_s3_object" "html" {
  bucket       = aws_s3_bucket.main.id
  key          = "index.html"
  content_type = "text/html"
  source       = "${path.module}/../../../web/index.html"
}

resource "aws_s3_object" "css" {
  bucket       = aws_s3_bucket.main.id
  key          = "style.css"
  content_type = "text/css"
  source       = "${path.module}/../../../web/style.css"
}


resource "aws_s3_bucket_policy" "s3_bucket" {
  bucket     = aws_s3_bucket.main.id
  depends_on = [aws_s3_bucket_public_access_block.s3_bucket]
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action = ["s3:ListBucket",
          "s3:GetObject",
        "s3:PutObject"]
        Resource = [
          "${aws_s3_bucket.main.arn}",
          "${aws_s3_bucket.main.arn}/*"
        ]
      },
    ]
  })

}


resource "aws_s3_bucket_public_access_block" "s3_bucket" {
  bucket                  = aws_s3_bucket.main.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


resource "aws_s3_bucket_ownership_controls" "s3_bucket" {
  bucket = aws_s3_bucket.main.id
  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_website_configuration" "s3_bucket" {
  bucket = aws_s3_bucket.main.id
  index_document {
    suffix = "index.html"
  }
}
