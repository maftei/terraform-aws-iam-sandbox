resource "aws_iam_user" "this" {
  name = var.user_name
}

resource "aws_iam_access_key" "this" {
  user = aws_iam_user.this.name
}

resource "aws_iam_user_policy" "this" {
  name = "${var.user_name}-policy"
  user = aws_iam_user.this.name

  policy = file("${path.module}/../../policies/iam-ci-user-policy.json")
}
