# Apache Server Instance
resource "aws_instance" "apache" {
  ami               = "${var.ubuntu_ami}"
  instance_type = "t2.micro"
  security_groups   = ["${aws_security_group.apache_sg.name}"]
  user_data = <<EOF
          #!/usr/bin/env bash
          sudo apt-get update
          sudo apt-get install -y apache2 libapache2-mod-log-sql-mysql
          sudo a2enmod unique_id
          sudo systemctl start apache2
          sudo systemctl enable apache2
  EOF

  tags {
    Name = "Apache"
  }
}

# MySQL Database Instance
resource "aws_instance" "mysql" {
  ami               = "${var.ubuntu_ami}"
  instance_type = "t2.micro"
  security_groups   = ["${aws_security_group.mysql_sg.name}"]

  tags {
    Name = "MySQL"
  }
}

