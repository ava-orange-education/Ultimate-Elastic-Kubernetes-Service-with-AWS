helm repo add vmware-tanzu https://vmware-tanzu.github.io/helm-charts
helm repo update

helm install velero vmware-tanzu/velero \
  --namespace velero \
  --create-namespace \
  --set credentials.useSecret=true \
  --set-file credentials.secretContents.cloud=./credentials-velero \
  --set configuration.provider=aws \
  --set configuration.backupStorageLocation.name=default \
  --set configuration.backupStorageLocation.bucket=<YOUR_BUCKET_NAME> \
  --set configuration.backupStorageLocation.config.region=<AWS_REGION> \
  --set configuration.volumeSnapshotLocation.name=default \
  --set configuration.volumeSnapshotLocation.config.region=<AWS_REGION>
