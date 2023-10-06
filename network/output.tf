output "public_subnet" {
  value       = aws_subnet.public_subnet
}
output "public_subnet2"{
      value  = aws_subnet.public_subnet2
}
output "private_subnet" {
  value       = aws_subnet.private_subnet
}
output "private_subnet2" {
  value  = aws_subnet.private_subnet2

}
output "vpcid" {
  value       = aws_vpc.myvpc.id
}
output "cidr_block" {
  value       = aws_vpc.myvpc.cidr_block
}
