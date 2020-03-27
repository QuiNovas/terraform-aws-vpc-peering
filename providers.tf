provider "aws" {
  alias = "accepter"
  region = var.accepter_region
}

provider "aws" {
  alias = "requester"
  region = var.requester_region
}

