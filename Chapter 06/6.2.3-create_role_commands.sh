aws iam create-role \
    --role-name my-eks-role \
    --assume-role-policy-document file://trust-policy.json

aws iam put-role-policy \
    --role-name my-eks-role \
    --policy-name my-policy \
    --policy-document file://permission-policy.json

aws iam attach-role-policy \
    --role-name my-eks-role \
    --policy-arn arn:aws:iam::aws:policy/needed-policy
