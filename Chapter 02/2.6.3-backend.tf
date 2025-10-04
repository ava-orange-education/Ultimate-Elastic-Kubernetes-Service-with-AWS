terraform {
  backend "s3" {
    bucket         = "terraform-state-eks-prod"
    key            = "production/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true
    kms_key_id     = "arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"
  }
}
