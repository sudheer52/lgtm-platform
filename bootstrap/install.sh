#!/bin/bash
set -e

echo "==> Creating kind cluster..."
kind create cluster --config bootstrap/kind-config.yaml --name lgtm

echo "==> Installing ArgoCD..."
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

echo "==> Waiting for ArgoCD to be ready..."
kubectl wait --for=condition=available deployment/argocd-server -n argocd --timeout=120s

echo "==> Getting ArgoCD admin password..."
kubectl -n argocd get secret argocd-initial-admin-secret \
  -o jsonpath="{.data.password}" | base64 -d && echo

echo "==> ArgoCD ready. Port-forward with:"
echo "kubectl port-forward svc/argocd-server -n argocd 8080:443"
