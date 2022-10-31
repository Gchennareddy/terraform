provider "aws" {
  region = var.region
}

variable "region" {
  type        = string
  default     = "us-east-2"
  description = "region in which vpctier has to be created"
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

# Create subnet web1
resource "aws_subnet" "web1" {
  vpc_id = aws_vpc.vpctier.id
  cidr_block = "192.168.0.0/24"
  availability_zone = "us-east-2a"

  tags = {
    "Name" = "web1"
  }

}

# Create subnet web2
resource "aws_subnet" "web2" {
  vpc_id = aws_vpc.vpctier.id
  cidr_block = "192.168.1.0/24"
  availability_zone = "us-east-2b"
  tags = {
    "Name" = "web2"
  }
}