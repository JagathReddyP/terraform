resource "aws_instance" "terraform" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_ssh_terrafrom.id]

  tags = {
    Name = "terraform"
  }
  # in this case my laptop is local --> local-exec means execute locally
  # self means aws_instance.terraform --> because we are executing locally
  provisioner "local-exec" {
    command = "echo ${self.private_ip} > private_ip.txt"
  }

  connection {
      type        = "ssh"
      user        = "ec2-user"
      password    = "DevOps321"
      host        = self.public_ip
    }

  provisioner "remote-exec" {
     inline = [
      "sudo dnf install ansible -y",
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx",
    ]
}
 provisioner "remote-exec" {
    when = destroy
     inline = [
      "sudo systemctl stop nginx",
    ]
}
}

resource "aws_security_group" "allow_ssh_terrafrom" {
    name = "allow_sshh" #allow-ssh is already there in my account
    description = "Allow SSH and HTTP"

    #usually we allow everything in egress
    egress{
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress{
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"] #allow from everyone
        ipv6_cidr_blocks = ["::/0"]
    }


  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }


    tags = {
        Name = "allow_sshh"
    }
}

