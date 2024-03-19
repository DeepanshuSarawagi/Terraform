resource "kubernetes_deployment_v1" "nginx_deployment" {
  metadata {
    name = "nginx-deployment"
    namespace = "default"
    labels = {
      app = "my-app1"
    }
  }
  spec {
    replicas = "3"
    strategy {
      type = "RollingUpdate"
    }
    selector {
      match_labels = {
        app = "nginx"
        tier = "frontend"
      }
    }
    template {
      metadata {
        name = "nginx-deployment-pod"
        labels = {
          app = "nginx"
          tier = "frontend"
        }
      }
      spec {
        container {
          name = "nginx-deployment-pod"
          image = "nginx"
          image_pull_policy = "Always"
          resources {
            requests = {
              cpu = "250m"
              memory = "256Mi"
            }
          }
        }
      }
    }
  }
}