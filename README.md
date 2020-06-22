# terraform-aws-vpc-peering

This module creates the requested VPC peering and routes required.

## Usage

```hcl
provider "aws" {
  alias               = "ohio"
  allowed_account_ids = local.allowed_account_ids
  region              = "us-east-2"
}

provider "aws" {
  alias               = "n_virginia"
  allowed_account_ids = local.allowed_account_ids
  region              = "us-east-1"
}

module "peering" {
  accepter_vpc_id = "vpc-123456789abc"

  providers = {
    aws.accepter  = aws.ohio
    aws.requester = aws.n_virginia
  }

  requester_vpc_id = "vpc-abcdefgh123"
  source           = "QuiNovas/vpc-peering/aws"
  version          = "3.0.2"
}
```

## Authors

Module managed by Quinovas (https://github.com/QuiNovas)

## License

Apache License, Version 2.0, January 2004 (http://www.apache.org/licenses/). See LICENSE for full details.
