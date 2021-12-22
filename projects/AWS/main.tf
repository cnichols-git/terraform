terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.69.0"
    }
  }
}

provider "aws" {
    region = "us-east-1"
}

resource "aws_budgets_budget" "cost" {
  name = "monthly budget"
  budget_type  = "COST"
  limit_amount = "10"
  limit_unit   = "USD"
  time_period_start = "2021-12-01_00:00"
  time_unit = "MONTHLY"
}