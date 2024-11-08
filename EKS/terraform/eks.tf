
resource "aws_iam_role" "demo" {
  name = "eks-cluster-demo"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "demo-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.demo.name
}

resource "aws_eks_cluster" "demo" {
  name     = "demo"
  role_arn = aws_iam_role.demo.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.private-us-east-1a.id,
      aws_subnet.private-us-east-1b.id,
      aws_subnet.public-us-east-1a.id,
      aws_subnet.public-us-east-1b.id
    ]
  }

  depends_on = [aws_iam_role_policy_attachment.demo-AmazonEKSClusterPolicy]
}

# "kubernetes.io/role/internal-elb" = "1": This tag tells Kubernetes that this subnet is suitable for internal load balancers. When Kubernetes creates an internal load balancer for a service, it will look for subnets tagged with this value and create the load balancer there. This is useful for services that need to be accessed within the VPC but not from the internet.

# "kubernetes.io/cluster/demo" = "owned": This tag indicates that this subnet is associated with a Kubernetes cluster named demo. The "owned" value means that the Kubernetes cluster owns this subnet and can create resources within it (like nodes or load balancers). In Kubernetes, the AWS Load Balancer Controller and other components use this tag to identify which subnets belong to which clusters.