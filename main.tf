locals {
  checkVersioning = [for key,value in var.bucketS3: {
    versionEnabled = lookup(value,"versioning", null)
  }]

  checkEncryption = [for key,value in var.bucketS3: {
    serverSideEncryption = lookup(value, "serverSideEncryption", null)
  }]

  versioning = contains(local.checkVersioning, "")
  server_side_encryption_configuration = contains(local.checkEncryption, "")

  checkPolicy = [for key,value in var.bucketS3: {
    checkFile = fileexists("assets/policy.json") == true ? true : false
  }]
  
}

output "debug" {
  value = "null"
}
resource "aws_s3_bucket" "BucketS3" {
  for_each = var.bucketS3
  
  bucket = "${each.value.bucketName}-${random_id.bucket.hex}"
  acl    = lookup(each.value, "acl", null)

  dynamic "versioning" {
    for_each = local.versioning != true ? var.bucketS3 : {}
    
    content {
      enabled = each.value.versioning
    }
  }

  dynamic "server_side_encryption_configuration"  {
    for_each = local.server_side_encryption_configuration != true ? var.bucketS3 : {}

    content {
      rule  {
        apply_server_side_encryption_by_default  {
          sse_algorithm = each.value.serverSideEncryption
        }
      }
    }
  }
  
  policy = templatefile(
    "assets/policy.json",
    {
      bucketName = "${each.value.bucketName}-${random_id.bucket.hex}"
      sourceIps = jsonencode(each.value.policy.sourceIps)
    
    }
  )


#   logging {
#     target_bucket = aws_s3_bucket.log_bucket.id
#     target_prefix = "log/"
#   }


  tags = merge(
    jsondecode(var.runtime_tags),
    var.tags,
    lookup(each.value, "tags", null)
  )

#   depends_on = [
#      aws_s3_bucket.log_bucket,
#   ]
}