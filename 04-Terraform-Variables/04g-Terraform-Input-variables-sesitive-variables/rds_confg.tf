resource "aws_db_instance" "rds_instance" {
  instance_class      = "db.t2.micro"
  engine              = "mysql"
  allocated_storage   = 5
  db_name             = "myDB1"
  username            = var.db_username
  password            = var.db_password
  skip_final_snapshot = true

}