resource "helm_release" "nginx-ingress-controller" {
  name       = "nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = "4.6.1"
  namespace  = "nginx"
  wait       = false
  create_namespace = true
  values = [
    "${file("./templates/values-nginx.yaml")}"
  ]
}