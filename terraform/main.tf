terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = ">= 2.20.0"
    }
  }
}

provider "kubernetes" {
  config_path = var.kubeconfig_path
}

resource "kubernetes_namespace" "santospedia" {
  metadata {
    name = "santospedia"
  }
}

resource "kubernetes_manifest" "deployment" {
  manifest = yamldecode(file("${path.module}/k8s/deployment.yaml"))
}

resource "kubernetes_manifest" "service" {
  manifest = yamldecode(file("${path.module}/k8s/service.yaml"))
}

resource "kubernetes_manifest" "ingress" {
  manifest = yamldecode(file("${path.module}/k8s/ingress.yaml"))
}