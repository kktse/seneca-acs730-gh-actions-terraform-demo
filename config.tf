terraform {
  backend "s3" {
    bucket = "acs730-gh-actions-terraform-demo"                   // Bucket where to SAVE Terraform State
    key    = "acs730-gh-actions-terraform-demo/terraform.tfstate" // Object name in the bucket to SAVE Terraform State
    region = "us-east-1"                                          // Region where bucket is created
  }
}
