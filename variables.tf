variable "bucketS3" {
  description = "mapa de configurações do s3"
}

variable "target" {
  type = string
  default = null
  description = "sdsdsdsd"
}

#Module variables
variable "tags" {
  default = {
    "ManagedBy" : "Terraform"
    "SourceType" : "Archetype"
  }

  type        = map(any)
  description = "Module tags"
}

#Variáveis Runtime
variable "runtime_tags" {
  description = "Runtime level TAGs"
}

# variable "bucket_name" {
#   description = "bucket_name"
# }

# variable "tags" {
#   description = "tags"
# }

# variable "whitelist" {
#   description = "whitelist"
# }


# # variable "acl" {
# #     description = "Options: private, public-read, public-read-write, aws-exec-read, authenticated-read, bucket-owner-read, bucket-owner-full-control, log-delivery-write"
# #     default = "public-read"
# # }

# # variable "index_document" {
# #     description = "Index document"
# #     default = "index.html"
# # }

# # variable "error_document" {
# #     description = "error document"
# #     default = "index.html"
# # }

