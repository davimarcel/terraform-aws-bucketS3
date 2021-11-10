
module "BucketS3" {
  source = "davimarcel/bucketS3/aws"
  version = "0.0.1"
  bucketS3 = var.bucketS3
}

# output "debug" {
#   value = module.BucketS3.debug
# }
