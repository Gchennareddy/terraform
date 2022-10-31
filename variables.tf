variable "region" {
  type        = string
  default     = "us-east-2"
  description = "region in which vpctier has to be created"
}

variable "vpccidr" {
  type = string
  default = "192.168.0.0/16"
}
