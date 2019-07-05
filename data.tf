data "aws_caller_identity" "accepter" {
  provider = aws.accepter
}

data "aws_region" "accepter" {
  provider = aws.accepter
}

data "aws_vpc" "accepter" {
  id       = var.accepter_vpc_id
  provider = aws.accepter
}

data "aws_vpc" "requester" {
  id       = var.requester_vpc_id
  provider = aws.requester
}

data "aws_route_tables" "accepter" {
  provider = aws.accepter
  vpc_id   = var.accepter_vpc_id
}

data "aws_route_tables" "requester" {
  provider = aws.requester
  vpc_id   = var.requester_vpc_id
}

