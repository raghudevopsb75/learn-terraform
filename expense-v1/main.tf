resource "aws_instance" "frontend" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-07afa043b24022e4e"]

  tags = {
    Name = "frontend"
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = z
  name    = "frontend.rdevopsb73.online"
  type    = "A"
  ttl     = 30
  records = [ aws_instance.frontend.private_ip ]
}
