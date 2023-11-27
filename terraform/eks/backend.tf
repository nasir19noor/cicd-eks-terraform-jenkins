terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.21"
    }
  }

  backend "s3" {
    bucket         = "nasir-cicd-eks-terraform-jenkins"
    key            = "eks/terraform.tfstate"
    dynamodb_table = "nasir-cicd-eks-terraform-jenkins"
    region         = "ap-southeast-1"
  }
}