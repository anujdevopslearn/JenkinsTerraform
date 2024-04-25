#variables.tf
variable "user_names" {
  description = "Create IAM users with these names"
  type        = list(string)
  default     = ["Simon", "Erwin", "Darwin"]
}
