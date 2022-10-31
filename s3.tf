data "aws_iam_policy_document" "data_bucket_policy" {
  statement {
    sid    = "AllowS3ReadAccess"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::713447189806:role/S3DynamoDBFullAccessRole"]
    }
    actions   = ["s3:*"]
    resources = ["${aws_s3_bucket.s3.arn}", "${aws_s3_bucket.s3.arn}/*"]

  }
}

# module "s3_bucket" {
#   source = "terraform-aws-modules/s3-bucket/aws"

#   bucket = "employee-photo-bucket-ocar-10"
#   acl    = "private"

#   versioning = {
#     enabled = true
#   }

#   policy = data.aws_iam_policy_document.data_bucket_policy.json

# }

resource "aws_s3_bucket" "s3" {
  bucket = "employee-photo-bucket-ocar-10"
}

resource "aws_s3_bucket_policy" "s3_policy" {
  bucket = aws_s3_bucket.s3.id
  policy = data.aws_iam_policy_document.data_bucket_policy.json
}