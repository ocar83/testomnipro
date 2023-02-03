module "ec2" {
  source = "terraform-aws-modules/ec2-instance/aws"
  count = 3

  name = "instance ${count.index}"

  ami                    = "${data.aws_ami.image.id}"
  instance_type          = "t2.micro"
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = ["${aws_security_group.ec2_allow.id}"]
  key_name               = aws_key_pair.key_pair.key_name

}

resource "aws_key_pair" "key_pair" {
  key_name   = "app-key-pair"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDKQZfJW7tmaSItBhZ3QBD3TLUj8oBwSGTFTvVTdXQTGxnSP/Q3XPOML4sWSV3o9PgsXLkS5jM4UN04T3kTxI0eTbAtAZJb1ADxlN+VRUtaYH/gfgsUpUBE+kMPt0MhLosROFWsh6A4nkhjUaQ0QnLB7Vo+o6FRsDsc62/mIY+Q11ITtYSHDYJ0RybV+4gyD1euuDtqnq+3Z4a5a7QoKxFe9QlI8/TYXhmVGzgkw6NRpy8Tw/xOZHEEfAv9B8+E/JAPOljHkhyPoocg1ujSlrWYZnIasnpaU/yltE1W/UkLDGdkJ8gLCSATWw3UPi0bySoeIWdepA2gSarIl325fXCr oscar@admin"
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