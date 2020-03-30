locals {
  accepter_route_table_ids        = split(",", local.accepter_route_table_ids_join)
  accepter_route_table_ids_join   = length(var.accepter_route_table_ids) > 0 ? join(",", var.accepter_route_table_ids) : join(",", data.aws_route_tables.accepter.ids)
  accepter_route_table_ids_count  = length(var.accepter_route_table_ids) > 0 ? length(var.accepter_route_table_ids) : length(data.aws_route_tables.accepter.ids)
  requester_route_table_ids       = split(",", local.requester_route_table_ids_join)
  requester_route_table_ids_join  = length(var.requester_route_table_ids) > 0 ? join(",", var.requester_route_table_ids) : join(",", data.aws_route_tables.requester.ids)
  requester_route_table_ids_count = length(var.requester_route_table_ids) > 0 ? length(var.requester_route_table_ids) : length(data.aws_route_tables.requester.ids)
}

