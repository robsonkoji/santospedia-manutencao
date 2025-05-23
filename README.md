# 🏗️ Santospedia - Página de Manutenção

Este projeto exibe a página de manutenção do site [Santospedia](https://santospedia.com.br), desenvolvida em **React** e servida via **Nginx**. É utilizada durante os momentos em que o site oficial (MediaWiki) está em desenvolvimento ou fora do ar.

---

## 🧾 Funcionalidades

- Tema personalizado do Santos FC
- Layout responsivo com React + CSS
- Imagem de fundo e logotipo do Santospedia
- Docker multi-arquitetura: suporte para `amd64` e `arm64`
- Deploy automatizado via GitLab CI/CD e Terraform

---

## 📁 Estrutura do Projeto

santospedia-manutencao/
├── Dockerfile               # Build da imagem com React + Nginx
├── nginx.conf               # Configuração customizada do Nginx
├── src/                     # Código-fonte React
├── public/                  # Arquivos estáticos
├── package.json             # Dependências e scripts React
├── .gitlab-ci.yml           # Pipeline de CI/CD no GitLab
├── k8s/                     # YAMLs do Kubernetes (manual/kubectl)
│   ├── deployment.yaml
│   ├── service.yaml
│   └── ingress.yaml
└── terraform/               # Infraestrutura como código (IaC)
├── main.tf
├── variables.tf
└── k8s/
├── deployment.yaml
├── service.yaml
└── ingress.yaml

---

## 🚀 Deploy com GitLab CI/CD

### Variáveis de Ambiente Necessárias

Configure no GitLab (**Settings > CI/CD > Variables**):

| Variável          | Descrição                                  |
|-------------------|--------------------------------------------|
| `DOCKER_USERNAME` | Usuário do Docker Hub                      |
| `DOCKER_PASSWORD` | Token de acesso ao Docker Hub              |
| `KUBECONFIG_DATA` | Conteúdo do kubeconfig codificado em base64 |

---

## 📦 Build local e push manual (opcional)

```bash
<pre>
docker buildx build --platform linux/amd64,linux/arm64 -t sonijok/santospedia-manutencao:latest --push .
</pre>

☸️ Deploy com Terraform (alternativa ao CI/CD):

<pre>
cd terraform/
terraform init
terraform apply -var="kubeconfig_path=~/.kube/santospedia.yaml"
</pre>

Ou aplique os arquivos manualmente com:

<pre>
kubectl apply -f k8s/ --insecure-skip-tls-verify
</pre>

📄 Licença

Este projeto é licenciado sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.

⸻

🤝 Contribuições

Pull requests são bem-vindos! Fique à vontade para abrir issues ou sugerir melhorias. É um projeto comunitário voltado para manter a história do Santos FC viva.
>>>>>>> d7ae5d8 (primeiro commit no GitLab)
