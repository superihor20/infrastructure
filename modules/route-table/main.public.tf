resource "aws_route_table" "public_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = var.route_cidr_block
    gateway_id = var.igw_id
  }
}

resource "aws_route_table_association" "public" {
  count          = var.subnet_amount.public
  route_table_id = aws_route_table.public_rt.id
  subnet_id      = var.public_subnet_ids[count.index]
}
