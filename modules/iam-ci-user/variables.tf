variable "user_name" {
  description = "The name of the IAM user to create"
  type        = string
}
variable "tags" {
  type    = map(string)
  default = {}
}