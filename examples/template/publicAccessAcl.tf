# resource "aws_s3_bucket_public_access_block" "configBucket" {
#   bucket = var.bucket_name

#   block_public_acls   = true
#   block_public_policy = true
#   ignore_public_acls = true
#   restrict_public_buckets = true

# }