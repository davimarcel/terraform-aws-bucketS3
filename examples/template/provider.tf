provider "aws" {
  region = var.region_name
  assume_role { role_arn = var.assume_role_arn }
}