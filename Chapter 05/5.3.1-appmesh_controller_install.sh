helm repo add eks https://aws.github.io/eks-charts
helm install appmesh-controller eks/appmesh-controller \
  --namespace appmesh-system \
  --set region=${AWS_REGION} \
  --set serviceAccount.create=false \
  --set serviceAccount.name=appmesh-controller
