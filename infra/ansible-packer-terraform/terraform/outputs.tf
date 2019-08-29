output "public_ip" {
  value = "${aws_instance.mo_is_awesome.public_ip}"
}
output "private_ip" {
  value = "${aws_instance.mo_is_awesome.private_ip}"
}
output "elastic_ip" {
  value = "${aws_eip.mo_is_awesome.public_ip}"
}
