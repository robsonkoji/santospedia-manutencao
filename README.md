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
```bash
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
````
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

docker buildx build --platform linux/amd64,linux/arm64 -t sonijok/santospedia-manutencao:latest --push .

````
☸️ Deploy com Terraform (alternativa ao CI/CD):

````
cd terraform/
terraform init
terraform apply -var="kubeconfig_path=~/.kube/santospedia.yaml"
````

Ou aplique os arquivos manualmente com:

````
kubectl apply -f k8s/ --insecure-skip-tls-verify
````

---

## 🔒 Aviso Legal sobre o Nome "Santospedia".

O nome **"Santospedia"**, bem como seu logotipo e identidade visual, são de uso exclusivo deste projeto e de seus mantenedores.
Não é permitida a reutilização, redistribuição ou modificação do nome "Santospedia" para qualquer outro projeto, aplicação ou serviço, sem autorização expressa por escrito.

Este aviso não restringe o uso do código-fonte, que permanece disponível sob os termos da licença MIT. Ele apenas regula o uso do nome e identidade do projeto.

---

## 📄 Licença

Este projeto é licenciado sob a licença MIT. Veja o arquivo [LICENSE](./LICENSE) para mais detalhes.

---

### 🤝 Contribuições

Pull requests são bem-vindos! Fique à vontade para abrir issues ou sugerir melhorias. É um projeto comunitário voltado para manter a história do Santos FC viva.

