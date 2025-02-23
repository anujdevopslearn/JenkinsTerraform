resource "aws_iam_user" "users" {
  count = length(var.user_names)
  name  = var.user_names[count.index]
}

#Create a file outputs.tf with below content:

output "Simon_arn" {
  value       = aws_iam_user.users[0].arn
  description = "The ARN for user Paul Dirac"
}

output "all_arns" {
  value       = aws_iam_user.users[*].arn
  description = "The ARNs for all users"
}
