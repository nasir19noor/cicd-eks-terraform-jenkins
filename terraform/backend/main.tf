resource "aws_s3_bucket" "nasir-cicd-eks-terraform-jenkins" {
  bucket = "nasir-cicd-eks-terraform-jenkins"
}

resource "aws_dynamodb_table" "terraform-lock" {
  name           = "nasir-cicd-eks-terraform-jenkins"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    "Name" = "DynamoDB Terraform state lock table"
  }
}