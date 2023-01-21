module "ec2" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "employee-directory-app"

  ami                    = "${data.aws_ami.image.id}"
  instance_type          = "t2.micro"
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = ["${aws_security_group.ec2_allow.id}"]
  key_name               = aws_key_pair.key_pair.key_name

}

resource "aws_key_pair" "key_pair" {
  key_name   = "app-key-pair"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC/ZsL7RYW5y1Axmc04N2OV9Q6JwIcZGQhy6ehNKyqNwe2wJJ/s7qPK2skHc6tjHbWvhjEcOWR5+3pmkJssg/vOSvjgG5eW36tB+yLLlSgDl7lW220ywMwpqAWUMTeCapcfYhD+mDDlwiwTJREj7rlmvqDkODF1LJAkuQ96kqZbkk4i2v8VFvIKc3J08JpVAOEMjVC9B89zKslmT5EAy9Jdpiz9WMkW+TcsOzbcrjnlaTbx4yd03ZJ0a2L7LRJZNCt+TmkICacChRSh6gXmwnxLRUVVgntK+HlrPSgxmnqAu5XhTL5Q1u2GMy0EcY3nwbtIb9vd74PiaBQPpc+TS3IpKKt2gZfy56ha79gxEhp9OPe9c8p7M9FceGybbhWHcmshGtuq7otflMAVe3sWotXlbhpPPapKRU/tfShliqQNHQtShus9raC+41saSorRfutMR0chs6n0GH87L/wXYQpIfAPfIsvs8tDPsCYd79rGZDWfcWiMb+CgpEzmAYPA1ac= ocar@ocarpc"
}

data "aws_ami" "image" {
  most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["099720109477"]
}