terraform {
  backend "s3" {
    bucket         = "your-terraform-state-bucket"
    key            = "terraform-ci-user/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
  }
}



# terraform {
#   backend "s3" {
#     bucket         = "tf-rma-project-1"
#     key            = "terraform-project/terraform.tfstate"
#     region         = "us-east-2"
#     dynamodb_table = "terraform-state-lock"
#     encrypt        = true
#   }
# }
