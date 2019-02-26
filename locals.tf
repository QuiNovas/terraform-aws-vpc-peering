locals {
  accepter_route_table_ids        = "${var.accepter_route_table_ids_count > 0 ? var.accepter_route_table_ids : data.aws_route_tables.accepter.ids}"
  accepter_route_table_ids_count  = "${var.accepter_route_table_ids_count > 0 ? var.accepter_route_table_ids_count : length(data.aws_route_tables.accepter.ids)}"
  requester_route_table_ids       = "${var.requester_route_table_ids_count > 0 ? var.requester_route_table_ids : data.aws_route_tables.requester.ids}"
  requester_route_table_ids_count = "${var.requester_route_table_ids_count > 0 ? var.requester_route_table_ids_count : length(data.aws_route_tables.accepter.ids)}"
}