resource "aws_key_pair" "instance_key_pair" {
  key_name   = var.key_name
  public_key = var.public_key
}

resource "aws_instance" "ec2_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.instance_key_pair.key_name

  vpc_security_group_ids = [var.security_group_id]
  subnet_id = var.subnet_id

  tags = merge(
    var.tags,
    {
      Name = "${var.environment}-ec2-instance"
    }
  )

  # Explicit dependency on security group
  depends_on = [var.security_group_id]

  # Add lifecycle policy to handle replacement
  lifecycle {
    create_before_destroy = true
  }
} 