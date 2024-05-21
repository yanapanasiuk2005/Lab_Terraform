module "labels" {
  source = "cloudposse/label/null"

  name  = var.name
}

resource "aws_s3_bucket" "this" {
  bucket = "${module.labels.name}-lab-bucketttt"
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_policy     = false
  restrict_public_buckets = false
  block_public_acls       = true
  ignore_public_acls      = true
}

resource "aws_s3_bucket_website_configuration" "this" {
  bucket = aws_s3_bucket.this.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}

resource "aws_s3_bucket_policy" "this" {
  depends_on = [
    aws_s3_bucket_public_access_block.this
  ]

  bucket = aws_s3_bucket.this.id

  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "AllowGetObjects"
    Statement = [
      {
        Sid       = "AllowPublic"
        Action    = "s3:GetObject"
        Principal = "*"
        Resource  = "${aws_s3_bucket.this.arn}/**"
        Effect    = "Allow"
      }
    ]
  })
}