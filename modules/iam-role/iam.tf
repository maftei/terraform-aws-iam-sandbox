resource "aws_iam_role" "s3_access_role" {
  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy" "s3_access_policy" {
  name   = "${var.role_name}-policy"
  role   = aws_iam_role.s3_access_role.id
  policy = data.aws_iam_policy_document.s3_access_policy.json
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Federated"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/oidc.eks.${var.aws_region}.amazonaws.com/id/YOUR_OIDC_ID"]
    }

    actions = ["sts:AssumeRoleWithWebIdentity"]
  }
}

data "aws_iam_policy_document" "s3_access_policy" {
  statement {
    effect = "Allow"
    actions = [
      "s3:*",
    ]
    resources = [
      var.s3_bucket_arn,
      "${var.s3_bucket_arn}/*"
    ]
  }
}

data "aws_caller_identity" "current" {}
