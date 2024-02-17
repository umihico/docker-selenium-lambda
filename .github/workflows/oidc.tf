terraform {
  backend "local" {
    path = ".terraform/oidc/terraform.tfstate"
  }
}

provider "aws" {
  region = "ap-northeast-1"
}

data "aws_caller_identity" "current" {}

data "aws_iam_openid_connect_provider" "github_actions" {
  arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/token.actions.githubusercontent.com"
}

resource "aws_iam_role" "github_actions" {
  name = "github-actions-docker-selenium-lambda"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = "sts:AssumeRoleWithWebIdentity"
      Principal = {
        Federated = data.aws_iam_openid_connect_provider.github_actions.arn
      }
      Condition = {
        StringLike = {
          "token.actions.githubusercontent.com:sub" = [
            "repo:umihico/docker-selenium-lambda:*"
          ]
        }
      }
    }]
  })
  managed_policy_arns = ["arn:aws:iam::aws:policy/AdministratorAccess"]
}

output "aws_iam_openid_connect_provider" {
  value = data.aws_iam_openid_connect_provider.github_actions.arn
}

output "aws_iam_role" {
  # gh secret set AWS_ROLE_ARN
  value = aws_iam_role.github_actions.arn
}
