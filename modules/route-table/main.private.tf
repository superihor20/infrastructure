resource "aws_route_table" "private_rt" {
  vpc_id = var.vpc_id
}

resource "aws_route_table_association" "private" {
  count          = var.subnet_amount.private
  route_table_id = aws_route_table.private_rt.id
  subnet_id      = var.private_subnet_ids[count.index]
}
