resource "aws_db_subnet_group" "dbsubnetgroup" {
    name = local.db_subnet_group_name
    subnet_ids = [ aws_subnet.subnets[4].id, aws_subnet.subnets[5].id ]
    tags = {
        "Name" = "vpctier db subnet group"
    }

    depends_on = [
        aws_subnet.subnets[4],
        aws_subnet.subnets[5]
    ]

}

resource "aws_db_instance" "vpctierdb" {
    allocated_storage = 20
    allow_major_version_upgrade = false
    auto_minor_version_upgrade = false
    backup_retention_period = 0
    db_subnet_group_name = local.db_subnet_group_name
    engine = "mysql"
    engine_version = "8.0.30"
    instance_class = "db.t2.micro"
    db_name = "vpctierdb"
    vpc_security_group_ids = [aws_security_group.dbsg.id]
    username = "qtdevops"
    password = "admin123"
    tags = {
        "Name" = "vpctierdb"
    }
    skip_final_snapshot = true

    depends_on = [
        aws_db_subnet_group.dbsubnetgroup
    ]
    
}