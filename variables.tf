variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "ap-northeast-1"
}

variable "inference_profile_name" {
  description = "Name of the Bedrock inference profile"
  type        = string
  default     = "my-inference-profile"
}

variable "inference_profile_description" {
  description = "Description of the inference profile"
  type        = string
  default     = "Application inference profile for Bedrock"
}


variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default = {
    Environment = "development"
    ManagedBy   = "terraform"
  }
}
