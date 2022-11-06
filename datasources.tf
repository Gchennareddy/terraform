# datasources to fetch subnet ids
# web1 and web2
#data "aws_subnets" "publicsubnets" {
#    vpc_id = aws_vpc.vpctier.id
#    filter {
#      name = "tag:Name"
#      values = [local.subnets[0],local.subnets[1]]
#    }
#}

# data source for subnet with app1, app2, db1, db2
#data "aws_subnets" "privatesubnets" {
#  filter {
#    name = "tag:Name"
#    values = [local.subnets[2],local.subnets[3],local.subnets[4],local.subnets[5]]
#  }
#}