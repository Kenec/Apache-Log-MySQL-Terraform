# Apache Server Instance
resource "aws_instance" "apache" {
  ami               = "${var.ubuntu_ami}"
  instance_type = "t2.micro"
  security_groups   = ["${aws_security_group.apache_sg.name}"]
  key_name = "${var.key_name}"
  user_data = "${file("../shell_folder/install_apache.sh")}"
  provisioner "file" {
    source      = "../shell_folder/000-default.conf"
    destination = "/tmp/000-default.conf"
  }

  connection {
   user = "ubuntu"
  }

  tags {
    Name = "Apache"
  }
}

# MySQL Database Instance
resource "aws_instance" "mysql" {
  ami               = "${var.ubuntu_ami}"
  instance_type = "t2.micro"
  security_groups   = ["${aws_security_group.mysql_sg.name}"]
  key_name = "${var.key_name}"
  user_data = "${file("../shell_folder/setup_mysql.sh")}"
  provisioner "file" {
    source      = "../shell_folder/mysqld.cnf"
    destination = "/tmp/mysqld.cnf"
  }

  connection {
   user = "ubuntu"
  }

  tags {
    Name = "MySQL"
  }
}

