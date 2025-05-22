# Santospedia - Manutenção

Este projeto exibe a página de manutenção do site Santospedia, em React e Nginx.

## 🌐 Pipeline CI/CD

- Build Docker com multiplataforma (amd64 e arm64)
- Push para Docker Hub
- Deploy no cluster Kubernetes via `kubectl apply`

## 🚀 Deploy manual

```bash
kubectl apply -f kubernetes/ --insecure-skip-tls-verify