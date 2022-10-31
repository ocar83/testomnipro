module "ec2" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "employee-directory-app"

  ami                    = "ami-0ff8a91507f77f867"
  instance_type          = "t2.micro"
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = ["${aws_security_group.ec2_allow.id}"]
  key_name               = aws_key_pair.key_pair.key_name
  user_data              = file("script.sh")

}

resource "aws_key_pair" "key_pair" {
  key_name   = "app-key-pair"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC9hl7rzRvvY0XyaSOkNgVDSIJEusK/qanAqDIUPfSsDmMyH298KoMVo7lMnjzxtjGTkcd9o74rKVypQSy8+a5VjEs8fqKNVu1PSgW1U9Vc7vK+j5i0zwH1ypYt2JuklFacYrfgcWo+ezq/8Nn4JZHgZyMWOzsh5hKDbGfi1woAxUeIasqS+tChsX/57nE2RLyPtufhvxiGVh+LhYz0zUeSDYhfupCH415ThYytzhf3R4sGmvFB3azHCkZJuYe9Zp18cvf/pPBjKFte06O+3PdE3BQsKjekXESDaRJBEO9S1MgDRJ4I20qGF5kMVk825/OFDPEK9ID4Yn9+N1Jfsb8X0RppvwbqlXCdrRiaAPeeR4IWTw5GrFSJz3oTfu0l7FkJLBNFzxovXbjEQHYj0ZrgDXU/nMWEt9ym2LEWeqZCiR0ez4YzTknZfLNdW5KhUwuLeI0sv/t1dF18hN+xT7mqJ4HtCQIm0Lfzvfn0YUzL6PS0TGCfm5v8W0zyGMJC3vk= ocar@MacBook-Pro-de-Oscar.local"
}