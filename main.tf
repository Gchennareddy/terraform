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
  cidr_block = cidrsubnet(var.vpccidr,8,count.index)
  availability_zone = "${var.region}${count.index%2 ==0?"a":"b"}"

  tags = {
    "Name" = local.subnets[count.index]
  }

  depends_on = [
    aws_vpc.vpctier
  ]

}

