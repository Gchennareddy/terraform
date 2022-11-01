variable "region" {
  type        = string
  default     = "us-east-2"
  description = "region in which vpctier has to be created"
}

variable "vpccidr" {
  type = string
  default = "192.168.0.0/16"
}

variable "subnets" {
  type = list(string)
  default = ["web1", "web2", "app1", "app2", "db1", "db2"]
  description = "Name of the subnets"
}


