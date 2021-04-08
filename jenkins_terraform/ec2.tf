resource "aws_security_group" "jenkins_security_group" {
  name = "sg_jenkins"
  description = "jenkins security group."
  vpc_id = "${var.vpc_id}"
}

resource "aws_security_group_rule" "ssh_ingress_access" {
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = [ "0.0.0.0/0" ] 
  security_group_id = "${aws_security_group.jenkins_security_group.id}"
}

resource "aws_security_group_rule" "egress_access" {
  type = "egress"
  from_port = 0
  to_port = 65535
  protocol = "tcp"
  cidr_blocks = [ "0.0.0.0/0" ]
  security_group_id = "${aws_security_group.jenkins_security_group.id}"
}

resource "aws_instance" "jenkins_instance" {
  instance_type = "t2.micro"
  vpc_security_group_ids = [ "${aws_security_group.jenkins_security_group.id}" ]
  associate_public_ip_address = true
  user_data = "${file("../shared/Jenkins.txt")}"
  tags = {
    Name = "jenkins-instance"
  }
  key_name = "${var.key_name}"
  ami = "${var.ami_id}"
  availability_zone = "${var.availability_zone_id}"
  subnet_id = "${var.subnet_id}"
}
