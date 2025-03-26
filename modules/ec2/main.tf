resource "aws_instance" "ec2_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [var.security_group_id]

  subnet_id = var.subnet_id

  tags = merge(
    var.tags,
    {
      Name = "${var.environment}-ec2-instance"
    }
  )
} 