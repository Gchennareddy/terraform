# datasources to fetch subnet ids
# web1 and web2
data "aws_subnets" "publicsubnets" {
#    vpc_id = aws_vpc.vpctier.id
    filter {
      name = "tag:Name"
      values = [local.subnets[0], local.subnets[1]]
    }
}