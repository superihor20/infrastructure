variable "file_keys_names" {
  description = "Public ssh keys for EC2"
  type        = list(string)
  default     = ["naidonov"]
}