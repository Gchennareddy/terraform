# we need to create a vpc resource
resource "aws_vpc" "vpctier" {
    cidr_block = var.vpccidr
    enable_dns_support = true
    enable_dns_hostnames = true
    
    tags = {
        "Name" = "from tf"
    }
}

# Create subnet all subents
resource "aws_subnet" "subnets" {
  count = 6
  vpc_id = aws_vpc.vpctier.id
  cidr_block = var.cidrranges[count.index]
  availability_zone = var.subnetazs[count.index]

  tags = {
    "Name" = "var.subnets[count.index]"
  }

  depends_on = [
    aws_vpc.vpctier
  ]

}

