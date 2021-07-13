/*
data "aws_subnet_ids" "my_subnet_ids" {
  vpc_id = aws_vpc.TF_VPC.id
}

resource "aws_instance" "EC2_with_TF" {
  for_each                    = data.aws_subnet_ids.my_subnet_ids.ids
  ami                         = lookup(var.amis, var.aws_region)
  instance_type               = "t2.micro"
  key_name                    = var.key_name
  subnet_id                   = each.value
  vpc_security_group_ids      = [aws_security_group.TF_SG.id]
  associate_public_ip_address = true
  user_data = << EOF
  #!/bin/bash
  sudo yum update -y
  sudo yum install git -y
  #sudo yum install -y httpd
  #sudo systemctl start httpd
  #sudo systemctl enable httpd
  echo $(git --version) >> version.txt
  #echo $(sudo systemctl status httpd) >> status.txt
  EOF
  }

  tags = {
    Name = "Prod-${count.index}"
  }
}
*/