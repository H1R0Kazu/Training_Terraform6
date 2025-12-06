terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_bedrock_inference_profile" "example" {
  name        = var.inference_profile_name
  description = var.inference_profile_description

  # Claude Sonnet 4.5のモデルARNを指定
  model_source {
    copy_from = "arn:aws:bedrock:ap-northeast-1::foundation-model/anthropic.claude-sonnet-4-5-20250929-v1:0"
  }

  tags = var.tags
}
