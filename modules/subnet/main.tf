resource "aws_subnet" "public_subnet" {
  count             = var.subnet_amount.public
  vpc_id            = var.vpc_id
  cidr_block        = var.public_subnet_cidr_blocks[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "public_subnet_${count.index}"
  }
}

resource "aws_subnet" "private_subnet" {
  count             = var.subnet_amount.private
  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnet_cidr_blocks[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "private_subnet_${count.index}"
  }
}