output "inference_profile_id" {
  description = "ID of the Bedrock inference profile"
  value       = aws_bedrock_inference_profile.example.id
}

output "inference_profile_arn" {
  description = "ARN of the Bedrock inference profile"
  value       = aws_bedrock_inference_profile.example.arn
}

output "inference_profile_name" {
  description = "Name of the Bedrock inference profile"
  value       = aws_bedrock_inference_profile.example.name
}
