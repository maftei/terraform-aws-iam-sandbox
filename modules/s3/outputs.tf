output "bucket_arn" {
  value = aws_s3_bucket.this.arn
}
output "encryption_algorithm" {
  value = "AES256"
}

output "versioning_status" {
  value = aws_s3_bucket_versioning.this.versioning_configuration[0].status
}

