resource "aws_vpc_peering_connection" "connection" {
  auto_accept   = false
  peer_owner_id = data.aws_caller_identity.accepter.account_id
  peer_region   = data.aws_region.accepter.name
  peer_vpc_id   = data.aws_vpc.accepter.id
  provider      = aws.requester
  tags          = var.requester_tags
  vpc_id        = data.aws_vpc.requester.id
}

resource "aws_vpc_peering_connection_accepter" "accepter" {
  auto_accept               = true
  provider                  = aws.accepter
  tags                      = var.accepter_tags
  vpc_peering_connection_id = aws_vpc_peering_connection.connection.id
}

resource "aws_vpc_peering_connection_options" "accepter" {
  accepter {
    allow_remote_vpc_dns_resolution  = lookup(var.accepter_options, "allow_remote_vpc_dns_resolution", false)
  }
  count                     = length(keys(var.accepter_options)) > 0 ? 1 : 0
  provider                  = aws.accepter
  vpc_peering_connection_id = aws_vpc_peering_connection.connection.id
}

resource "aws_vpc_peering_connection_options" "requester" {
  accepter {
    allow_remote_vpc_dns_resolution  = lookup(var.requester_options, "allow_remote_vpc_dns_resolution", false)
  }
  count                     = length(keys(var.requester_options)) > 0 ? 1 : 0
  provider                  = aws.requester
  vpc_peering_connection_id = aws_vpc_peering_connection.connection.id
}

resource "aws_route" "accepter_ipv4" {
  count                     = local.accepter_route_table_ids_count
  destination_cidr_block    = data.aws_vpc.requester.cidr_block
  provider                  = aws.accepter
  route_table_id            = local.accepter_route_table_ids[count.index]
  vpc_peering_connection_id = aws_vpc_peering_connection.connection.id
}

resource "aws_route" "accepter_ipv6" {
  count                       = var.route_ipv6 ? local.accepter_route_table_ids_count : 0
  destination_ipv6_cidr_block = data.aws_vpc.requester.ipv6_cidr_block
  provider                    = aws.accepter
  route_table_id              = local.accepter_route_table_ids[count.index]
  vpc_peering_connection_id   = aws_vpc_peering_connection.connection.id
}

resource "aws_route" "requester_ipv4" {
  count                     = local.requester_route_table_ids_count
  destination_cidr_block    = data.aws_vpc.accepter.cidr_block
  provider                  = aws.requester
  route_table_id            = local.requester_route_table_ids[count.index]
  vpc_peering_connection_id = aws_vpc_peering_connection.connection.id
}

resource "aws_route" "requester_ipv6" {
  count                       = var.route_ipv6 ? local.requester_route_table_ids_count : 0
  destination_ipv6_cidr_block = data.aws_vpc.accepter.ipv6_cidr_block
  provider                    = aws.requester
  route_table_id              = local.requester_route_table_ids[count.index]
  vpc_peering_connection_id   = aws_vpc_peering_connection.connection.id
}

