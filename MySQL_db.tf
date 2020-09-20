provider "aws" {
    region = "ap-south-1"
    profile = "task_6"
}
resource "aws_db_subnet_group" "subnet" {
  name       = "main"
  subnet_ids = ["subnet-a7167deb", "subnet-a7167deb", "subnet-f1fd408a"]

  tags = {
    Name = "DataBase Subnet"
  }
}
resource "aws_db_instance" "MySQL_DB" {
  allocated_storage    = 10
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7.30"
  instance_class       = "db.t2.micro"
  name                 = "MySQLDB"
  username             = "ridham"
  password             = "passworddb321"
  parameter_group_name = "default.mysql5.7"
  db_subnet_group_name = "${aws_db_subnet_group.subnet.name}"
  publicly_accessible = true
  iam_database_authentication_enabled = true

tags = {
    Name  = "MySQL_DB"
}
}
output "ip" {
  value = aws_db_instance.MySQL_DB.address
  }