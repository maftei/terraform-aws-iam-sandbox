output "bucket_arn" {
  value = module.s3_bucket.bucket_arn
}

output "iam_role_arn" {
  value = module.iam_role.iam_role_arn
}
