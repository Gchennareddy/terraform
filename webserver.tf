resource "aws_instance" "webserver1" {
    ami = "ami-0d5bf08bc8017c83b"
    associate_public_ip_address = true
    instance_type = "t2.micro"
    key_name = "terraformkey"
    security_groups = [ aws_security_group.websg.id ]
    subnet_id = aws_subnet.subnets[0].id
    tags = {
      "Name" = "webserver 1"
    }
    depends_on = [ aws_db_instance.vpctierdb ]
}