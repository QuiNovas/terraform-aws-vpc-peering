locals {
  accepter_route_table_ids        = "${split(",", local.accepter_route_table_ids_join)}"
  accepter_route_table_ids_join   = "${var.accepter_route_table_ids_count > 0 ? join(",", var.accepter_route_table_ids) : join(",", data.aws_route_tables.accepter.ids)}"
  accepter_route_table_ids_count  = "${var.accepter_route_table_ids_count > 0 ? var.accepter_route_table_ids_count : length(data.aws_route_tables.accepter.ids)}"
  requester_route_table_ids       = "${split(",", local.requester_route_table_ids_join)}"
  requester_route_table_ids_join  = "${var.requester_route_table_ids_count > 0 ? join(",", var.requester_route_table_ids) : join(",", data.aws_route_tables.requester.ids)}"
  requester_route_table_ids_count = "${var.requester_route_table_ids_count > 0 ? var.requester_route_table_ids_count : length(data.aws_route_tables.accepter.ids)}"
}