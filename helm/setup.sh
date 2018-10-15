#!/usr/bin/env sh
set -xe

apk update
apk add grep

mkdir -p /tmp/helm
curl -LO https://storage.googleapis.com/kubernetes-release/release/v${KUBE_VERSION}/bin/linux/amd64/kubectl
chmod +x ./kubectl
mv ./kubectl /usr/bin/kubectl

curl https://storage.googleapis.com/kubernetes-helm/helm-v${HELM_VERSION}-linux-amd64.tar.gz | tar -xzv -C /tmp/helm
mv /tmp/helm/linux-amd64/helm /usr/bin/helm

curl https://raw.githubusercontent.com/heartysoft/cloud-toolkit/$HSFT_CLOUD_TOOLKIT_VERSION/helm/helm-functions.sh -o /usr/bin/helm-functions.sh
curl https://raw.githubusercontent.com/heartysoft/cloud-toolkit/$HSFT_CLOUD_TOOLKIT_VERSION/helm/kubernetes-functions.sh -o /usr/bin/kubernetes-functions.sh

rm -rf /tmp/helm
rm -rf /var/cache/apk/*
rm -rf /root/.cache
