# Get OIDC issuer URL
aws eks describe-cluster --name my-cluster --query "cluster.identity.oidc.issuer" --output text

# Create OIDC provider
eksctl utils associate-iam-oidc-provider \
    --cluster my-cluster \
    --approve

# Verify provider creation
aws iam list-open-id-connect-providers
