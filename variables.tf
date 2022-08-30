variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "aws_roles" {
  description = "Additional IAM roles to add to the aws-auth configmap."
  type = list(object({
    rolearn  = string
    username = string
    groups   = list(string)
  }))
  default = [
    {
      rolearn  = "arn:aws:iam::907817574113:role/eks-service-role-AWSCloudFormationStackSetExecutionRole"
      username = "system:node:node-0"
      groups = [
        "system:bootstrappers",
        "system:nodes"
      ]
    }
  ]
}

variable "aws_users" {
  description = "Additional IAM users to add to the aws-auth configmap."
  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))
  default = [{
    userarn  = "arn:aws:iam::907817574113:user/ckuykendall"
    username = "Cody"
    groups = [
      "system:masters"
    ]
  }]
}

variable "aws_accounts" {
  description = "Additional AWS account numbers to add to the aws-auth configmap."
  type        = list(string)
  default     = ["907817574113"]
}

