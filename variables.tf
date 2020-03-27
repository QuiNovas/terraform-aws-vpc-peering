variable "accepter_options" {
  default     = {}
  description = "An optional configuration block that allows for VPC Peering Connection options to be set for the VPC that accepts the peering connection (a maximum of one)."
  type = map(string)
}

variable "accepter_route_table_ids" {
  default     = []
  description = "A list of route table ids within the accepter VPC to attach the peering route to. If not present all route tables in the VPC will be updated."
  type        = list(string)
}

variable "accepter_tags" {
  default     = {}
  description = "Tags to add to the accepter side resources of the connection."
  type        = map(string)
}

variable "accepter_vpc_id" {
  description = "The ID of the VPC with which you are creating the VPC Peering Connection."
  type        = string
}

variable "requester_options" {
  default     = {}
  description = "A optional configuration block that allows for VPC Peering Connection options to be set for the VPC that requests the peering connection (a maximum of one)."
  type = map(string)
}

variable "requester_route_table_ids" {
  default     = []
  description = "A list of route table ids within the requester VPC to attach the peering route to. If not present all route tables in the VPC will be updated."
  type        = list(string)
}

variable "requester_tags" {
  default     = {}
  description = "Tags to add to the requester side resources of the connection."
  type        = map(string)
}

variable "requester_vpc_id" {
  description = "The ID of the requester VPC."
  type        = string
}

variable "route_ipv6" {
  default     = false
  description = "Creates ipv6 routes in addition to the standard ipv4 routes"
  type        = string
}

variable "requester_region" {
  description = "Requester VPC region"
  type = string
}

variable "accepter_region" {
  description = "Accepter VPC region"
  type = string
}

