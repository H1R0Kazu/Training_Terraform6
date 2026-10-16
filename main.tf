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

  # コピー元のシステム定義推論プロファイルARN（例: Claude Sonnet 4.5 の JP クロスリージョンプロファイル）
  model_source {
    copy_from = var.source_inference_profile_arn
  }

  tags = var.tags
}
