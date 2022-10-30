provider "aws" {
  region = "us-east-2"
}
# we need to create a vpc resource
resource "aws_vpc" "vpctier" {
    cidr_block = "192.168.0.0/16"
    enable_dns_support = true
    enable_dns_hostnames = true
    
    tags = {
        "Name" = "from tf"
    }
}