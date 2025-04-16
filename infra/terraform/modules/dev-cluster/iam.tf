resource "aws_iam_user_policy_attachment" "eks_admin" {
  user       = "gr-sa-terraform-ci"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSAdminPolicy"
}

resource "aws_iam_user_policy_attachment" "eks_cluster_admin" {
  user       = "gr-sa-terraform-ci"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterAdminPolicy"
}
