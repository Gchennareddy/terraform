resource "aws_instance" "appserver1" {
    ami = data.aws_ami.ubuntu.id
    associate_public_ip_address = false
    instance_type = var.webserverinstancetype
    key_name = "terraformkey"
    vpc_security_group_ids = [ aws_security_group.appsg.id ]
    subnet_id = aws_subnet.subnets[2].id
    tags = {
      "Name" = "appserver 1"
    }
    depends_on = [ aws_db_instance.vpctierdb ]
}


resource "aws_instance" "webserver1" {
    ami = data.aws_ami.ubuntu.id
    associate_public_ip_address = true
    instance_type = var.webserverinstancetype
    key_name = "terraformkey"
    vpc_security_group_ids = [ aws_security_group.websg.id ]
    subnet_id = aws_subnet.subnets[0].id
    tags = {
      "Name" = "webserver 1"
    }
    # ssh -i terraformkey.pem ubuntu@publicip
    connection {
      type = "ssh"
      user = "ubuntu"
      private_key = file("./terraformkey.pem")
      host = self.public_ip
    }
    provisioner "remote-exec" {
      inline = ["sudo apt update", "sudo apt install apache2 -y"]
    }

    depends_on = [ aws_db_instance.vpctierdb ]
}