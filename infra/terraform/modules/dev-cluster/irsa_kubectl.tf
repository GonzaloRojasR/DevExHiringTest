resource "aws_iam_role" "irsa_kubectl" {
  name = "irsa-kubectl-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Federated = module.eks.oidc_provider_arn
      },
      Action = "sts:AssumeRoleWithWebIdentity",
      Condition = {
        StringEquals = {
          "${replace(module.eks.oidc_provider, "https://", "")}:sub" = "system:serviceaccount:kube-system:irsa-kubectl"
        }
      }
    }]
  })

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}

resource "aws_iam_policy" "irsa_kubectl_policy" {
  name = "irsa-kubectl-policy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = ["eks:DescribeCluster"],
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "irsa_kubectl_attachment" {
  role       = aws_iam_role.irsa_kubectl.name
  policy_arn = aws_iam_policy.irsa_kubectl_policy.arn
}
