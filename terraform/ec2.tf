resource "aws_instance" "consul_server" {
  count = var.server_count
  ami           = lookup(var.ami, var.region)
  instance_type = "t2.micro"
  key_name      = var.key_name
  user_data = file("scripts/consul-server.sh")
  iam_instance_profile   = aws_iam_instance_profile.consul-join.name
  vpc_security_group_ids = [aws_security_group.opsschool_consul.id]

  tags = {
    Name = "opsschool-server"
    consul_server = "true"
  }

}

resource "aws_instance" "consul_agent" {
  count = var.agent_count
  ami           = lookup(var.ami, var.region)
  instance_type = "t2.micro"
  key_name      = var.key_name
  user_data = file("scripts/consul-agent.sh")
  iam_instance_profile   = aws_iam_instance_profile.consul-join.name
  vpc_security_group_ids = [aws_security_group.opsschool_consul.id]

  tags = {
    Name = "opsschool-agent"
  }
}
