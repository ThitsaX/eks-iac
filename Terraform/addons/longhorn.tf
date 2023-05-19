resource "helm_release" "longhorn" {
  name       = "longhorn"
  repository = "https://charts.longhorn.io"
  chart      = "longhorn"
  version    = "1.4.2"
  namespace  = "longhorn-system"
  wait       = false
  create_namespace = true
  values = [
    "${file("./templates/values-longhorn.yaml")}"
  ]
}