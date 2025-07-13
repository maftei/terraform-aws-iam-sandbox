provider "aws" {
  region = var.aws_region
}

module "s3_bucket" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
  enable_versioning = var.enable_versioning
}

module "iam_role" {
  source        = "./modules/iam-role"
  role_name     = var.iam_role_name
  s3_bucket_arn = module.s3_bucket.bucket_arn
}

module "iam_ci_user" {
  source     = "./modules/iam-ci-user"
  user_name  = "terraform-ci-user"

  tags = {
    Owner       = "Razvan"
    Environment = "dev"
}
}