## @section Global parameters
## Global Docker image parameters
## Please, note that this will override the image parameters, including dependencies, configured to use the global value
## Current available global Docker image parameters: imageRegistry, imagePullSecrets and storageClass

## @param global.imageRegistry Global Docker image registry
## @param global.imagePullSecrets Global Docker registry secret names as an array
## @param global.storageClass Global StorageClass for Persistent Volume(s)
##
global:
  imageRegistry: ""
  ## E.g.
  ## imagePullSecrets:
  ##   - myRegistryKeySecretName
  ##
  imagePullSecrets: []
  storageClass: longhorn

## @section Common parameters

## @param kubeVersion Override Kubernetes version
##
kubeVersion: ""
## @param nameOverride String to partially override common.names.fullname
##
nameOverride: ""
## @param fullnameOverride String to fully override common.names.fullname
##
fullnameOverride: ""
## @param commonLabels Labels to add to all deployed objects
##
commonLabels: {}
## @param commonAnnotations Annotations to add to all deployed objects
##
commonAnnotations: {}
## @param clusterDomain Kubernetes cluster domain name
##
clusterDomain: cluster.local
## @param extraDeploy Array of extra objects to deploy with the release
##
extraDeploy: []

## @section Argo CD image parameters

## Bitnami Argo CD image
## ref: https://hub.docker.com/r/bitnami/argo-cd/tags/
## @param image.registry Argo CD image registry
## @param image.repository Argo CD image repository
## @param image.tag Argo CD image tag (immutable tags are recommended)
## @param image.digest Argo CD image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag
## @param image.pullPolicy Argo CD image pull policy
## @param image.pullSecrets Argo CD image pull secrets
## @param image.debug Enable Argo CD image debug mode
##
image:
  registry: docker.io
  repository: bitnami/argo-cd
  tag: 2.6.7-debian-11-r8
  digest: ""
  ## Specify a imagePullPolicy
  ## Defaults to 'Always' if image tag is 'latest', else set to 'IfNotPresent'
  ## ref: https://kubernetes.io/docs/user-guide/images/#pre-pulling-images
  ##
  pullPolicy: IfNotPresent
  ## Optionally specify an array of imagePullSecrets.
  ## Secrets must be manually created in the namespace.
  ## ref: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/
  ## e.g:
  ## pullSecrets:
  ##   - myRegistryKeySecretName
  ##
  pullSecrets: []
  ## Enable debug mode
  ##
  debug: false

## @section Argo CD application controller parameters

## Argo CD Controller
##
controller:
  ## @param controller.replicaCount Number of Argo CD replicas to deploy
  ##
  replicaCount: 1
  ## Configure extra options for Argo CD containers' liveness and readiness probes
  ## ref: https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes/#configure-probes
  ## @param controller.startupProbe.enabled Enable startupProbe on Argo CD nodes
  ## @param controller.startupProbe.initialDelaySeconds Initial delay seconds for startupProbe
  ## @param controller.startupProbe.periodSeconds Period seconds for startupProbe
  ## @param controller.startupProbe.timeoutSeconds Timeout seconds for startupProbe
  ## @param controller.startupProbe.failureThreshold Failure threshold for startupProbe
  ## @param controller.startupProbe.successThreshold Success threshold for startupProbe
  ##
  startupProbe:
    enabled: false
    initialDelaySeconds: 10
    periodSeconds: 10
    timeoutSeconds: 1
    failureThreshold: 3
    successThreshold: 1
  ## @param controller.livenessProbe.enabled Enable livenessProbe on Argo CD nodes
  ## @param controller.livenessProbe.initialDelaySeconds Initial delay seconds for livenessProbe
  ## @param controller.livenessProbe.periodSeconds Period seconds for livenessProbe
  ## @param controller.livenessProbe.timeoutSeconds Timeout seconds for livenessProbe
  ## @param controller.livenessProbe.failureThreshold Failure threshold for livenessProbe
  ## @param controller.livenessProbe.successThreshold Success threshold for livenessProbe
  ##
  livenessProbe:
    enabled: true
    initialDelaySeconds: 10
    periodSeconds: 10
    timeoutSeconds: 1
    failureThreshold: 3
    successThreshold: 1
  ## @param controller.readinessProbe.enabled Enable readinessProbe on Argo CD nodes
  ## @param controller.readinessProbe.initialDelaySeconds Initial delay seconds for readinessProbe
  ## @param controller.readinessProbe.periodSeconds Period seconds for readinessProbe
  ## @param controller.readinessProbe.timeoutSeconds Timeout seconds for readinessProbe
  ## @param controller.readinessProbe.failureThreshold Failure threshold for readinessProbe
  ## @param controller.readinessProbe.successThreshold Success threshold for readinessProbe
  ##
  readinessProbe:
    enabled: true
    initialDelaySeconds: 10
    periodSeconds: 10
    timeoutSeconds: 1
    failureThreshold: 3
    successThreshold: 1
  ## @param controller.customStartupProbe Custom startupProbe that overrides the default one
  ##
  customStartupProbe: {}
  ## @param controller.customLivenessProbe Custom livenessProbe that overrides the default one
  ##
  customLivenessProbe: {}
  ## @param controller.customReadinessProbe Custom readinessProbe that overrides the default one
  ##
  customReadinessProbe: {}
  ## Argo CD resource requests and limits
  ## ref: https://kubernetes.io/docs/user-guide/compute-resources/
  ## @param controller.resources.limits The resources limits for the Argo CD containers
  ## @param controller.resources.requests The requested resources for the Argo CD containers
  ##
  resources:
    limits: {}
    requests: {}
  ## Configure Pods Security Context
  ## ref: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod
  ## @param controller.podSecurityContext.enabled Enabled Argo CD pods' Security Context
  ## @param controller.podSecurityContext.fsGroup Set Argo CD pod's Security Context fsGroup
  ##
  podSecurityContext:
    enabled: true
    fsGroup: 1001
  ## Configure Container Security Context
  ## ref: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod
  ## @param controller.containerSecurityContext.enabled Enabled Argo CD containers' Security Context
  ## @param controller.containerSecurityContext.runAsUser Set Argo CD containers' Security Context runAsUser
  ## @param controller.containerSecurityContext.allowPrivilegeEscalation Set Argo CD containers' Security Context allowPrivilegeEscalation
  ## @param controller.containerSecurityContext.capabilities.drop Set Argo CD containers' Security Context capabilities to be dropped
  ## @param controller.containerSecurityContext.readOnlyRootFilesystem Set Argo CD containers' Security Context readOnlyRootFilesystem
  ## @param controller.containerSecurityContext.runAsNonRoot Set Argo CD container's Security Context runAsNonRoot
  ##
  containerSecurityContext:
    enabled: true
    runAsUser: 1001
    allowPrivilegeEscalation: false
    capabilities:
      drop:
      - all
    readOnlyRootFilesystem: false
    runAsNonRoot: true

  ## ServiceAccount configuration for the Argo CD application controller
  ##
  serviceAccount:
    ## @param controller.serviceAccount.create Specifies whether a ServiceAccount should be created
    ##
    create: true
    ## @param controller.serviceAccount.name The name of the ServiceAccount to use.
    ## If not set and create is true, a name is generated using the common.names.fullname template
    ##
    name: ""
    ## @param controller.serviceAccount.automountServiceAccountToken Automount service account token for the application controller service account
    ##
    automountServiceAccountToken: true
    ## @param controller.serviceAccount.annotations Annotations for service account. Evaluated as a template. Only used if `create` is `true`.
    ##
    annotations: {}

  ## Enable admin clusterrole resources. Allows to Argo CD to deploy to the K8s cluster
  ## @param controller.clusterAdminAccess Enable K8s cluster admin access for the application controller
  ##
  clusterAdminAccess: true

  ## Enable Custom Rules for the Application Controller cluster role
  ## @param controller.clusterRoleRules Use custom rules for the application controller's cluster role
  ##
  clusterRoleRules: []

  ## Argo CD application controller log format: text|json
  ## @param controller.logFormat Format for the Argo CD application controller logs. Options: [text, json]
  ##
  logFormat: text
  ## Argo CD application controller log level
  ## @param controller.logLevel Log level for the Argo CD application controller
  ##
  logLevel: info

  ## Argo CD application controller ports
  ## @param controller.containerPorts.controller Argo CD application controller port number
  ## @param controller.containerPorts.metrics Argo CD application controller metrics port number
  containerPorts:
    controller: 8082
    metrics: 8082

  ## Argo CD application controller service parameters
  ##
  service:
    ## @param controller.service.type Argo CD service type
    ##
    type: ClusterIP
    ## @param controller.service.port Argo CD application controller service port
    ##
    port: 8082

    ## Node ports to expose
    ## @param controller.service.nodePort Node port for Argo CD application controller service
    ## NOTE: choose port between <30000-32767>
    ##
    nodePort: ""

    ## @param controller.service.clusterIP Argo CD application controller service Cluster IP
    ## e.g.:
    ## clusterIP: None
    ##
    clusterIP: ""
    ## @param controller.service.loadBalancerIP Argo CD application controller service Load Balancer IP
    ## ref: https://kubernetes.io/docs/concepts/services-networking/service/#type-loadbalancer
    ##
    loadBalancerIP: ""
    ## @param controller.service.loadBalancerSourceRanges Argo CD application controller service Load Balancer sources
    ## ref: https://kubernetes.io/docs/tasks/access-application-cluster/configure-cloud-provider-firewall/#restrict-access-for-loadbalancer-service
    ## e.g:
    ## loadBalancerSourceRanges:
    ##   - 10.10.10.0/24
    ##
    loadBalancerSourceRanges: []
    ## @param controller.service.externalTrafficPolicy Argo CD application controller service external traffic policy
    ## ref https://kubernetes.io/docs/tasks/access-application-cluster/create-external-load-balancer/#preserving-the-client-source-ip
    ##
    externalTrafficPolicy: Cluster
    ## @param controller.service.annotations Additional custom annotations for Argo CD application controller service
    ##
    annotations: {}
    ## @param controller.service.extraPorts Extra ports to expose (normally used with the `sidecar` value)
    ##
    extraPorts: []
    ## @param controller.service.sessionAffinity Session Affinity for Kubernetes service, can be "None" or "ClientIP"
    ## If "ClientIP", consecutive client requests will be directed to the same Pod
    ## ref: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies
    ##
    sessionAffinity: None
    ## @param controller.service.sessionAffinityConfig Additional settings for the sessionAffinity
    ## sessionAffinityConfig:
    ##   clientIP:
    ##     timeoutSeconds: 300
    sessionAffinityConfig: {}

  ## Metrics configuration for Argo CD application controller
  ##
  metrics:
    ## @param controller.metrics.enabled Enable Argo CD application controller metrics
    ##
    enabled: false
    service:
      ## @param controller.metrics.service.type Argo CD application controller service type
      ##
      type: ClusterIP
      ## @param controller.metrics.service.port Argo CD application controller metrics service port
      ##
      port: 8082

      ## Node ports to expose
      ## @param controller.metrics.service.nodePort Node port for the application controller service
      ## NOTE: choose port between <30000-32767>
      ##
      nodePort: ""

      ## @param controller.metrics.service.clusterIP Argo CD application controller metrics service Cluster IP
      ## e.g.:
      ## clusterIP: None
      ##
      clusterIP: ""
      ## @param controller.metrics.service.loadBalancerIP Argo CD application controller service Load Balancer IP
      ## ref: https://kubernetes.io/docs/concepts/services-networking/service/#type-loadbalancer
      ##
      loadBalancerIP: ""
      ## @param controller.metrics.service.loadBalancerSourceRanges Argo CD application controller service Load Balancer sources
      ## ref: https://kubernetes.io/docs/tasks/access-application-cluster/configure-cloud-provider-firewall/#restrict-access-for-loadbalancer-service
      ## e.g:
      ## loadBalancerSourceRanges:
      ##   - 10.10.10.0/24
      ##
      loadBalancerSourceRanges: []
      ## @param controller.metrics.service.externalTrafficPolicy Argo CD application controller service external traffic policy
      ## ref https://kubernetes.io/docs/tasks/access-application-cluster/create-external-load-balancer/#preserving-the-client-source-ip
      ##
      externalTrafficPolicy: Cluster
      ## @param controller.metrics.service.annotations Additional custom annotations for Argo CD application controller service
      ##
      annotations: {}
      ## @param controller.metrics.service.sessionAffinity Session Affinity for Kubernetes service, can be "None" or "ClientIP"
      ## If "ClientIP", consecutive client requests will be directed to the same Pod
      ## ref: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies
      ##
      sessionAffinity: None
      ## @param controller.metrics.service.sessionAffinityConfig Additional settings for the sessionAffinity
      ## sessionAffinityConfig:
      ##   clientIP:
      ##     timeoutSeconds: 300
      sessionAffinityConfig: {}

    ## Argo CD application controller metrics service monitor configuration
    ##
    serviceMonitor:
      ## @param controller.metrics.serviceMonitor.enabled Create ServiceMonitor Resource for scraping metrics using PrometheusOperator
      ##
      enabled: false
      ## @param controller.metrics.serviceMonitor.namespace Namespace which Prometheus is running in
      ## e.g:
      ## namespace: monitoring
      ##
      namespace: ""
      ## @param controller.metrics.serviceMonitor.jobLabel The name of the label on the target service to use as the job name in prometheus.
      ##
      jobLabel: ""
      ## @param controller.metrics.serviceMonitor.interval Interval at which metrics should be scraped
      ## ref: https://github.com/coreos/prometheus-operator/blob/master/Documentation/api.md#endpoint
      ##
      interval: 30s
      ## @param controller.metrics.serviceMonitor.scrapeTimeout Timeout after which the scrape is ended
      ## ref: https://github.com/coreos/prometheus-operator/blob/master/Documentation/api.md#endpoint
      ##
      scrapeTimeout: 10s
      ## @param controller.metrics.serviceMonitor.relabelings RelabelConfigs to apply to samples before scraping
      ## ref: https://github.com/coreos/prometheus-operator/blob/master/Documentation/api.md#relabelconfig
      ##
      relabelings: []
      ## @param controller.metrics.serviceMonitor.metricRelabelings MetricRelabelConfigs to apply to samples before ingestion
      ## ref: https://github.com/coreos/prometheus-operator/blob/master/Documentation/api.md#relabelconfig
      ##
      metricRelabelings: []
      ## @param controller.metrics.serviceMonitor.selector ServiceMonitor selector labels
      ## ref: https://github.com/bitnami/charts/tree/main/bitnami/prometheus-operator#prometheus-configuration
      ##
      ## selector:
      ##   prometheus: my-prometheus
      ##
      selector: {}
      ## @param controller.metrics.serviceMonitor.honorLabels honorLabels chooses the metric's labels on collisions with target labels
      ##
      honorLabels: false

    ## Rules for PrometheusRule object if enabled
    ##
    ## E.g.
    ## @param controller.metrics.rules.enabled Enable render extra rules for PrometheusRule object
    ## @param controller.metrics.rules.spec Rules to render into the PrometheusRule object
    ## @param controller.metrics.rules.selector Selector for the PrometheusRule object
    ## @param controller.metrics.rules.namespace Namespace where to create the PrometheusRule object
    ## @param controller.metrics.rules.additionalLabels Additional lables to add to the PrometheusRule object
    ##
    rules:
      enabled: false
      ## E.g
      ## - alert: ArgoAppMissing
      ##   expr: |
      ##     absent(argocd_app_info)
      ##   for: 15m
      ##   labels:
      ##     severity: critical
      ##   annotations:
      ##     summary: "[ArgoCD] No reported applications"
      ##     description: >
      ##       ArgoCD has not reported any applications data for the past 15 minutes which
      ##       means that it must be down or not functioning properly.  This needs to be
      ##       resolved for this cloud to continue to maintain state.
      ## - alert: ArgoAppNotSynced
      ##   expr: |
      ##     argocd_app_info{sync_status!="Synced"} == 1
      ##   for: 12h
      ##   labels:
      ##     severity: warning
      ##   annotations:
      ##     summary: "[{{`{{ $labels.name }}`}}] Application not synchronized"
      ##     description: >
      ##       The application [{{`{{ $labels.name }}`}} has not been synchronized for over
      ##       12 hours which means that the state of this cloud has drifted away from the
      ##       state inside Git.
      ##
      spec: []
      ## E.g
      ## selector:
      ##   prometheus: kube-prometheus
      ##
      selector: {}
      namespace: monitoring
      additionalLabels: {}

  ## @param controller.command Override default container command (useful when using custom images)
  ##
  command: []

  ## Arguments that will be used by default for the application controller
  ## @param controller.defaultArgs.statusProcessors Default status processors for Argo CD controller
  ## @param controller.defaultArgs.operationProcessors Default operation processors for Argo CD controller
  ## @param controller.defaultArgs.appResyncPeriod Default application resync period for Argo CD controller
  ## @param controller.defaultArgs.selfHealTimeout Default self heal timeout for Argo CD controller
  ##
  defaultArgs:
    statusProcessors: "20"
    operationProcessors: "10"
    appResyncPeriod: "180"
    selfHealTimeout: "5"
  ## @param controller.args Override default container args (useful when using custom images). Overrides the defaultArgs.
  ##
  args: []
  ## @param controller.extraArgs Add extra arguments to the default arguments for the Argo CD controller
  ##
  extraArgs: []
  ## @param controller.hostAliases Argo CD pods host aliases
  ## https://kubernetes.io/docs/concepts/services-networking/add-entries-to-pod-etc-hosts-with-host-aliases/
  ##
  hostAliases: []
  ## @param controller.podLabels Extra labels for Argo CD pods
  ## ref: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/
  ##
  podLabels: {}
  ## @param controller.podAnnotations Annotations for Argo CD pods
  ## ref: https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/
  ##
  podAnnotations: {}
  ## @param controller.podAffinityPreset Pod affinity preset. Ignored if `controller.affinity` is set. Allowed values: `soft` or `hard`
  ## ref: https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#inter-pod-affinity-and-anti-affinity
  ##
  podAffinityPreset: ""
  ## @param controller.podAntiAffinityPreset Pod anti-affinity preset. Ignored if `controller.affinity` is set. Allowed values: `soft` or `hard`
  ## ref: https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#inter-pod-affinity-and-anti-affinity
  ##
  podAntiAffinityPreset: soft
  ## Node controller.affinity preset
  ## ref: https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#node-affinity
  ##
  nodeAffinityPreset:
    ## @param controller.nodeAffinityPreset.type Node affinity preset type. Ignored if `controller.affinity` is set. Allowed values: `soft` or `hard`
    ##
    type: ""
    ## @param controller.nodeAffinityPreset.key Node label key to match. Ignored if `controller.affinity` is set
    ##
    key: ""
    ## @param controller.nodeAffinityPreset.values Node label values to match. Ignored if `controller.affinity` is set
    ## E.g.
    ## values:
    ##   - e2e-az1
    ##   - e2e-az2
    ##
    values: []
  ## @param controller.affinity Affinity for Argo CD pods assignment
  ## ref: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity
  ## NOTE: `controller.podAffinityPreset`, `controller.podAntiAffinityPreset`, and `controller.nodeAffinityPreset` will be ignored when it's set
  ##
  affinity: {}
  ## @param controller.nodeSelector Node labels for Argo CD pods assignment
  ## ref: https://kubernetes.io/docs/user-guide/node-selection/
  ##
  nodeSelector: {}
  ## @param controller.tolerations Tolerations for Argo CD pods assignment
  ## ref: https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/
  ##
  tolerations: []
  ## @param controller.schedulerName Name of the k8s scheduler (other than default)
  ## ref: https://kubernetes.io/docs/tasks/administer-cluster/configure-multiple-schedulers/
  ##
  schedulerName: ""
  ## @param controller.shareProcessNamespace Enable shared process namespace in a pod.
  ## If set to false (default), each container will run in separate namespace, controller will have PID=1.
  ## If set to true, the /pause will run as init process and will reap any zombie PIDs,
  ## for example, generated by a custom exec probe running longer than a probe timeoutSeconds.
  ## Enable this only if customLivenessProbe or customReadinessProbe is used and zombie PIDs are accumulating.
  ## Ref: https://kubernetes.io/docs/tasks/configure-pod-container/share-process-namespace/
  ##
  shareProcessNamespace: false
  ## @param controller.topologySpreadConstraints Topology Spread Constraints for pod assignment
  ## https://kubernetes.io/docs/concepts/workloads/pods/pod-topology-spread-constraints/
  ## The value is evaluated as a template
  ##
  topologySpreadConstraints: []
  ## @param controller.updateStrategy.type Argo CD statefulset strategy type
  ## ref: https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/#update-strategies
  ##
  updateStrategy:
    ## StrategyType
    ## Can be set to RollingUpdate or OnDelete
    ##
    type: RollingUpdate
  ## @param controller.priorityClassName Argo CD pods' priorityClassName
  ##
  priorityClassName: ""
  ## @param controller.runtimeClassName Name of the runtime class to be used by pod(s)
  ## ref: https://kubernetes.io/docs/concepts/containers/runtime-class/
  ##
  runtimeClassName: ""
  ## @param controller.lifecycleHooks for the Argo CD container(s) to automate configuration before or after startup
  ##
  lifecycleHooks: {}
  ## @param controller.extraEnvVars Array with extra environment variables to add to Argo CD nodes
  ## e.g:
  ## extraEnvVars:
  ##   - name: FOO
  ##     value: "bar"
  ##
  extraEnvVars: []
  ## @param controller.extraEnvVarsCM Name of existing ConfigMap containing extra env vars for Argo CD nodes
  ##
  extraEnvVarsCM: ""
  ## @param controller.extraEnvVarsSecret Name of existing Secret containing extra env vars for Argo CD nodes
  ##
  extraEnvVarsSecret: ""
  ## @param controller.extraVolumes Optionally specify extra list of additional volumes for the Argo CD pod(s)
  ##
  extraVolumes: []
  ## @param controller.extraVolumeMounts Optionally specify extra list of additional volumeMounts for the Argo CD container(s)
  ##
  extraVolumeMounts: []
  ## @param controller.sidecars Add additional sidecar containers to the Argo CD pod(s)
  ## e.g:
  ## sidecars:
  ##   - name: your-image-name
  ##     image: your-image
  ##     imagePullPolicy: Always
  ##     ports:
  ##       - name: portname
  ##         containerPort: 1234
  ##
  sidecars: []
  ## @param controller.initContainers Add additional init containers to the Argo CD pod(s)
  ## ref: https://kubernetes.io/docs/concepts/workloads/pods/init-containers/
  ## e.g:
  ## initContainers:
  ##  - name: your-image-name
  ##    image: your-image
  ##    imagePullPolicy: Always
  ##    command: ['sh', '-c', 'echo "hello world"']
  ##
  initContainers: []

## @section Argo CD ApplicationSet controller parameters

## ApplicationSet controller
##
applicationSet:
  ## @param applicationSet.enabled Enable ApplicationSet controller
  ##
  enabled: false
  ## @param applicationSet.replicaCount The number of ApplicationSet controller pods to run
  ##
  replicaCount: 1
  ## @param applicationSet.command Override default container command (useful when using custom images)
  ##
  command: []
  ## Arguments that will be used by default for the application controller
  ## @param applicationSet.defaultArgs.enableLeaderElection Enable leader election
  ## @param applicationSet.defaultArgs.policy Default policy
  ## @param applicationSet.defaultArgs.debug Enable debug mode
  ## @param applicationSet.defaultArgs.dryRun Enable dry-run mode
  ##
  defaultArgs:
    enableLeaderElection: false
    policy: "sync"
    debug: false
    dryRun: false
  ## @param applicationSet.args Override default container args (useful when using custom images). Overrides the defaultArgs.
  ##
  args: []
  ## @param applicationSet.extraArgs Add extra arguments to the default arguments for the Argo CD applicationSet controller
  ##
  extraArgs: []
  ## Argo CD applicationSet controller log format: text|json
  ## @param applicationSet.logFormat Format for the Argo CD applicationSet controller logs. Options: [text, json]
  ##
  logFormat: text
  ## Argo CD applicationSet controller log level
  ## @param applicationSet.logLevel Log level for the Argo CD applicationSet controller
  ##
  logLevel: info
  ## Argo CD applicationSet controller ports
  ## @param applicationSet.containerPorts.metrics Argo CD applicationSet controller metrics port number
  ## @param applicationSet.containerPorts.probe Argo CD applicationSet controller probe port number
  ##
  containerPorts:
    metrics: 8085
    probe: 8081
  ## Metrics configuration for Argo CD applicationSet controller
  ##
  metrics:
    ## @param applicationSet.metrics.enabled Enable Argo CD applicationSet controller metrics
    ##
    enabled: false
    service:
      ## @param applicationSet.metrics.service.type Argo CD applicationSet controller service type
      ##
      type: ClusterIP
      ## @param applicationSet.metrics.service.port Argo CD applicationSet controller metrics service port
      ##
      port: 8085
      ## Node ports to expose
      ## @param applicationSet.metrics.service.nodePort Node port for the applicationSet controller service
      ## NOTE: choose port between <30000-32767>
      ##
      nodePort: ""
      ## @param applicationSet.metrics.service.clusterIP Argo CD applicationSet controller metrics service Cluster IP
      ## e.g.:
      ## clusterIP: None
      ##
      clusterIP: ""
      ## @param applicationSet.metrics.service.loadBalancerIP Argo CD applicationSet controller service Load Balancer IP
      ## ref: https://kubernetes.io/docs/concepts/services-networking/service/#type-loadbalancer
      ##
      loadBalancerIP: ""
      ## @param applicationSet.metrics.service.loadBalancerSourceRanges Argo CD applicationSet controller service Load Balancer sources
      ## ref: https://kubernetes.io/docs/tasks/access-application-cluster/configure-cloud-provider-firewall/#restrict-access-for-loadbalancer-service
      ## e.g:
      ## loadBalancerSourceRanges:
      ##   - 10.10.10.0/24
      ##
      loadBalancerSourceRanges: []
      ## @param applicationSet.metrics.service.externalTrafficPolicy Argo CD applicationSet controller service external traffic policy
      ## ref https://kubernetes.io/docs/tasks/access-application-cluster/create-external-load-balancer/#preserving-the-client-source-ip
      ##
      externalTrafficPolicy: Cluster
      ## @param applicationSet.metrics.service.annotations Additional custom annotations for Argo CD applicationSet controller service
      ##
      annotations: {}
      ## @param applicationSet.metrics.service.sessionAffinity Session Affinity for Kubernetes service, can be "None" or "ClientIP"
      ## If "ClientIP", consecutive client requests will be directed to the same Pod
      ## ref: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies
      ##
      sessionAffinity: None
      ## @param applicationSet.metrics.service.sessionAffinityConfig Additional settings for the sessionAffinity
      ## sessionAffinityConfig:
      ##   clientIP:
      ##     timeoutSeconds: 300
      ##
      sessionAffinityConfig: {}
    ## Argo CD applicationSet controller metrics service monitor configuration
    ##
    serviceMonitor:
      ## @param applicationSet.metrics.serviceMonitor.enabled Create ServiceMonitor Resource for scraping metrics using PrometheusOperator
      ##
      enabled: false
      ## @param applicationSet.metrics.serviceMonitor.namespace Namespace which Prometheus is running in
      ## e.g:
      ## namespace: monitoring
      ##
      namespace: ""
      ## @param applicationSet.metrics.serviceMonitor.jobLabel The name of the label on the target service to use as the job name in prometheus.
      ##
      jobLabel: ""
      ## @param applicationSet.metrics.serviceMonitor.interval Interval at which metrics should be scraped
      ## ref: https://github.com/coreos/prometheus-operator/blob/master/Documentation/api.md#endpoint
      ##
      interval: 30s
      ## @param applicationSet.metrics.serviceMonitor.scrapeTimeout Timeout after which the scrape is ended
      ## ref: https://github.com/coreos/prometheus-operator/blob/master/Documentation/api.md#endpoint
      ##
      scrapeTimeout: 10s
      ## @param applicationSet.metrics.serviceMonitor.relabelings RelabelConfigs to apply to samples before scraping
      ## ref: https://github.com/coreos/prometheus-operator/blob/master/Documentation/api.md#relabelconfig
      ##
      relabelings: []
      ## @param applicationSet.metrics.serviceMonitor.metricRelabelings MetricRelabelConfigs to apply to samples before ingestion
      ## ref: https://github.com/coreos/prometheus-operator/blob/master/Documentation/api.md#relabelconfig
      ##
      metricRelabelings: []
      ## @param applicationSet.metrics.serviceMonitor.selector ServiceMonitor selector labels
      ## ref: https://github.com/bitnami/charts/tree/main/bitnami/prometheus-operator#prometheus-configuration
      ##
      ## selector:
      ##   prometheus: my-prometheus
      ##
      selector: {}
      ## @param applicationSet.metrics.serviceMonitor.honorLabels honorLabels chooses the metric's labels on collisions with target labels
      ##
      honorLabels: false
  ## Argo CD applicationSet controller service parameters
  ##
  service:
    ## @param applicationSet.service.type Argo CD applicationSet controller service type
    ##
    type: ClusterIP
    ## @param applicationSet.service.port Argo CD applicationSet controller service port
    ##
    port: 7000

    ## Node ports to expose
    ## @param applicationSet.service.nodePort Node port for Argo CD applicationSet controller service
    ## NOTE: choose port between <30000-32767>
    ##
    nodePort: ""
    ## @param applicationSet.service.clusterIP Argo CD applicationSet controller service Cluster IP
    ## e.g.:
    ## clusterIP: None
    ##
    clusterIP: ""
    ## @param applicationSet.service.loadBalancerIP Argo CD applicationSet controller service Load Balancer IP
    ## ref: https://kubernetes.io/docs/concepts/services-networking/service/#type-loadbalancer
    ##
    loadBalancerIP: ""
    ## @param applicationSet.service.loadBalancerSourceRanges Argo CD applicationSet controller service Load Balancer sources
    ## ref: https://kubernetes.io/docs/tasks/access-application-cluster/configure-cloud-provider-firewall/#restrict-access-for-loadbalancer-service
    ## e.g:
    ## loadBalancerSourceRanges:
    ##   - 10.10.10.0/24
    ##
    loadBalancerSourceRanges: []
    ## @param applicationSet.service.externalTrafficPolicy Argo CD applicationSet controller service external traffic policy
    ## ref https://kubernetes.io/docs/tasks/access-application-cluster/create-external-load-balancer/#preserving-the-client-source-ip
    ##
    externalTrafficPolicy: Cluster
    ## @param applicationSet.service.annotations Additional custom annotations for Argo CD applicationSet controller service
    ##
    annotations: {}
    ## @param applicationSet.service.extraPorts Extra ports to expose (normally used with the `sidecar` value)
    ##
    extraPorts: []
    ## @param applicationSet.service.sessionAffinity Session Affinity for Kubernetes service, can be "None" or "ClientIP"
    ## If "ClientIP", consecutive client requests will be directed to the same Pod
    ## ref: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies
    ##
    sessionAffinity: None
    ## @param applicationSet.service.sessionAffinityConfig Additional settings for the sessionAffinity
    ## sessionAffinityConfig:
    ##   clientIP:
    ##     timeoutSeconds: 300
    ##
    sessionAffinityConfig: {}
  ## ServiceAccount configuration for the Argo CD applicationSet controller
  ##
  serviceAccount:
    ## @param applicationSet.serviceAccount.create Specifies whether a ServiceAccount should be created
    ##
    create: true
    ## @param applicationSet.serviceAccount.name The name of the ServiceAccount to use.
    ## If not set and create is true, a name is generated using the common.names.fullname template
    ##
    name: ""
    ## @param applicationSet.serviceAccount.automountServiceAccountToken Automount service account token for the applicationSet controller service account
    ##
    automountServiceAccountToken: true
    ## @param applicationSet.serviceAccount.annotations Annotations for service account. Evaluated as a template. Only used if `create` is `true`.
    ##
    annotations: {}
  ## @param applicationSet.podAffinityPreset Pod affinity preset. Ignored if `applicationSet.affinity` is set. Allowed values: `soft` or `hard`
  ## ref: https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#inter-pod-affinity-and-anti-affinity
  ##
  podAffinityPreset: ""
  ## @param applicationSet.podAntiAffinityPreset Pod anti-affinity preset. Ignored if `applicationSet.affinity` is set. Allowed values: `soft` or `hard`
  ## ref: https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#inter-pod-affinity-and-anti-affinity
  ##
  podAntiAffinityPreset: soft
  ## Node applicationSet.affinity preset
  ## ref: https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#node-affinity
  ##
  nodeAffinityPreset:
    ## @param applicationSet.nodeAffinityPreset.type Node affinity preset type. Ignored if `applicationSet.affinity` is set. Allowed values: `soft` or `hard`
    ##
    type: ""
    ## @param applicationSet.nodeAffinityPreset.key Node label key to match. Ignored if `applicationSet.affinity` is set
    ##
    key: ""
    ## @param applicationSet.nodeAffinityPreset.values Node label values to match. Ignored if `applicationSet.affinity` is set
    ## E.g.
    ## values:
    ##   - e2e-az1
    ##   - e2e-az2
    ##
    values: []
  ## @param applicationSet.affinity Affinity for Argo CD applicationSet controller pods assignment
  ## ref: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity
  ## NOTE: `applicationSet.podAffinityPreset`, `applicationSet.podAntiAffinityPreset`, and `applicationSet.nodeAffinityPreset` will be ignored when it's set
  ##
  affinity: {}
  ## @param applicationSet.podAnnotations Annotations for Argo CD applicationSet controller pods
  ## ref: https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/
  ##
  podAnnotations: {}
  ## @param applicationSet.podLabels Extra labels for Argo CD applicationSet controller pods
  ## ref: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/
  ##
  podLabels: {}
  ## Configure Container Security Context
  ## ref: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod
  ## @param applicationSet.containerSecurityContext.enabled Enabled Argo CD applicationSet controller containers' Security Context
  ## @param applicationSet.containerSecurityContext.runAsUser Set Argo CD applicationSet controller containers' Security Context runAsUser
  ## @param applicationSet.containerSecurityContext.allowPrivilegeEscalation Set Argo CD applicationSet controller containers' Security Context allowPrivilegeEscalation
  ## @param applicationSet.containerSecurityContext.capabilities.drop Set Argo CD applicationSet controller containers' Security Context capabilities to be dropped
  ## @param applicationSet.containerSecurityContext.readOnlyRootFilesystem Set Argo CD applicationSet controller containers' Security Context readOnlyRootFilesystem
  ## @param applicationSet.containerSecurityContext.runAsNonRoot Set Argo CD applicationSet controller container's Security Context runAsNonRoot
  ##
  containerSecurityContext:
    enabled: true
    runAsUser: 1001
    allowPrivilegeEscalation: false
    capabilities:
      drop:
      - all
    readOnlyRootFilesystem: false
    runAsNonRoot: true
  ## @param applicationSet.livenessProbe.enabled Enable livenessProbe on Argo CD applicationSet controller nodes
  ## @param applicationSet.livenessProbe.initialDelaySeconds Initial delay seconds for livenessProbe
  ## @param applicationSet.livenessProbe.periodSeconds Period seconds for livenessProbe
  ## @param applicationSet.livenessProbe.timeoutSeconds Timeout seconds for livenessProbe
  ## @param applicationSet.livenessProbe.failureThreshold Failure threshold for livenessProbe
  ## @param applicationSet.livenessProbe.successThreshold Success threshold for livenessProbe
  ##
  livenessProbe:
    enabled: true
    initialDelaySeconds: 10
    periodSeconds: 10
    timeoutSeconds: 1
    failureThreshold: 3
    successThreshold: 1
  ## @param applicationSet.readinessProbe.enabled Enable readinessProbe on Argo CD applicationSet controller nodes
  ## @param applicationSet.readinessProbe.initialDelaySeconds Initial delay seconds for readinessProbe
  ## @param applicationSet.readinessProbe.periodSeconds Period seconds for readinessProbe
  ## @param applicationSet.readinessProbe.timeoutSeconds Timeout seconds for readinessProbe
  ## @param applicationSet.readinessProbe.failureThreshold Failure threshold for readinessProbe
  ## @param applicationSet.readinessProbe.successThreshold Success threshold for readinessProbe
  ##
  readinessProbe:
    enabled: true
    initialDelaySeconds: 10
    periodSeconds: 10
    timeoutSeconds: 1
    failureThreshold: 3
    successThreshold: 1
  ## @param applicationSet.customLivenessProbe Custom livenessProbe that overrides the default one
  ##
  customLivenessProbe: {}
  ## @param applicationSet.customReadinessProbe Custom readinessProbe that overrides the default one
  ##
  customReadinessProbe: {}
  ## Argo CD applicationSet controller resource requests and limits
  ## ref: https://kubernetes.io/docs/user-guide/compute-resources/
  ## @param applicationSet.resources.limits The resources limits for the Argo CD applicationSet controller containers
  ## @param applicationSet.resources.requests The requested resources for the Argo CD applicationSet controller containers
  ##
  resources:
    limits: {}
    requests: {}
  ## Configure Pods Security Context
  ## ref: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod
  ## @param applicationSet.podSecurityContext.enabled Enabled Argo CD applicationSet controller pods' Security Context
  ## @param applicationSet.podSecurityContext.fsGroup Set Argo CD applicationSet controller pod's Security Context fsGroup
  ##
  podSecurityContext:
    enabled: true
    fsGroup: 1001
  ## @param applicationSet.nodeSelector Node labels for Argo CD applicationSet controller pods assignment
  ## ref: https://kubernetes.io/docs/user-guide/node-selection/
  ##
  nodeSelector: {}
  ## @param applicationSet.tolerations Tolerations for Argo CD applicationSet controller pods assignment
  ## ref: https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/
  ##
  tolerations: []
  ## @param applicationSet.updateStrategy.type Argo CD applicationSet controller statefulset strategy type
  ## ref: https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/#update-strategies
  ##
  updateStrategy:
    ## StrategyType
    ## Can be set to RollingUpdate or OnDelete
    ##
    type: RollingUpdate
  ## @param applicationSet.priorityClassName Argo CD applicationSet controller pods' priorityClassName
  ##
  priorityClassName: ""
  ## @param applicationSet.extraVolumes Optionally specify extra list of additional volumes for the Argo CD applicationSet controller pod(s)
  ##
  extraVolumes: []
  ## @param applicationSet.extraVolumeMounts Optionally specify extra list of additional volumeMounts for the Argo CD applicationSet controller container(s)
  ##
  extraVolumeMounts: []
  ## @param applicationSet.extraEnvVars Array with extra environment variables to add to Argo CD applicationSet controller nodes
  ## e.g:
  ## extraEnvVars:
  ##   - name: FOO
  ##     value: "bar"
  ##
  extraEnvVars: []
  ## @param applicationSet.extraEnvVarsCM Name of existing ConfigMap containing extra env vars for Argo CD applicationSet controller nodes
  ##
  extraEnvVarsCM: ""
  ## @param applicationSet.extraEnvVarsSecret Name of existing Secret containing extra env vars for Argo CD applicationSet controller nodes
  ##
  extraEnvVarsSecret: ""
  ## Webhook for the Git Generator
  ## Ref: https://argocd-applicationset.readthedocs.io/en/master/Generators-Git/#webhook-configuration)
  ##
  webhook:
    ingress:
      ## @param applicationSet.webhook.ingress.enabled Enable an ingress resource for Webhooks
      ##
      enabled: false
      ## DEPRECATED: Use server.ingress.annotations instead of server.ingress.certManager
      ## certManager: false
      ##
      ## @param applicationSet.webhook.ingress.annotations Additional ingress annotations
      ##
      annotations: {}
      ## @param applicationSet.webhook.ingress.labels Additional ingress labels
      ##
      labels: {}
      ## @param applicationSet.webhook.ingress.ingressClassName Defines which ingress controller will implement the resource
      ##
      ingressClassName: ""
      ## @param applicationSet.webhook.ingress.hostname Ingress hostname for the Argo CD applicationSet ingress
      ## Hostname must be provided if Ingress is enabled.
      ##
      hostname: ""
      ## @param applicationSet.webhook.ingress.path Argo CD applicationSet ingress path
      ##
      path: /api/webhook
      ## @param applicationSet.webhook.ingress.pathType Ingress path type. One of `Exact`, `Prefix` or `ImplementationSpecific`
      ##
      pathType: Prefix
      ## @param applicationSet.webhook.ingress.extraHosts Extra hosts array for the Argo CD applicationSet ingress
      ## The list of additional hostnames to be covered with this ingress record.
      ## Most likely the hostname above will be enough, but in the event more hosts are needed, this is an array
      ##
      extraHosts: []
      ## @param applicationSet.webhook.ingress.extraPaths Extra paths for the Argo CD applicationSet ingress
      ## Any additional arbitrary paths that may need to be added to the ingress under the main host.
      ## For example: The ALB ingress controller requires a special rule for handling SSL redirection.
      ##
      extraPaths: []
      ## - path: /*
      ##   backend:
      ##     serviceName: ssl-redirect
      ##     servicePort: use-annotation
      ##
      ## @param applicationSet.webhook.ingress.extraTls Extra TLS configuration for the Argo CD applicationSet ingress
      ## The tls configuration for additional hostnames to be covered with this ingress record.
      ## see: https://kubernetes.io/docs/concepts/services-networking/ingress/#tls
      ##
      extraTls: []
      ## - hosts:
      ##     - argocd.server.local
      ##   secretName: argocd.server.local-tls
      ##
      ## @param applicationSet.webhook.ingress.tls Ingress TLS configuration
      ##
      tls: []

## @section Argo CD notifications controller parameters

## notifications controller
##
notifications:
  ## @param notifications.enabled Enable notifications controller
  ##
  enabled: false
  ## @param notifications.command Override default container command (useful when using custom images)
  ##
  command: []
  ## @param notifications.args Override default container args (useful when using custom images).
  ##
  args: []
  ## @param notifications.extraArgs Add extra arguments to the default arguments for the Argo CD notifications controller
  ##
  extraArgs: []
  ## Argo CD notifications controller log format: text|json
  ## @param notifications.logFormat Format for the Argo CD notifications controller logs. Options: [text, json]
  ##
  logFormat: text
  ## Argo CD notifications controller log level
  ## @param notifications.logLevel Log level for the Argo CD notifications controller
  ##
  logLevel: info
  ## Argo CD notifications controller ports
  ## @param notifications.containerPorts.metrics Argo CD notifications controller metrics port number
  ##
  containerPorts:
    metrics: 8085
  ## Metrics configuration for Argo CD notifications controller
  ##
  metrics:
    ## @param notifications.metrics.enabled Enable Argo CD notifications controller metrics
    ##
    enabled: false
    service:
      ## @param notifications.metrics.service.type Argo CD notifications controller service type
      ##
      type: ClusterIP
      ## @param notifications.metrics.service.port Argo CD notifications controller metrics service port
      ##
      port: 8085
      ## Node ports to expose
      ## @param notifications.metrics.service.nodePort Node port for the notifications controller service
      ## NOTE: choose port between <30000-32767>
      ##
      nodePort: ""
      ## @param notifications.metrics.service.clusterIP Argo CD notifications controller metrics service Cluster IP
      ## e.g.:
      ## clusterIP: None
      ##
      clusterIP: ""
      ## @param notifications.metrics.service.loadBalancerIP Argo CD notifications controller service Load Balancer IP
      ## ref: https://kubernetes.io/docs/concepts/services-networking/service/#type-loadbalancer
      ##
      loadBalancerIP: ""
      ## @param notifications.metrics.service.loadBalancerSourceRanges Argo CD notifications controller service Load Balancer sources
      ## ref: https://kubernetes.io/docs/tasks/access-application-cluster/configure-cloud-provider-firewall/#restrict-access-for-loadbalancer-service
      ## e.g:
      ## loadBalancerSourceRanges:
      ##   - 10.10.10.0/24
      ##
      loadBalancerSourceRanges: []
      ## @param notifications.metrics.service.externalTrafficPolicy Argo CD notifications controller service external traffic policy
      ## ref https://kubernetes.io/docs/tasks/access-application-cluster/create-external-load-balancer/#preserving-the-client-source-ip
      ##
      externalTrafficPolicy: Cluster
      ## @param notifications.metrics.service.annotations Additional custom annotations for Argo CD notifications controller service
      ##
      annotations: {}
      ## @param notifications.metrics.service.sessionAffinity Session Affinity for Kubernetes service, can be "None" or "ClientIP"
      ## If "ClientIP", consecutive client requests will be directed to the same Pod
      ## ref: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies
      ##
      sessionAffinity: None
      ## @param notifications.metrics.service.sessionAffinityConfig Additional settings for the sessionAffinity
      ## sessionAffinityConfig:
      ##   clientIP:
      ##     timeoutSeconds: 300
      ##
      sessionAffinityConfig: {}
    ## Argo CD notifications controller metrics service monitor configuration
    ##
    serviceMonitor:
      ## @param notifications.metrics.serviceMonitor.enabled Create ServiceMonitor Resource for scraping metrics using PrometheusOperator
      ##
      enabled: false
      ## @param notifications.metrics.serviceMonitor.namespace Namespace which Prometheus is running in
      ## e.g:
      ## namespace: monitoring
      ##
      namespace: ""
      ## @param notifications.metrics.serviceMonitor.jobLabel The name of the label on the target service to use as the job name in prometheus.
      ##
      jobLabel: ""
      ## @param notifications.metrics.serviceMonitor.interval Interval at which metrics should be scraped
      ## ref: https://github.com/coreos/prometheus-operator/blob/master/Documentation/api.md#endpoint
      ##
      interval: 30s
      ## @param notifications.metrics.serviceMonitor.scrapeTimeout Timeout after which the scrape is ended
      ## ref: https://github.com/coreos/prometheus-operator/blob/master/Documentation/api.md#endpoint
      ##
      scrapeTimeout: 10s
      ## @param notifications.metrics.serviceMonitor.relabelings RelabelConfigs to apply to samples before scraping
      ## ref: https://github.com/coreos/prometheus-operator/blob/master/Documentation/api.md#relabelconfig
      ##
      relabelings: []
      ## @param notifications.metrics.serviceMonitor.metricRelabelings MetricRelabelConfigs to apply to samples before ingestion
      ## ref: https://github.com/coreos/prometheus-operator/blob/master/Documentation/api.md#relabelconfig
      ##
      metricRelabelings: []
      ## @param notifications.metrics.serviceMonitor.selector ServiceMonitor selector labels
      ## ref: https://github.com/bitnami/charts/tree/main/bitnami/prometheus-operator#prometheus-configuration
      ##
      ## selector:
      ##   prometheus: my-prometheus
      ##
      selector: {}
      ## @param notifications.metrics.serviceMonitor.honorLabels honorLabels chooses the metric's labels on collisions with target labels
      ##
      honorLabels: false
  ## Argo CD notifications controller service parameters
  ##
  service:
    ## @param notifications.service.type Argo CD notifications controller service type
    ##
    type: ClusterIP
    ## @param notifications.service.port Argo CD notifications controller service port
    ##
    port: 7000

    ## Node ports to expose
    ## @param notifications.service.nodePort Node port for Argo CD notifications controller service
    ## NOTE: choose port between <30000-32767>
    ##
    nodePort: ""
    ## @param notifications.service.clusterIP Argo CD notifications controller service Cluster IP
    ## e.g.:
    ## clusterIP: None
    ##
    clusterIP: ""
    ## @param notifications.service.loadBalancerIP Argo CD notifications controller service Load Balancer IP
    ## ref: https://kubernetes.io/docs/concepts/services-networking/service/#type-loadbalancer
    ##
    loadBalancerIP: ""
    ## @param notifications.service.loadBalancerSourceRanges Argo CD notifications controller service Load Balancer sources
    ## ref: https://kubernetes.io/docs/tasks/access-application-cluster/configure-cloud-provider-firewall/#restrict-access-for-loadbalancer-service
    ## e.g:
    ## loadBalancerSourceRanges:
    ##   - 10.10.10.0/24
    ##
    loadBalancerSourceRanges: []
    ## @param notifications.service.externalTrafficPolicy Argo CD notifications controller service external traffic policy
    ## ref https://kubernetes.io/docs/tasks/access-application-cluster/create-external-load-balancer/#preserving-the-client-source-ip
    ##
    externalTrafficPolicy: Cluster
    ## @param notifications.service.annotations Additional custom annotations for Argo CD notifications controller service
    ##
    annotations: {}
    ## @param notifications.service.extraPorts Extra ports to expose (normally used with the `sidecar` value)
    ##
    extraPorts: []
    ## @param notifications.service.sessionAffinity Session Affinity for Kubernetes service, can be "None" or "ClientIP"
    ## If "ClientIP", consecutive client requests will be directed to the same Pod
    ## ref: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies
    ##
    sessionAffinity: None
    ## @param notifications.service.sessionAffinityConfig Additional settings for the sessionAffinity
    ## sessionAffinityConfig:
    ##   clientIP:
    ##     timeoutSeconds: 300
    ##
    sessionAffinityConfig: {}
  ## ServiceAccount configuration for the Argo CD notifications controller
  ##
  serviceAccount:
    ## @param notifications.serviceAccount.create Specifies whether a ServiceAccount should be created
    ##
    create: true
    ## @param notifications.serviceAccount.name The name of the ServiceAccount to use.
    ## If not set and create is true, a name is generated using the common.names.fullname template
    ##
    name: ""
    ## @param notifications.serviceAccount.automountServiceAccountToken Automount service account token for the notifications controller service account
    ##
    automountServiceAccountToken: true
    ## @param notifications.serviceAccount.annotations Annotations for service account. Evaluated as a template. Only used if `create` is `true`.
    ##
    annotations: {}
  ## @param notifications.podAffinityPreset Pod affinity preset. Ignored if `notifications.affinity` is set. Allowed values: `soft` or `hard`
  ## ref: https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#inter-pod-affinity-and-anti-affinity
  ##
  podAffinityPreset: ""
  ## @param notifications.podAntiAffinityPreset Pod anti-affinity preset. Ignored if `notifications.affinity` is set. Allowed values: `soft` or `hard`
  ## ref: https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#inter-pod-affinity-and-anti-affinity
  ##
  podAntiAffinityPreset: soft
  ## Node notifications.affinity preset
  ## ref: https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#node-affinity
  ##
  nodeAffinityPreset:
    ## @param notifications.nodeAffinityPreset.type Node affinity preset type. Ignored if `notifications.affinity` is set. Allowed values: `soft` or `hard`
    ##
    type: ""
    ## @param notifications.nodeAffinityPreset.key Node label key to match. Ignored if `notifications.affinity` is set
    ##
    key: ""
    ## @param notifications.nodeAffinityPreset.values Node label values to match. Ignored if `notifications.affinity` is set
    ## E.g.
    ## values:
    ##   - e2e-az1
    ##   - e2e-az2
    ##
    values: []
  ## @param notifications.affinity Affinity for Argo CD notifications controller pods assignment
  ## ref: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity
  ## NOTE: `notifications.podAffinityPreset`, `notifications.podAntiAffinityPreset`, and `notifications.nodeAffinityPreset` will be ignored when it's set
  ##
  affinity: {}
  ## @param notifications.podAnnotations Annotations for Argo CD notifications controller pods
  ## ref: https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/
  ##
  podAnnotations: {}
  ## @param notifications.podLabels Extra labels for Argo CD notifications controller pods
  ## ref: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/
  ##
  podLabels: {}
  ## Configure Container Security Context
  ## ref: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod
  ## @param notifications.containerSecurityContext.enabled Enabled Argo CD notifications controller containers' Security Context
  ## @param notifications.containerSecurityContext.runAsUser Set Argo CD notifications controller containers' Security Context runAsUser
  ## @param notifications.containerSecurityContext.allowPrivilegeEscalation Set Argo CD notifications controller containers' Security Context allowPrivilegeEscalation
  ## @param notifications.containerSecurityContext.capabilities.drop Set Argo CD notifications controller containers' Security Context capabilities to be dropped
  ## @param notifications.containerSecurityContext.readOnlyRootFilesystem Set Argo CD notifications controller containers' Security Context readOnlyRootFilesystem
  ## @param notifications.containerSecurityContext.runAsNonRoot Set Argo CD notifications controller container's Security Context runAsNonRoot
  ##
  containerSecurityContext:
    enabled: true
    runAsUser: 1001
    allowPrivilegeEscalation: false
    capabilities:
      drop:
      - all
    readOnlyRootFilesystem: false
    runAsNonRoot: true
  ## Argo CD notifications controller resource requests and limits
  ## ref: https://kubernetes.io/docs/user-guide/compute-resources/
  ## @param notifications.resources.limits The resources limits for the Argo CD notifications controller containers
  ## @param notifications.resources.requests The requested resources for the Argo CD notifications controller containers
  ##
  resources:
    limits: {}
    requests: {}
  ## Configure Pods Security Context
  ## ref: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod
  ## @param notifications.podSecurityContext.enabled Enabled Argo CD notifications controller pods' Security Context
  ## @param notifications.podSecurityContext.fsGroup Set Argo CD notifications controller pod's Security Context fsGroup
  ##
  podSecurityContext:
    enabled: true
    fsGroup: 1001
  ## @param notifications.nodeSelector Node labels for Argo CD notifications controller pods assignment
  ## ref: https://kubernetes.io/docs/user-guide/node-selection/
  ##
  nodeSelector: {}
  ## @param notifications.tolerations Tolerations for Argo CD notifications controller pods assignment
  ## ref: https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/
  ##
  tolerations: []
  ## @param notifications.priorityClassName Argo CD notifications controller pods' priorityClassName
  ##
  priorityClassName: ""
  ## @param notifications.extraVolumes Optionally specify extra list of additional volumes for the Argo CD notifications controller pod(s)
  ##
  extraVolumes: []
  ## @param notifications.extraVolumeMounts Optionally specify extra list of additional volumeMounts for the Argo CD notifications controller container(s)
  ##
  extraVolumeMounts: []
  ## @param notifications.extraEnvVars Array with extra environment variables to add to Argo CD notifications controller nodes
  ## e.g:
  ## extraEnvVars:
  ##   - name: FOO
  ##     value: "bar"
  ##
  extraEnvVars: []
  ## @param notifications.extraEnvVarsCM Name of existing ConfigMap containing extra env vars for Argo CD notifications controller nodes
  ##
  extraEnvVarsCM: ""
  ## @param notifications.extraEnvVarsSecret Name of existing Secret containing extra env vars for Argo CD notifications controller nodes
  ##
  extraEnvVarsSecret: ""
  ## Webhook for the Git Generator
  ## Ref: https://argocd-notifications.readthedocs.io/en/master/Generators-Git/#webhook-configuration)
  ##
  webhook:
    ingress:
      ## @param notifications.webhook.ingress.enabled Enable an ingress resource for Webhooks
      ##
      enabled: false
      ## DEPRECATED: Use server.ingress.annotations instead of server.ingress.certManager
      ## certManager: false
      ##
      ## @param notifications.webhook.ingress.annotations Additional ingress annotations
      ##
      annotations: {}
      ## @param notifications.webhook.ingress.labels Additional ingress labels
      ##
      labels: {}
      ## @param notifications.webhook.ingress.ingressClassName Defines which ingress controller will implement the resource
      ##
      ingressClassName: ""
      ## @param notifications.webhook.ingress.hostname Ingress hostname for the Argo CD notifications ingress
      ## Hostname must be provided if Ingress is enabled.
      ##
      hostname: ""
      ## @param notifications.webhook.ingress.path Argo CD notifications ingress path
      ##
      path: /api/webhook
      ## @param notifications.webhook.ingress.pathType Ingress path type. One of `Exact`, `Prefix` or `ImplementationSpecific`
      ##
      pathType: Prefix
      ## @param notifications.webhook.ingress.extraHosts Extra hosts array for the Argo CD notifications ingress
      ## The list of additional hostnames to be covered with this ingress record.
      ## Most likely the hostname above will be enough, but in the event more hosts are needed, this is an array
      ##
      extraHosts: []
      ## @param notifications.webhook.ingress.extraPaths Extra paths for the Argo CD notifications ingress
      ## Any additional arbitrary paths that may need to be added to the ingress under the main host.
      ## For example: The ALB ingress controller requires a special rule for handling SSL redirection.
      ##
      extraPaths: []
      ## - path: /*
      ##   backend:
      ##     serviceName: ssl-redirect
      ##     servicePort: use-annotation
      ##
      ## @param notifications.webhook.ingress.extraTls Extra TLS configuration for the Argo CD notifications ingress
      ## The tls configuration for additional hostnames to be covered with this ingress record.
      ## see: https://kubernetes.io/docs/concepts/services-networking/ingress/#tls
      ##
      extraTls: []
      ## - hosts:
      ##     - argocd.server.local
      ##   secretName: argocd.server.local-tls
      ##
      ## @param notifications.webhook.ingress.tls Ingress TLS configuration
      ##
      tls: []

  ## The optional bot component simplifies managing subscriptions
  ## For more information: https://argocd-notifications.readthedocs.io/en/stable/bots/overview/
  bots:
    slack:
      ## @param notifications.bots.slack.enabled Enable notifications controller
      ##
      enabled: false

      ## @param notifications.bots.slack.command Override default container command (useful when using custom images)
      ##
      command: []

      ## @param notifications.bots.slack.args Override default container args (useful when using custom images).
      ##
      args: []

      ## @param notifications.bots.slack.extraArgs Add extra arguments to the default arguments for the Argo CD Slack bot
      ##
      extraArgs: []

      ## Argo CD Slack bot service parameters
      ##
      service:
        ## @param notifications.bots.slack.service.type Argo CD Slack bot service type
        ##
        type: LoadBalancer
        ## @param notifications.bots.slack.service.port Argo CD Slack bot service port
        ##
        port: 80

        ## Node ports to expose
        ## @param notifications.bots.slack.service.nodePort Node port for Argo CD Slack bot service
        ## NOTE: choose port between <30000-32767>
        ##
        nodePort: ""
        ## @param notifications.bots.slack.service.clusterIP Argo CD Slack bot service Cluster IP
        ## e.g.:
        ## clusterIP: None
        ##
        clusterIP: ""
        ## @param notifications.bots.slack.service.loadBalancerIP Argo CD Slack bot service Load Balancer IP
        ## ref: https://kubernetes.io/docs/concepts/services-networking/service/#type-loadbalancer
        ##
        loadBalancerIP: ""
        ## @param notifications.bots.slack.service.loadBalancerSourceRanges Argo CD Slack bot service Load Balancer sources
        ## ref: https://kubernetes.io/docs/tasks/access-application-cluster/configure-cloud-provider-firewall/#restrict-access-for-loadbalancer-service
        ## e.g:
        ## loadBalancerSourceRanges:
        ##   - 10.10.10.0/24
        ##
        loadBalancerSourceRanges: []
        ## @param notifications.bots.slack.service.externalTrafficPolicy Argo CD Slack bot service external traffic policy
        ## ref https://kubernetes.io/docs/tasks/access-application-cluster/create-external-load-balancer/#preserving-the-client-source-ip
        ##
        externalTrafficPolicy: Cluster
        ## @param notifications.bots.slack.service.annotations Additional custom annotations for Argo CD Slack bot service
        ##
        annotations: {}
        ## @param notifications.bots.slack.service.extraPorts Extra ports to expose (normally used with the `sidecar` value)
        ##
        extraPorts: []
        ## @param notifications.bots.slack.service.sessionAffinity Session Affinity for Kubernetes service, can be "None" or "ClientIP"
        ## If "ClientIP", consecutive client requests will be directed to the same Pod
        ## ref: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies
        ##
        sessionAffinity: None
        ## @param notifications.bots.slack.service.sessionAffinityConfig Additional settings for the sessionAffinity
        ## sessionAffinityConfig:
        ##   clientIP:
        ##     timeoutSeconds: 300
        ##
        sessionAffinityConfig: {}

      ## ServiceAccount configuration for the Argo CD Slack bot
      ##
      serviceAccount:
        ## @param notifications.bots.slack.serviceAccount.create Specifies whether a ServiceAccount should be created
        ##
        create: true
        ## @param notifications.bots.slack.serviceAccount.name The name of the ServiceAccount to use.
        ## If not set and create is true, a name is generated using the common.names.fullname template
        ##
        name: ""
        ## @param notifications.bots.slack.serviceAccount.automountServiceAccountToken Automount service account token for the notifications controller service account
        ##
        automountServiceAccountToken: true
        ## @param notifications.bots.slack.serviceAccount.annotations Annotations for service account. Evaluated as a template. Only used if `create` is `true`.
        ##
        annotations: {}

      ## @param notifications.bots.slack.podAffinityPreset Pod affinity preset. Ignored if `notifications.bots.slack.affinity` is set. Allowed values: `soft` or `hard`
      ## ref: https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#inter-pod-affinity-and-anti-affinity
      ##
      podAffinityPreset: ""
      ## @param notifications.bots.slack.podAntiAffinityPreset Pod anti-affinity preset. Ignored if `notifications.bots.slack.affinity` is set. Allowed values: `soft` or `hard`
      ## ref: https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#inter-pod-affinity-and-anti-affinity
      ##
      podAntiAffinityPreset: soft
      ## Node notifications.bots.slack.affinity preset
      ## ref: https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#node-affinity
      ##
      nodeAffinityPreset:
        ## @param notifications.bots.slack.nodeAffinityPreset.type Node affinity preset type. Ignored if `notifications.bots.slack.affinity` is set. Allowed values: `soft` or `hard`
        ##
        type: ""
        ## @param notifications.bots.slack.nodeAffinityPreset.key Node label key to match. Ignored if `notifications.bots.slack.affinity` is set
        ##
        key: ""
        ## @param notifications.bots.slack.nodeAffinityPreset.values Node label values to match. Ignored if `notifications.bots.slack.affinity` is set
        ## E.g.
        ## values:
        ##   - e2e-az1
        ##   - e2e-az2
        ##
        values: []
      ## @param notifications.bots.slack.affinity Affinity for Argo CD Slack bot pods assignment
      ## ref: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity
      ## NOTE: `notifications.bots.slack.podAffinityPreset`, `notifications.bots.slack.podAntiAffinityPreset`, and `notifications.bots.slack.nodeAffinityPreset` will be ignored when it's set
      ##
      affinity: {}
      ## @param notifications.bots.slack.podAnnotations Annotations for Argo CD Slack bot pods
      ## ref: https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/
      ##
      podAnnotations: {}
      ## @param notifications.bots.slack.podLabels Extra labels for Argo CD Slack bot pods
      ## ref: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/
      ##
      podLabels: {}
      ## Configure Container Security Context
      ## ref: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod
      ## @param notifications.bots.slack.containerSecurityContext.enabled Enabled Argo CD Slack bot containers' Security Context
      ## @param notifications.bots.slack.containerSecurityContext.runAsUser Set Argo CD Slack bot containers' Security Context runAsUser
      ## @param notifications.bots.slack.containerSecurityContext.allowPrivilegeEscalation Set Argo CD Slack bot containers' Security Context allowPrivilegeEscalation
      ## @param notifications.bots.slack.containerSecurityContext.capabilities.drop Set Argo CD Slack bot containers' Security Context capabilities to be dropped
      ## @param notifications.bots.slack.containerSecurityContext.readOnlyRootFilesystem Set Argo CD Slack bot containers' Security Context readOnlyRootFilesystem
      ## @param notifications.bots.slack.containerSecurityContext.runAsNonRoot Set Argo CD Slack bot container's Security Context runAsNonRoot
      ##
      containerSecurityContext:
        enabled: true
        runAsUser: 1001
        allowPrivilegeEscalation: false
        capabilities:
          drop:
          - all
        readOnlyRootFilesystem: false
        runAsNonRoot: true
      ## Argo CD Slack bot resource requests and limits
      ## ref: https://kubernetes.io/docs/user-guide/compute-resources/
      ## @param notifications.bots.slack.resources.limits The resources limits for the Argo CD Slack bot containers
      ## @param notifications.bots.slack.resources.requests The requested resources for the Argo CD Slack bot containers
      ##
      resources:
        limits: {}
        requests: {}
      ## Configure Pods Security Context
      ## ref: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod
      ## @param notifications.bots.slack.podSecurityContext.enabled Enabled Argo CD Slack bot pods' Security Context
      ## @param notifications.bots.slack.podSecurityContext.fsGroup Set Argo CD Slack bot pod's Security Context fsGroup
      ##
      podSecurityContext:
        enabled: true
        fsGroup: 1001
      ## @param notifications.bots.slack.nodeSelector Node labels for Argo CD Slack bot pods assignment
      ## ref: https://kubernetes.io/docs/user-guide/node-selection/
      ##
      nodeSelector: {}
      ## @param notifications.bots.slack.tolerations Tolerations for Argo CD Slack bot pods assignment
      ## ref: https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/
      ##
      tolerations: []
      ## @param notifications.bots.slack.priorityClassName Argo CD Slack bot pods' priorityClassName
      ##
      priorityClassName: ""
      ## @param notifications.bots.slack.extraVolumes Optionally specify extra list of additional volumes for the Argo CD Slack bot pod(s)
      ##
      extraVolumes: []
      ## @param notifications.bots.slack.extraVolumeMounts Optionally specify extra list of additional volumeMounts for the Argo CD Slack bot container(s)
      ##
      extraVolumeMounts: []
      ## @param notifications.bots.slack.extraEnvVars Array with extra environment variables to add to Argo CD Slack bot nodes
      ## e.g:
      ## extraEnvVars:
      ##   - name: FOO
      ##     value: "bar"
      ##
      extraEnvVars: []
      ## @param notifications.bots.slack.extraEnvVarsCM Name of existing ConfigMap containing extra env vars for Argo CD Slack bot nodes
      ##
      extraEnvVarsCM: ""
      ## @param notifications.bots.slack.extraEnvVarsSecret Name of existing Secret containing extra env vars for Argo CD Slack bot nodes
      ##
      extraEnvVarsSecret: ""


## @section Argo CD server Parameters

## Argo CD server configuration
##
server:
  ## @param server.replicaCount Number of Argo CD server replicas to deploy
  ##
  replicaCount: 1
  ## Configure extra options for Argo CD server containers' liveness and readiness probes
  ## ref: https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes/#configure-probes
  ## @param server.startupProbe.enabled Enable startupProbe on Argo CD server nodes
  ## @param server.startupProbe.initialDelaySeconds Initial delay seconds for startupProbe
  ## @param server.startupProbe.periodSeconds Period seconds for startupProbe
  ## @param server.startupProbe.timeoutSeconds Timeout seconds for startupProbe
  ## @param server.startupProbe.failureThreshold Failure threshold for startupProbe
  ## @param server.startupProbe.successThreshold Success threshold for startupProbe
  ##
  startupProbe:
    enabled: false
    initialDelaySeconds: 10
    periodSeconds: 10
    timeoutSeconds: 1
    failureThreshold: 3
    successThreshold: 1
  ## @param server.livenessProbe.enabled Enable livenessProbe on Argo CD server nodes
  ## @param server.livenessProbe.initialDelaySeconds Initial delay seconds for livenessProbe
  ## @param server.livenessProbe.periodSeconds Period seconds for livenessProbe
  ## @param server.livenessProbe.timeoutSeconds Timeout seconds for livenessProbe
  ## @param server.livenessProbe.failureThreshold Failure threshold for livenessProbe
  ## @param server.livenessProbe.successThreshold Success threshold for livenessProbe
  ##
  livenessProbe:
    enabled: true
    initialDelaySeconds: 10
    periodSeconds: 10
    timeoutSeconds: 1
    failureThreshold: 3
    successThreshold: 1
  ## @param server.readinessProbe.enabled Enable readinessProbe on Argo CD server nodes
  ## @param server.readinessProbe.initialDelaySeconds Initial delay seconds for readinessProbe
  ## @param server.readinessProbe.periodSeconds Period seconds for readinessProbe
  ## @param server.readinessProbe.timeoutSeconds Timeout seconds for readinessProbe
  ## @param server.readinessProbe.failureThreshold Failure threshold for readinessProbe
  ## @param server.readinessProbe.successThreshold Success threshold for readinessProbe
  ##
  readinessProbe:
    enabled: true
    initialDelaySeconds: 10
    periodSeconds: 10
    timeoutSeconds: 1
    failureThreshold: 3
    successThreshold: 1
  ## @param server.customStartupProbe Custom startupProbe that overrides the default one
  ##
  customStartupProbe: {}
  ## @param server.customLivenessProbe Custom livenessProbe that overrides the default one
  ##
  customLivenessProbe: {}
  ## @param server.customReadinessProbe Custom readinessProbe that overrides the default one
  ##
  customReadinessProbe: {}
  ## Argo CD server resource requests and limits
  ## ref: https://kubernetes.io/docs/user-guide/compute-resources/
  ## @param server.resources.limits The resources limits for the Argo CD server containers
  ## @param server.resources.requests The requested resources for the Argo CD server containers
  ##
  resources:
    limits: {}
    requests: {}
  ## Configure Pods Security Context
  ## ref: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod
  ## @param server.podSecurityContext.enabled Enabled Argo CD server pods' Security Context
  ## @param server.podSecurityContext.fsGroup Set Argo CD server pod's Security Context fsGroup
  ##
  podSecurityContext:
    enabled: true
    fsGroup: 1001
  ## Configure Container Security Context
  ## ref: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod
  ## @param server.containerSecurityContext.enabled Enabled Argo CD server containers' Security Context
  ## @param server.containerSecurityContext.runAsUser Set Argo CD server containers' Security Context runAsUser
  ## @param server.containerSecurityContext.allowPrivilegeEscalation Set Argo CD server containers' Security Context allowPrivilegeEscalation
  ## @param server.containerSecurityContext.capabilities.drop Set Argo CD containers' server Security Context capabilities to be dropped
  ## @param server.containerSecurityContext.readOnlyRootFilesystem Set Argo CD containers' server Security Context readOnlyRootFilesystem
  ## @param server.containerSecurityContext.runAsNonRoot Set Argo CD server containers' Security Context runAsNonRoot
  ##
  containerSecurityContext:
    enabled: true
    runAsUser: 1001
    allowPrivilegeEscalation: false
    capabilities:
      drop:
      - all
    readOnlyRootFilesystem: false
    runAsNonRoot: true

  ## Argo CD server deployment autoscaling
  ## @param server.autoscaling.enabled Enable Argo CD server deployment autoscaling
  ## @param server.autoscaling.minReplicas Argo CD server deployment autoscaling minimum number of replicas
  ## @param server.autoscaling.maxReplicas Argo CD server deployment autoscaling maximum number of replicas
  ## @param server.autoscaling.targetCPU Argo CD server deployment autoscaling target CPU percentage
  ## @param server.autoscaling.targetMemory Argo CD server deployment autoscaling target CPU memory
  ##
  autoscaling:
    enabled: false
    minReplicas: 1
    maxReplicas: 5
    targetCPU: 50
    targetMemory: 50

  ## Redirect all request to https
  ## @param server.insecure Disable HTTPS redirection for Argo CD server
  ##
  insecure: false

  ## @param server.logFormat ArgoCD server logs format. Options: [text, json]
  ##
  logFormat: text
  ## @param server.logLevel ArgoCD server logs level
  ##
  logLevel: info

  ## Argo CD server enable config
  ## @param server.configEnabled Enable Argo CD server config
  ## Ref: https://github.com/argoproj/argo-cd/blob/master/docs/operator-manual/argocd-cm.yaml
  ##
  configEnabled: true

  ## Argo CD server URL
  ## @param server.url Argo CD server base URL. Required when configuring SSO. Required when enabling dex.
  ##
  url: ""

  ## Argo CD server config. This object will be directly rendered
  ## @param server.config [object] Argo CD server configuration that will end on the argocd-cm Config Map
  ## Ref: https://argo-cd.readthedocs.io/en/stable/operator-manual/user-management/
  ## E.g:
  ## repositories:
  ##   - url: git@github.com:group/repo.git
  ##     sshPrivateKeySecret:
  ##       name: secret-name
  ##       key: sshPrivateKey
  ##   - type: helm
  ##     url: https://charts.helm.sh/stable
  ##     name: stable
  ##   - type: helm
  ##     url: https://argoproj.github.io/argo-helm
  ##     name: argo
  ## oidc.config:
  ##   name: AzureAD
  ##   issuer: https://login.microsoftonline.com/TENANT_ID/v2.0
  ##   clientID: CLIENT_ID
  ##   clientSecret: $oidc.azuread.clientSecret
  ##   requestedIDTokenClaims:
  ##     groups:
  ##       essential: true
  ##   requestedScopes:
  ##     - openid
  ##     - profile
  ##     - email
  ## dex.config:
  ##    connectors:
  ##      # GitHub example
  ##      - type: github
  ##        id: github
  ##        name: GitHub
  ##        config:
  ##          clientID: aabbccddeeff00112233
  ##          clientSecret: $dex.github.clientSecret
  ##          orgs:
  ##          - name: your-github-org
  config:
    ## Argo CD external base URL. Required when configuring SSO. Required when enabling dex.
    ## E.g:
    ## url: https://argocd.example.com
    ##
    url: "{{ .Values.server.url }}"
    ## Argo CD instance label key
    ##
    application.instanceLabelKey: argocd.argoproj.io/instance
    ## If Dex is enabled you need to add connectors here
    ## dex.config: |
    ##  connectors: []
    ##
    dex.config: ""

  ## Configure the ingress for the Argo CD server
  ## Ref: https://kubernetes.io/docs/user-guide/ingress/
  ## @param server.ingress.enabled Enable the creation of an ingress for the Argo CD server
  ## @param server.ingress.pathType Path type for the Argo CD server ingress
  ## @param server.ingress.apiVersion Ingress API version for the Argo CD server ingress
  ## @param server.ingress.hostname Ingress hostname for the Argo CD server ingress
  ## @param server.ingress.annotations Annotations for the Argo CD server ingress. To enable certificate autogeneration, place here your cert-manager annotations.
  ## @param server.ingress.tls Enable TLS for the Argo CD server ingress
  ## @param server.ingress.extraHosts Extra hosts array for the Argo CD server ingress
  ## @param server.ingress.path Path array for the Argo CD server ingress
  ## @param server.ingress.extraPaths Extra paths for the Argo CD server ingress
  ## @param server.ingress.extraTls Extra TLS configuration for the Argo CD server ingress
  ## @param server.ingress.secrets Secrets array to mount into the Ingress
  ## @param server.ingress.ingressClassName IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+)
  ##
  ingress:
    ## Set to true to enable ingress record generation
    ##
    enabled: true

    ## @param server.ingress.selfSigned Create a TLS secret for this ingress record using self-signed certificates generated by Helm
    ##
    selfSigned: false

    ## DEPRECATED: Use server.ingress.annotations instead of server.ingress.certManager
    ## certManager: false
    ##

    ## Ingress Path type
    ##
    pathType: ImplementationSpecific

    ## Override API Version (automatically detected if not set)
    ##
    apiVersion: ""

    ## When the ingress is enabled, a host pointing to this will be created
    ##
    hostname: argocd.server.local

    ## The Path to Argo CD server. You may need to set this to '/*' in order to use this
    ## with ALB ingress controllers.
    ##
    path: /

    ## For a full list of possible ingress annotations, please see
    ## ref: https://github.com/kubernetes/ingress-nginx/blob/master/docs/user-guide/nginx-configuration/annotations.md
    ## Use this parameter to set the required annotations for cert-manager, see
    ## ref: https://cert-manager.io/docs/usage/ingress/#supported-annotations
    ##
    ## e.g:
    ## annotations:
    ##   kubernetes.io/ingress.class: nginx
    ##   cert-manager.io/cluster-issuer: cluster-issuer-name
    ##
    annotations: {}

    ## Enable TLS configuration for the hostname defined at ingress.hostname parameter
    ## TLS certificates will be retrieved from a TLS secret with name: {{- printf "%s-tls" .Values.ingress.hostname }}
    ## You can use the ingress.secrets parameter to create this TLS secret or rely on cert-manager to create it
    ##
    tls: false

    ## The list of additional hostnames to be covered with this ingress record.
    ## Most likely the hostname above will be enough, but in the event more hosts are needed, this is an array
    extraHosts: []
    ## - name: argocd.server.local
    ##   path: /
    ##

    ## Any additional arbitrary paths that may need to be added to the ingress under the main host.
    ## For example: The ALB ingress controller requires a special rule for handling SSL redirection.
    extraPaths: []
    ## - path: /*
    ##   backend:
    ##     serviceName: ssl-redirect
    ##     servicePort: use-annotation
    ##

    ## The tls configuration for additional hostnames to be covered with this ingress record.
    ## see: https://kubernetes.io/docs/concepts/services-networking/ingress/#tls
    extraTls: []
    ## - hosts:
    ##     - argocd.server.local
    ##   secretName: argocd.server.local-tls
    ##

    ## If you're providing your own certificates, please use this to add the certificates as secrets
    ## key and certificate should start with -----BEGIN CERTIFICATE----- or
    ## -----BEGIN RSA PRIVATE KEY-----
    ##
    ## name should line up with a tlsSecret set further up
    ## If you're using cert-manager, this is unneeded, as it will create the secret for you if it is not set
    ##
    ## It is also possible to create and manage the certificates outside of this helm chart
    ## Please see README.md for more information
    ##
    secrets: []
    ## - name: argocd.server.local-tls
    ##   key:
    ##   certificate:
    ##

    ## This is supported in Kubernetes 1.18+ and required if you have more than one IngressClass marked as the default for your cluster .
    ## ref: https://kubernetes.io/blog/2020/04/02/improvements-to-the-ingress-api-in-kubernetes-1.18/
    ##
    ingressClassName: ${ingress_ext_name}
    ## @param server.ingress.extraRules Additional rules to be covered with this ingress record
    ## ref: https://kubernetes.io/docs/concepts/services-networking/ingress/#ingress-rules
    ## e.g:
    ## extraRules:
    ## - host: example.local
    ##     http:
    ##       path: /
    ##       backend:
    ##         service:
    ##           name: example-svc
    ##           port:
    ##             name: http
    ##
    extraRules: []

  ## Metrics configuration for Argo CD server
  ##
  metrics:
    ## Enable metrics for Argo CD server
    ## @param server.metrics.enabled Enable metrics for the Argo CD server
    ##
    enabled: false
    service:
      ## @param server.metrics.service.type Argo CD server service type
      ##
      type: ClusterIP
      ## @param server.metrics.service.port Argo CD server metrics service port
      ##
      port: 8083

      ## Node ports to expose
      ## @param server.metrics.service.nodePort Node port for Argo CD server metrics service
      ## NOTE: choose port between <30000-32767>
      ##
      nodePort: ""

      ## @param server.metrics.service.clusterIP Argo CD server metrics service Cluster IP
      ## e.g.:
      ## clusterIP: None
      ##
      clusterIP: ""
      ## @param server.metrics.service.loadBalancerIP Argo CD server service Load Balancer IP
      ## ref: https://kubernetes.io/docs/concepts/services-networking/service/#type-loadbalancer
      ##
      loadBalancerIP: ""
      ## @param server.metrics.service.loadBalancerSourceRanges Argo CD server service Load Balancer sources
      ## ref: https://kubernetes.io/docs/tasks/access-application-cluster/configure-cloud-provider-firewall/#restrict-access-for-loadbalancer-service
      ## e.g:
      ## loadBalancerSourceRanges:
      ##   - 10.10.10.0/24
      ##
      loadBalancerSourceRanges: []
      ## @param server.metrics.service.externalTrafficPolicy Argo CD server service external traffic policy
      ## ref https://kubernetes.io/docs/tasks/access-application-cluster/create-external-load-balancer/#preserving-the-client-source-ip
      ##
      externalTrafficPolicy: Cluster
      ## @param server.metrics.service.annotations Additional custom annotations for Argo CD server service
      ##
      annotations: {}
      ## @param server.metrics.service.sessionAffinity Session Affinity for Kubernetes service, can be "None" or "ClientIP"
      ## If "ClientIP", consecutive client requests will be directed to the same Pod
      ## ref: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies
      ##
      sessionAffinity: None
      ## @param server.metrics.service.sessionAffinityConfig Additional settings for the sessionAffinity
      ## sessionAffinityConfig:
      ##   clientIP:
      ##     timeoutSeconds: 300
      sessionAffinityConfig: {}

    ## Argo CD server metrics service monitor configuration
    ##
    serviceMonitor:
      ## @param server.metrics.serviceMonitor.enabled Create ServiceMonitor Resource for scraping metrics using PrometheusOperator
      ##
      enabled: false
      ## @param server.metrics.serviceMonitor.namespace Namespace which Prometheus is running in
      ## e.g:
      ## namespace: monitoring
      ##
      namespace: ""
      ## @param server.metrics.serviceMonitor.jobLabel The name of the label on the target service to use as the job name in prometheus.
      ##
      jobLabel: ""
      ## @param server.metrics.serviceMonitor.interval Interval at which metrics should be scraped
      ## ref: https://github.com/coreos/prometheus-operator/blob/master/Documentation/api.md#endpoint
      ##
      interval: 30s
      ## @param server.metrics.serviceMonitor.scrapeTimeout Timeout after which the scrape is ended
      ## ref: https://github.com/coreos/prometheus-operator/blob/master/Documentation/api.md#endpoint
      ##
      scrapeTimeout: 10s
      ## @param server.metrics.serviceMonitor.relabelings RelabelConfigs to apply to samples before scraping
      ## ref: https://github.com/coreos/prometheus-operator/blob/master/Documentation/api.md#relabelconfig
      ##
      relabelings: []
      ## @param server.metrics.serviceMonitor.metricRelabelings MetricRelabelConfigs to apply to samples before ingestion
      ## ref: https://github.com/coreos/prometheus-operator/blob/master/Documentation/api.md#relabelconfig
      ##
      metricRelabelings: []
      ## @param server.metrics.serviceMonitor.selector ServiceMonitor selector labels
      ## ref: https://github.com/bitnami/charts/tree/main/bitnami/prometheus-operator#prometheus-configuration
      ##
      ## selector:
      ##   prometheus: my-prometheus
      ##
      selector: {}
      ## @param server.metrics.serviceMonitor.honorLabels honorLabels chooses the metric's labels on collisions with target labels
      ##
      honorLabels: false

  ## Configure the ingress resource that allows you to access the Argo CD gRPC API
  ## Ref: https://kubernetes.io/docs/user-guide/ingress/
  ## Ref: https://argo-cd.readthedocs.io/en/stable/operator-manual/ingress/
  ## @param server.ingressGrpc.enabled Enable the creation of an ingress for the Argo CD gRPC server
  ## @param server.ingressGrpc.pathType Path type for the Argo CD gRPC server ingress
  ## @param server.ingressGrpc.apiVersion Ingress API version for the Argo CD gRPC server ingress
  ## @param server.ingressGrpc.hostname Ingress hostname for the Argo CD gRPC server ingress
  ## @param server.ingressGrpc.annotations Annotations for the Argo CD gRPC server ingress. To enable certificate autogeneration, place here your cert-manager annotations
  ## @param server.ingressGrpc.tls Enable TLS for the Argo CD server ingress
  ## @param server.ingressGrpc.extraHosts Extra hosts array for the Argo CD gRPC server ingress
  ## @param server.ingressGrpc.path Path array for the Argo CD gRPC server ingress
  ## @param server.ingressGrpc.extraPaths Extra paths for the Argo CD gRPC server ingress
  ## @param server.ingressGrpc.extraTls Extra TLS configuration for the Argo CD gRPC server ingress
  ## @param server.ingressGrpc.secrets Secrets array to mount into the Ingress
  ## @param server.ingressGrpc.ingressClassName IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+)
  ##
  ingressGrpc:
    ## Set to true to enable ingress record generation
    ##
    enabled: false

    ## @param server.ingressGrpc.selfSigned Create a TLS secret for this ingress record using self-signed certificates generated by Helm
    ##
    selfSigned: false

    ## DEPRECATED: Use server.ingressGrpc.annotations instead of server.ingressGrpc.certManager
    ## certManager: false
    ##

    ## Ingress Path type
    ##
    pathType: ImplementationSpecific

    ## Override API Version (automatically detected if not set)
    ##
    apiVersion: ""

    ## When the ingress is enabled, a host pointing to this will be created
    ##
    hostname: argocd.server.local

    ## The Path to Argo CD server gRPC API. You may need to set this to '/*' in order to use this
    ## with ALB ingress controllers.
    ##
    path: /

    ## For a full list of possible ingress annotations, please see
    ## ref: https://github.com/kubernetes/ingress-nginx/blob/master/docs/user-guide/nginx-configuration/annotations.md
    ## Use this parameter to set the required annotations for cert-manager, see
    ## ref: https://cert-manager.io/docs/usage/ingress/#supported-annotations
    ##
    ## e.g:
    ## annotations:
    ##   kubernetes.io/ingress.class: nginx
    ##   cert-manager.io/cluster-issuer: cluster-issuer-name
    ##
    annotations: {}

    ## Enable TLS configuration for the hostname defined at ingress.hostname parameter
    ## TLS certificates will be retrieved from a TLS secret with name: {{- printf "%s-tls" .Values.ingress.hostname }}
    ## You can use the ingress.secrets parameter to create this TLS secret or relay on cert-manager to create it
    ##
    tls: false

    ## The list of additional hostnames to be covered with this ingress record.
    ## Most likely the hostname above will be enough, but in the event more hosts are needed, this is an array
    extraHosts: []
    ## - name: argocd.server.local
    ##   path: /
    ##

    ## Any additional arbitrary paths that may need to be added to the ingress under the main host.
    ## For example: The ALB ingress controller requires a special rule for handling SSL redirection.
    extraPaths: []
    ## - path: /*
    ##   backend:
    ##     serviceName: ssl-redirect
    ##     servicePort: use-annotation
    ##

    ## The tls configuration for additional hostnames to be covered with this ingress record.
    ## see: https://kubernetes.io/docs/concepts/services-networking/ingress/#tls
    extraTls: []
    ## - hosts:
    ##     - argocd.server.local
    ##   secretName: argocd.server.local-tls
    ##

    ## If you're providing your own certificates, please use this to add the certificates as secrets
    ## key and certificate should start with -----BEGIN CERTIFICATE----- or
    ## -----BEGIN RSA PRIVATE KEY-----
    ##
    ## name should line up with a tlsSecret set further up
    ## If you're using cert-manager, this is unneeded, as it will create the secret for you if it is not set
    ##
    ## It is also possible to create and manage the certificates outside of this helm chart
    ## Please see README.md for more information
    ##
    secrets: []
    ## - name: argocd.server.local-tls
    ##   key:
    ##   certificate:
    ##

    ## This is supported in Kubernetes 1.18+ and required if you have more than one IngressClass marked as the default for your cluster .
    ## ref: https://kubernetes.io/blog/2020/04/02/improvements-to-the-ingress-api-in-kubernetes-1.18/
    ##
    ingressClassName: ""
    ## @param server.ingressGrpc.extraRules Additional rules to be covered with this ingress record
    ## ref: https://kubernetes.io/docs/concepts/services-networking/ingress/#ingress-rules
    ## e.g:
    ## extraRules:
    ## - host: example.server.local
    ##     http:
    ##       path: /
    ##       backend:
    ##         service:
    ##           name: example-svc
    ##           port:
    ##             name: http
    ##
    extraRules: []

  ## Argo CD server container port
  ## @param server.containerPorts.http Argo CD server HTTP container port
  ## @param server.containerPorts.https Argo CD server HTTPS container port
  ## @param server.containerPorts.metrics Argo CD server metrics container port
  containerPorts:
    http: 8080
    https: 8443
    metrics: 8083

  ## Argo CD server service parameters
  ##
  service:
    ## @param server.service.type Argo CD service type
    ##
    type: ClusterIP
    ## @param server.service.ports.http HTTP port for the gRPC ingress when enabled
    ## @param server.service.ports.https HTTPS port for the gRPC ingress when enabled
    ##
    ports:
      http: 80
      https: 443

    ## Node ports to expose
    ## @param server.service.nodePorts.http Node port for HTTP
    ## @param server.service.nodePorts.https Node port for HTTPS
    ## NOTE: choose port between <30000-32767>
    ##
    nodePorts:
      http: ""
      https: ""

    ## @param server.service.clusterIP Argo CD service Cluster IP
    ## e.g.:
    ## clusterIP: None
    ##
    clusterIP: ""
    ## @param server.service.loadBalancerIP Argo CD service Load Balancer IP
    ## ref: https://kubernetes.io/docs/concepts/services-networking/service/#type-loadbalancer
    ##
    loadBalancerIP: ""
    ## @param server.service.loadBalancerSourceRanges Argo CD service Load Balancer sources
    ## ref: https://kubernetes.io/docs/tasks/access-application-cluster/configure-cloud-provider-firewall/#restrict-access-for-loadbalancer-service
    ## e.g:
    ## loadBalancerSourceRanges:
    ##   - 10.10.10.0/24
    ##
    loadBalancerSourceRanges: []
    ## @param server.service.externalTrafficPolicy Argo CD service external traffic policy
    ## ref https://kubernetes.io/docs/tasks/access-application-cluster/create-external-load-balancer/#preserving-the-client-source-ip
    ##
    externalTrafficPolicy: Cluster
    ## @param server.service.annotations Additional custom annotations for Argo CD service
    ##
    annotations: {}
    ## @param server.service.extraPorts Extra ports to expose (normally used with the `sidecar` value)
    ##
    extraPorts: []
    ## @param server.service.sessionAffinity Session Affinity for Kubernetes service, can be "None" or "ClientIP"
    ## If "ClientIP", consecutive client requests will be directed to the same Pod
    ## ref: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies
    ##
    sessionAffinity: None
    ## @param server.service.sessionAffinityConfig Additional settings for the sessionAffinity
    ## sessionAffinityConfig:
    ##   clientIP:
    ##     timeoutSeconds: 300
    sessionAffinityConfig: {}

  ## @param server.command Override default container command (useful when using custom images)
  ##
  command: []
  ## @param server.args Override default container args (useful when using custom images)
  ##
  args: []
  ## @param server.extraArgs concat to the default args
  ##
  extraArgs: []
  ## @param server.hostAliases Argo CD server pods host aliases
  ## https://kubernetes.io/docs/concepts/services-networking/add-entries-to-pod-etc-hosts-with-host-aliases/
  ##
  hostAliases: []
  ## @param server.podLabels Extra labels for Argo CD server pods
  ## ref: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/
  ##
  podLabels: {}
  ## @param server.podAnnotations Annotations for Argo CD server pods
  ## ref: https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/
  ##
  podAnnotations: {}
  ## @param server.podAffinityPreset Pod affinity preset. Ignored if `server.affinity` is set. Allowed values: `soft` or `hard`
  ## ref: https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#inter-pod-affinity-and-anti-affinity
  ##
  podAffinityPreset: ""
  ## @param server.podAntiAffinityPreset Pod anti-affinity preset. Ignored if `server.affinity` is set. Allowed values: `soft` or `hard`
  ## ref: https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#inter-pod-affinity-and-anti-affinity
  ##
  podAntiAffinityPreset: soft
  ## Node server.affinity preset
  ## ref: https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#node-affinity
  ##
  nodeAffinityPreset:
    ## @param server.nodeAffinityPreset.type Node affinity preset type. Ignored if `server.affinity` is set. Allowed values: `soft` or `hard`
    ##
    type: ""
    ## @param server.nodeAffinityPreset.key Node label key to match. Ignored if `server.affinity` is set
    ##
    key: ""
    ## @param server.nodeAffinityPreset.values Node label values to match. Ignored if `server.affinity` is set
    ## E.g.
    ## values:
    ##   - e2e-az1
    ##   - e2e-az2
    ##
    values: []
  ## @param server.affinity Affinity for Argo CD server pods assignment
  ## ref: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity
  ## NOTE: `server.podAffinityPreset`, `server.podAntiAffinityPreset`, and `server.nodeAffinityPreset` will be ignored when it's set
  ##
  affinity: {}
  ## @param server.nodeSelector Node labels for Argo CD server pods assignment
  ## ref: https://kubernetes.io/docs/user-guide/node-selection/
  ##
  nodeSelector: {}
  ## @param server.tolerations Tolerations for Argo CD server pods assignment
  ## ref: https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/
  ##
  tolerations: []
  ## @param server.schedulerName Name of the k8s scheduler (other than default)
  ## ref: https://kubernetes.io/docs/tasks/administer-cluster/configure-multiple-schedulers/
  ##
  schedulerName: ""
  ## @param server.shareProcessNamespace Enable shared process namespace in a pod.
  ## If set to false (default), each container will run in separate namespace, server will have PID=1.
  ## If set to true, the /pause will run as init process and will reap any zombie PIDs,
  ## for example, generated by a custom exec probe running longer than a probe timeoutSeconds.
  ## Enable this only if customLivenessProbe or customReadinessProbe is used and zombie PIDs are accumulating.
  ## Ref: https://kubernetes.io/docs/tasks/configure-pod-container/share-process-namespace/
  ##
  shareProcessNamespace: false
  ## @param server.topologySpreadConstraints Topology Spread Constraints for pod assignment
  ## https://kubernetes.io/docs/concepts/workloads/pods/pod-topology-spread-constraints/
  ## The value is evaluated as a template
  ##
  topologySpreadConstraints: []
  ## @param server.updateStrategy.type Argo CD server statefulset strategy type
  ## ref: https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/#update-strategies
  ##
  updateStrategy:
    ## StrategyType
    ## Can be set to RollingUpdate or OnDelete
    ##
    type: RollingUpdate
  ## @param server.priorityClassName Argo CD server pods' priorityClassName
  ##
  priorityClassName: ""
  ## @param server.runtimeClassName Name of the runtime class to be used by pod(s)
  ## ref: https://kubernetes.io/docs/concepts/containers/runtime-class/
  ##
  runtimeClassName: ""
  ## @param server.lifecycleHooks for the Argo CD server container(s) to automate configuration before or after startup
  ##
  lifecycleHooks: {}
  ## @param server.extraEnvVars Array with extra environment variables to add to Argo CD server nodes
  ## e.g:
  ## extraEnvVars:
  ##   - name: FOO
  ##     value: "bar"
  ##
  extraEnvVars: []
  ## @param server.extraEnvVarsCM Name of existing ConfigMap containing extra env vars for Argo CD server nodes
  ##
  extraEnvVarsCM: ""
  ## @param server.extraEnvVarsSecret Name of existing Secret containing extra env vars for Argo CD server nodes
  ##
  extraEnvVarsSecret: ""
  ## @param server.extraVolumes Optionally specify extra list of additional volumes for the Argo CD server pod(s)
  ##
  extraVolumes: []
  ## @param server.extraVolumeMounts Optionally specify extra list of additional volumeMounts for the Argo CD server container(s)
  ##
  extraVolumeMounts: []
  ## @param server.sidecars Add additional sidecar containers to the Argo CD server pod(s)
  ## e.g:
  ## sidecars:
  ##   - name: your-image-name
  ##     image: your-image
  ##     imagePullPolicy: Always
  ##     ports:
  ##       - name: portname
  ##         containerPort: 1234
  ##
  sidecars: []
  ## @param server.initContainers Add additional init containers to the Argo CD server pod(s)
  ## ref: https://kubernetes.io/docs/concepts/workloads/pods/init-containers/
  ## e.g:
  ## initContainers:
  ##  - name: your-image-name
  ##    image: your-image
  ##    imagePullPolicy: Always
  ##    command: ['sh', '-c', 'echo "hello world"']
  ##
  initContainers: []

  ## ServiceAccount configuration for the Argo CD server
  ##
  serviceAccount:
    ## @param server.serviceAccount.create Specifies whether a ServiceAccount should be created
    ##
    create: true
    ## @param server.serviceAccount.name The name of the ServiceAccount to use.
    ## If not set and create is true, a name is generated using the common.names.fullname template
    ##
    name: ""
    ## @param server.serviceAccount.automountServiceAccountToken Automount service account token for the server service account
    ##
    automountServiceAccountToken: true
    ## @param server.serviceAccount.annotations Annotations for service account. Evaluated as a template. Only used if `create` is `true`.
    ##
    annotations: {}

## @section Argo CD repo server Parameters

## Argo CD repository server configuration
##
repoServer:
  ## @param repoServer.replicaCount Number of Argo CD repo server replicas to deploy
  ##
  replicaCount: 1
  ## Configure extra options for Argo CD repo server containers' liveness and readiness probes
  ## ref: https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes/#configure-probes
  ## @param repoServer.startupProbe.enabled Enable startupProbe on Argo CD repo server nodes
  ## @param repoServer.startupProbe.initialDelaySeconds Initial delay seconds for startupProbe
  ## @param repoServer.startupProbe.periodSeconds Period seconds for startupProbe
  ## @param repoServer.startupProbe.timeoutSeconds Timeout seconds for startupProbe
  ## @param repoServer.startupProbe.failureThreshold Failure threshold for startupProbe
  ## @param repoServer.startupProbe.successThreshold Success threshold for startupProbe
  ##
  startupProbe:
    enabled: false
    initialDelaySeconds: 10
    periodSeconds: 10
    timeoutSeconds: 1
    failureThreshold: 3
    successThreshold: 1
  ## @param repoServer.livenessProbe.enabled Enable livenessProbe on Argo CD repo server nodes
  ## @param repoServer.livenessProbe.initialDelaySeconds Initial delay seconds for livenessProbe
  ## @param repoServer.livenessProbe.periodSeconds Period seconds for livenessProbe
  ## @param repoServer.livenessProbe.timeoutSeconds Timeout seconds for livenessProbe
  ## @param repoServer.livenessProbe.failureThreshold Failure threshold for livenessProbe
  ## @param repoServer.livenessProbe.successThreshold Success threshold for livenessProbe
  ##
  livenessProbe:
    enabled: true
    initialDelaySeconds: 10
    periodSeconds: 10
    timeoutSeconds: 1
    failureThreshold: 3
    successThreshold: 1
  ## @param repoServer.readinessProbe.enabled Enable readinessProbe on Argo CD repo server nodes
  ## @param repoServer.readinessProbe.initialDelaySeconds Initial delay seconds for readinessProbe
  ## @param repoServer.readinessProbe.periodSeconds Period seconds for readinessProbe
  ## @param repoServer.readinessProbe.timeoutSeconds Timeout seconds for readinessProbe
  ## @param repoServer.readinessProbe.failureThreshold Failure threshold for readinessProbe
  ## @param repoServer.readinessProbe.successThreshold Success threshold for readinessProbe
  ##
  readinessProbe:
    enabled: true
    initialDelaySeconds: 10
    periodSeconds: 10
    timeoutSeconds: 1
    failureThreshold: 3
    successThreshold: 1
  ## @param repoServer.customStartupProbe Custom startupProbe that overrides the default one
  ##
  customStartupProbe: {}
  ## @param repoServer.customLivenessProbe Custom livenessProbe that overrides the default one
  ##
  customLivenessProbe: {}
  ## @param repoServer.customReadinessProbe Custom readinessProbe that overrides the default one
  ##
  customReadinessProbe: {}
  ## Argo CD repo server resource requests and limits
  ## ref: https://kubernetes.io/docs/user-guide/compute-resources/
  ## @param repoServer.resources.limits The resources limits for the Argo CD repo server containers
  ## @param repoServer.resources.requests The requested resources for the Argo CD repo server containers
  ##
  resources:
    limits: {}
    requests: {}
  ## Configure Pods Security Context
  ## ref: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod
  ## @param repoServer.podSecurityContext.enabled Enabled Argo CD repo server pods' Security Context
  ## @param repoServer.podSecurityContext.fsGroup Set Argo CD repo server pod's Security Context fsGroup
  ##
  podSecurityContext:
    enabled: true
    fsGroup: 1001
  ## Configure Container Security Context
  ## ref: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod
  ## @param repoServer.containerSecurityContext.enabled Enabled Argo CD repo server containers' Security Context
  ## @param repoServer.containerSecurityContext.runAsUser Set Argo CD repo server containers' Security Context runAsUser
  ## @param repoServer.containerSecurityContext.allowPrivilegeEscalation Set Argo CD repo server containers' Security Context allowPrivilegeEscalation
  ## @param repoServer.containerSecurityContext.capabilities.drop Set Argo CD containers' repo server Security Context capabilities to be dropped
  ## @param repoServer.containerSecurityContext.readOnlyRootFilesystem Set Argo CD containers' repo server Security Context readOnlyRootFilesystem
  ## @param repoServer.containerSecurityContext.runAsNonRoot Set Argo CD repo server containers' Security Context runAsNonRoot
  ##
  containerSecurityContext:
    enabled: true
    runAsUser: 1001
    allowPrivilegeEscalation: false
    capabilities:
      drop:
      - all
    readOnlyRootFilesystem: false
    runAsNonRoot: true

  ## Repo server service parameters
  ##
  service:
    ## @param repoServer.service.type Repo server service type
    ##
    type: ClusterIP
    ## @param repoServer.service.port Repo server service port
    ##
    port: 8081
    ## Node ports to expose
    ## @param repoServer.service.nodePort Node port for the repo server service
    ## NOTE: choose port between <30000-32767>
    ##
    nodePort: ""

    ## @param repoServer.service.clusterIP Repo server service Cluster IP
    ## e.g.:
    ## clusterIP: None
    ##
    clusterIP: ""
    ## @param repoServer.service.loadBalancerIP Repo server service Load Balancer IP
    ## ref: https://kubernetes.io/docs/concepts/services-networking/service/#type-loadbalancer
    ##
    loadBalancerIP: ""
    ## @param repoServer.service.loadBalancerSourceRanges Repo server service Load Balancer sources
    ## ref: https://kubernetes.io/docs/tasks/access-application-cluster/configure-cloud-provider-firewall/#restrict-access-for-loadbalancer-service
    ## e.g:
    ## loadBalancerSourceRanges:
    ##   - 10.10.10.0/24
    ##
    loadBalancerSourceRanges: []
    ## @param repoServer.service.externalTrafficPolicy Repo server service external traffic policy
    ## ref https://kubernetes.io/docs/tasks/access-application-cluster/create-external-load-balancer/#preserving-the-client-source-ip
    ##
    externalTrafficPolicy: Cluster
    ## @param repoServer.service.annotations Additional custom annotations for Repo server service
    ##
    annotations: {}
    ## @param repoServer.service.extraPorts Extra ports to expose (normally used with the `sidecar` value)
    ##
    extraPorts: []
    ## @param repoServer.service.sessionAffinity Session Affinity for Kubernetes service, can be "None" or "ClientIP"
    ## If "ClientIP", consecutive client requests will be directed to the same Pod
    ## ref: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies
    ##
    sessionAffinity: None
    ## @param repoServer.service.sessionAffinityConfig Additional settings for the sessionAffinity
    ## sessionAffinityConfig:
    ##   clientIP:
    ##     timeoutSeconds: 300
    sessionAffinityConfig: {}

  ## Argo CD repo server log format: text|json
  ## @param repoServer.logFormat Format for the Argo CD repo server logs. Options: [text, json]
  ##
  logFormat: text
  ## Argo CD application controller log level
  ## @param repoServer.logLevel Log level for the Argo CD repo server
  ##
  logLevel: info

  ## Argo CD repo server container port
  ## @param repoServer.containerPorts.repoServer Container port for Argo CD repo server
  ## @param repoServer.containerPorts.metrics Metrics port for Argo CD repo server
  ##
  containerPorts:
    repoServer: 8081
    metrics: 8084

  ## Metrics configuration for Argo CD repo server
  ##
  metrics:
    ## Enable metrics for Argo CD repo server
    ## @param repoServer.metrics.enabled Enable metrics for the Argo CD repo server
    ##
    enabled: false
    service:
      ## @param repoServer.metrics.service.type Argo CD repo server service type
      ##
      type: ClusterIP
      ## @param repoServer.metrics.service.port Argo CD repo server metrics service port
      ##
      port: 8084

      ## Node ports to expose
      ## @param repoServer.metrics.service.nodePort Node port for the repo server metrics service
      ## NOTE: choose port between <30000-32767>
      ##
      nodePort: ""

      ## @param repoServer.metrics.service.clusterIP Argo CD repo server metrics service Cluster IP
      ## e.g.:
      ## clusterIP: None
      ##
      clusterIP: ""
      ## @param repoServer.metrics.service.loadBalancerIP Argo CD repo server service Load Balancer IP
      ## ref: https://kubernetes.io/docs/concepts/services-networking/service/#type-loadbalancer
      ##
      loadBalancerIP: ""
      ## @param repoServer.metrics.service.loadBalancerSourceRanges Argo CD repo server service Load Balancer sources
      ## ref: https://kubernetes.io/docs/tasks/access-application-cluster/configure-cloud-provider-firewall/#restrict-access-for-loadbalancer-service
      ## e.g:
      ## loadBalancerSourceRanges:
      ##   - 10.10.10.0/24
      ##
      loadBalancerSourceRanges: []
      ## @param repoServer.metrics.service.externalTrafficPolicy Argo CD repo server service external traffic policy
      ## ref https://kubernetes.io/docs/tasks/access-application-cluster/create-external-load-balancer/#preserving-the-client-source-ip
      ##
      externalTrafficPolicy: Cluster
      ## @param repoServer.metrics.service.annotations Additional custom annotations for Argo CD repo server service
      ##
      annotations: {}
      ## @param repoServer.metrics.service.sessionAffinity Session Affinity for Kubernetes service, can be "None" or "ClientIP"
      ## If "ClientIP", consecutive client requests will be directed to the same Pod
      ## ref: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies
      ##
      sessionAffinity: None
      ## @param repoServer.metrics.service.sessionAffinityConfig Additional settings for the sessionAffinity
      ## sessionAffinityConfig:
      ##   clientIP:
      ##     timeoutSeconds: 300
      sessionAffinityConfig: {}

    ## Argo CD repo server metrics service monitor configuration
    ##
    serviceMonitor:
      ## @param repoServer.metrics.serviceMonitor.enabled Create ServiceMonitor Resource for scraping metrics using PrometheusOperator
      ##
      enabled: false
      ## @param repoServer.metrics.serviceMonitor.namespace Namespace which Prometheus is running in
      ## e.g:
      ## namespace: monitoring
      ##
      namespace: ""
      ## @param repoServer.metrics.serviceMonitor.jobLabel The name of the label on the target service to use as the job name in prometheus.
      ##
      jobLabel: ""
      ## @param repoServer.metrics.serviceMonitor.interval Interval at which metrics should be scraped
      ## ref: https://github.com/coreos/prometheus-operator/blob/master/Documentation/api.md#endpoint
      ##
      interval: 30s
      ## @param repoServer.metrics.serviceMonitor.scrapeTimeout Timeout after which the scrape is ended
      ## ref: https://github.com/coreos/prometheus-operator/blob/master/Documentation/api.md#endpoint
      ##
      scrapeTimeout: 10s
      ## @param repoServer.metrics.serviceMonitor.relabelings RelabelConfigs to apply to samples before scraping
      ## ref: https://github.com/coreos/prometheus-operator/blob/master/Documentation/api.md#relabelconfig
      ##
      relabelings: []
      ## @param repoServer.metrics.serviceMonitor.metricRelabelings MetricRelabelConfigs to apply to samples before ingestion
      ## ref: https://github.com/coreos/prometheus-operator/blob/master/Documentation/api.md#relabelconfig
      ##
      metricRelabelings: []
      ## @param repoServer.metrics.serviceMonitor.selector ServiceMonitor selector labels
      ## ref: https://github.com/bitnami/charts/tree/main/bitnami/prometheus-operator#prometheus-configuration
      ##
      ## selector:
      ##   prometheus: my-prometheus
      ##
      selector: {}
      ## @param repoServer.metrics.serviceMonitor.honorLabels honorLabels chooses the metric's labels on collisions with target labels
      ##
      honorLabels: false

  ## Argo CD repo server deployment autoscaling
  ## @param repoServer.autoscaling.enabled Enable Argo CD repo server deployment autoscaling
  ## @param repoServer.autoscaling.minReplicas Argo CD repo server deployment autoscaling minimum number of replicas
  ## @param repoServer.autoscaling.maxReplicas Argo CD repo server deployment autoscaling maximum number of replicas
  ## @param repoServer.autoscaling.targetCPU Argo CD repo server deployment autoscaling target CPU percentage
  ## @param repoServer.autoscaling.targetMemory Argo CD repo server deployment autoscaling target CPU memory
  ##
  autoscaling:
    enabled: false
    minReplicas: 1
    maxReplicas: 5
    targetCPU: 50
    targetMemory: 50

  ## ServiceAccount configuration for the Argo CD repo server
  ##
  serviceAccount:
    ## @param repoServer.serviceAccount.create Specifies whether a ServiceAccount for repo server should be created
    ##
    create: true
    ## @param repoServer.serviceAccount.name The name of the ServiceAccount for repo server to use.
    ## If not set and create is true, a name is generated using the common.names.fullname template
    ##
    name: ""
    ## @param repoServer.serviceAccount.automountServiceAccountToken Automount service account token for the repo server service account
    ##
    automountServiceAccountToken: true
    ## @param repoServer.serviceAccount.annotations Annotations for service account. Evaluated as a template. Only used if `create` is `true`.
    ##
    annotations: {}

  ## @param repoServer.command Override default container command (useful when using custom images)
  ##
  command: []
  ## @param repoServer.args Override default container args (useful when using custom images)
  ##
  args: []
  ## @param repoServer.extraArgs Add extra args to the default repo server args
  ##
  extraArgs: []
  ## @param repoServer.hostAliases Argo CD repo server pods host aliases
  ## https://kubernetes.io/docs/concepts/services-networking/add-entries-to-pod-etc-hosts-with-host-aliases/
  ##
  hostAliases: []
  ## @param repoServer.podLabels Extra labels for Argo CD repo server pods
  ## ref: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/
  ##
  podLabels: {}
  ## @param repoServer.podAnnotations Annotations for Argo CD repo server pods
  ## ref: https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/
  ##
  podAnnotations: {}
  ## @param repoServer.podAffinityPreset Pod affinity preset. Ignored if `repoServer.affinity` is set. Allowed values: `soft` or `hard`
  ## ref: https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#inter-pod-affinity-and-anti-affinity
  ##
  podAffinityPreset: ""
  ## @param repoServer.podAntiAffinityPreset Pod anti-affinity preset. Ignored if `repoServer.affinity` is set. Allowed values: `soft` or `hard`
  ## ref: https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#inter-pod-affinity-and-anti-affinity
  ##
  podAntiAffinityPreset: soft
  ## Node repoServer.affinity preset
  ## ref: https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#node-affinity
  ##
  nodeAffinityPreset:
    ## @param repoServer.nodeAffinityPreset.type Node affinity preset type. Ignored if `repoServer.affinity` is set. Allowed values: `soft` or `hard`
    ##
    type: ""
    ## @param repoServer.nodeAffinityPreset.key Node label key to match. Ignored if `repoServer.affinity` is set
    ##
    key: ""
    ## @param repoServer.nodeAffinityPreset.values Node label values to match. Ignored if `repoServer.affinity` is set
    ## E.g.
    ## values:
    ##   - e2e-az1
    ##   - e2e-az2
    ##
    values: []
  ## @param repoServer.affinity Affinity for Argo CD repo server pods assignment
  ## ref: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity
  ## NOTE: `repoServer.podAffinityPreset`, `repoServer.podAntiAffinityPreset`, and `repoServer.nodeAffinityPreset` will be ignored when it's set
  ##
  affinity: {}
  ## @param repoServer.nodeSelector Node labels for Argo CD repo server pods assignment
  ## ref: https://kubernetes.io/docs/user-guide/node-selection/
  ##
  nodeSelector: {}
  ## @param repoServer.tolerations Tolerations for Argo CD repo server pods assignment
  ## ref: https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/
  ##
  tolerations: []
  ## @param repoServer.schedulerName Name of the k8s scheduler (other than default)
  ## ref: https://kubernetes.io/docs/tasks/administer-cluster/configure-multiple-schedulers/
  ##
  schedulerName: ""
  ## @param repoServer.shareProcessNamespace Enable shared process namespace in a pod.
  ## If set to false (default), each container will run in separate namespace, repoServer will have PID=1.
  ## If set to true, the /pause will run as init process and will reap any zombie PIDs,
  ## for example, generated by a custom exec probe running longer than a probe timeoutSeconds.
  ## Enable this only if customLivenessProbe or customReadinessProbe is used and zombie PIDs are accumulating.
  ## Ref: https://kubernetes.io/docs/tasks/configure-pod-container/share-process-namespace/
  ##
  shareProcessNamespace: false
  ## @param repoServer.topologySpreadConstraints Topology Spread Constraints for pod assignment
  ## https://kubernetes.io/docs/concepts/workloads/pods/pod-topology-spread-constraints/
  ## The value is evaluated as a template
  ##
  topologySpreadConstraints: []
  ## @param repoServer.updateStrategy.type Argo CD repo server statefulset strategy type
  ## ref: https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/#update-strategies
  ##
  updateStrategy:
    ## StrategyType
    ## Can be set to RollingUpdate or OnDelete
    ##
    type: RollingUpdate
  ## @param repoServer.priorityClassName Argo CD repo server pods' priorityClassName
  ##
  priorityClassName: ""
  ## @param repoServer.runtimeClassName Name of the runtime class to be used by pod(s)
  ## ref: https://kubernetes.io/docs/concepts/containers/runtime-class/
  ##
  runtimeClassName: ""
  ## @param repoServer.lifecycleHooks for the Argo CD repo server container(s) to automate configuration before or after startup
  ##
  lifecycleHooks: {}
  ## @param repoServer.extraEnvVars Array with extra environment variables to add to Argo CD repo server nodes
  ## e.g:
  ## extraEnvVars:
  ##   - name: FOO
  ##     value: "bar"
  ##
  extraEnvVars: []
  ## @param repoServer.extraEnvVarsCM Name of existing ConfigMap containing extra env vars for Argo CD repo server nodes
  ##
  extraEnvVarsCM: ""
  ## @param repoServer.extraEnvVarsSecret Name of existing Secret containing extra env vars for Argo CD repo server nodes
  ##
  extraEnvVarsSecret: ""
  ## @param repoServer.extraVolumes Optionally specify extra list of additional volumes for the Argo CD repo server pod(s)
  ##
  extraVolumes: []
  ## @param repoServer.extraVolumeMounts Optionally specify extra list of additional volumeMounts for the Argo CD repo server container(s)
  ##
  extraVolumeMounts: []
  ## @param repoServer.sidecars Add additional sidecar containers to the Argo CD repo server pod(s)
  ## e.g:
  ## sidecars:
  ##   - name: your-image-name
  ##     image: your-image
  ##     imagePullPolicy: Always
  ##     ports:
  ##       - name: portname
  ##         containerPort: 1234
  ##
  sidecars: []
  ## @param repoServer.initContainers Add additional init containers to the Argo CD repo server pod(s)
  ## ref: https://kubernetes.io/docs/concepts/workloads/pods/init-containers/
  ## e.g:
  ## initContainers:
  ##  - name: your-image-name
  ##    image: your-image
  ##    imagePullPolicy: Always
  ##    command: ['sh', '-c', 'echo "hello world"']
  ##
  initContainers: []

## @section Dex Parameters

## Dex configuration
##
dex:
  ## Bitnami Dex image
  ## ref: https://hub.docker.com/r/bitnami/argo-cd/tags/
  ## @param dex.image.registry Dex image registry
  ## @param dex.image.repository Dex image repository
  ## @param dex.image.tag Dex image tag (immutable tags are recommended)
  ## @param dex.image.digest Dex image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag
  ## @param dex.image.pullPolicy Dex image pull policy
  ## @param dex.image.pullSecrets Dex image pull secrets
  ## @param dex.image.debug Enable Dex image debug mode
  ##
  image:
    registry: docker.io
    repository: bitnami/dex
    tag: 2.36.0-debian-11-r16
    digest: ""
    ## Specify a imagePullPolicy
    ## Defaults to 'Always' if image tag is 'latest', else set to 'IfNotPresent'
    ## ref: https://kubernetes.io/docs/user-guide/images/#pre-pulling-images
    ##
    pullPolicy: IfNotPresent
    ## Optionally specify an array of imagePullSecrets.
    ## Secrets must be manually created in the namespace.
    ## ref: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/
    ## e.g:
    ## pullSecrets:
    ##   - myRegistryKeySecretName
    ##
    pullSecrets: []
    ## Enable debug mode
    ##
    debug: false

  ## Enable Dex deployment
  ## @param dex.enabled Enable the creation of a Dex deployment for SSO
  ##
  enabled: false
  ## @param dex.replicaCount Number of Dex replicas to deploy
  ##
  replicaCount: 1
  ## Configure extra options for Dex containers' liveness and readiness probes
  ## ref: https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes/#configure-probes
  ## @param dex.startupProbe.enabled Enable startupProbe on Dex nodes
  ## @param dex.startupProbe.initialDelaySeconds Initial delay seconds for startupProbe
  ## @param dex.startupProbe.periodSeconds Period seconds for startupProbe
  ## @param dex.startupProbe.timeoutSeconds Timeout seconds for startupProbe
  ## @param dex.startupProbe.failureThreshold Failure threshold for startupProbe
  ## @param dex.startupProbe.successThreshold Success threshold for startupProbe
  ##
  startupProbe:
    enabled: false
    initialDelaySeconds: 10
    periodSeconds: 10
    timeoutSeconds: 1
    failureThreshold: 3
    successThreshold: 1
  ## @param dex.livenessProbe.enabled Enable livenessProbe on Dex nodes
  ## @param dex.livenessProbe.initialDelaySeconds Initial delay seconds for livenessProbe
  ## @param dex.livenessProbe.periodSeconds Period seconds for livenessProbe
  ## @param dex.livenessProbe.timeoutSeconds Timeout seconds for livenessProbe
  ## @param dex.livenessProbe.failureThreshold Failure threshold for livenessProbe
  ## @param dex.livenessProbe.successThreshold Success threshold for livenessProbe
  ##
  livenessProbe:
    enabled: true
    initialDelaySeconds: 10
    periodSeconds: 10
    timeoutSeconds: 1
    failureThreshold: 3
    successThreshold: 1
  ## @param dex.readinessProbe.enabled Enable readinessProbe on Dex nodes
  ## @param dex.readinessProbe.initialDelaySeconds Initial delay seconds for readinessProbe
  ## @param dex.readinessProbe.periodSeconds Period seconds for readinessProbe
  ## @param dex.readinessProbe.timeoutSeconds Timeout seconds for readinessProbe
  ## @param dex.readinessProbe.failureThreshold Failure threshold for readinessProbe
  ## @param dex.readinessProbe.successThreshold Success threshold for readinessProbe
  ##
  readinessProbe:
    enabled: true
    initialDelaySeconds: 10
    periodSeconds: 10
    timeoutSeconds: 1
    failureThreshold: 3
    successThreshold: 1
  ## @param dex.customStartupProbe Custom startupProbe that overrides the default one
  ##
  customStartupProbe: {}
  ## @param dex.customLivenessProbe Custom livenessProbe that overrides the default one
  ##
  customLivenessProbe: {}
  ## @param dex.customReadinessProbe Custom readinessProbe that overrides the default one
  ##
  customReadinessProbe: {}
  ## Dex resource requests and limits
  ## ref: https://kubernetes.io/docs/user-guide/compute-resources/
  ## @param dex.resources.limits The resources limits for the Dex containers
  ## @param dex.resources.requests The requested resources for the Dex containers
  ##
  resources:
    limits: {}
    requests: {}
  ## Configure Pods Security Context
  ## ref: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod
  ## @param dex.podSecurityContext.enabled Enabled Dex pods' Security Context
  ## @param dex.podSecurityContext.fsGroup Set Dex pod's Security Context fsGroup
  ##
  podSecurityContext:
    enabled: true
    fsGroup: 1001
  ## Configure Container Security Context
  ## ref: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod
  ## @param dex.containerSecurityContext.enabled Enabled Dex containers' Security Context
  ## @param dex.containerSecurityContext.runAsUser Set Dex containers' Security Context runAsUser
  ## @param dex.containerSecurityContext.allowPrivilegeEscalation Set Dex containers' Security Context allowPrivilegeEscalation
  ## @param dex.containerSecurityContext.readOnlyRootFilesystem Set Dex containers' server Security Context readOnlyRootFilesystem
  ## @param dex.containerSecurityContext.runAsNonRoot Set Dex containers' Security Context runAsNonRoot
  ##
  containerSecurityContext:
    enabled: true
    runAsUser: 1001
    allowPrivilegeEscalation: false
    readOnlyRootFilesystem: false
    runAsNonRoot: true

  ## Dex service parameters
  ##
  service:
    ## @param dex.service.type Dex service type
    ##
    type: ClusterIP
    ## @param dex.service.ports.http Dex HTTP service port
    ## @param dex.service.ports.grpc Dex grpc service port
    ##
    ports:
      http: 5556
      grpc: 5557

    ## Node ports to expose
    ## @param dex.service.nodePorts.http HTTP node port for the Dex service
    ## @param dex.service.nodePorts.grpc gRPC node port for the Dex service
    ## NOTE: choose port between <30000-32767>
    ##
    nodePorts:
      http: ""
      grpc: ""

    ## @param dex.service.clusterIP Dex service Cluster IP
    ## e.g.:
    ## clusterIP: None
    ##
    clusterIP: ""
    ## @param dex.service.loadBalancerIP Dex service Load Balancer IP
    ## ref: https://kubernetes.io/docs/concepts/services-networking/service/#type-loadbalancer
    ##
    loadBalancerIP: ""
    ## @param dex.service.loadBalancerSourceRanges Dex service Load Balancer sources
    ## ref: https://kubernetes.io/docs/tasks/access-application-cluster/configure-cloud-provider-firewall/#restrict-access-for-loadbalancer-service
    ## e.g:
    ## loadBalancerSourceRanges:
    ##   - 10.10.10.0/24
    ##
    loadBalancerSourceRanges: []
    ## @param dex.service.externalTrafficPolicy Dex service external traffic policy
    ## ref https://kubernetes.io/docs/tasks/access-application-cluster/create-external-load-balancer/#preserving-the-client-source-ip
    ##
    externalTrafficPolicy: Cluster
    ## @param dex.service.annotations Additional custom annotations for Dex service
    ##
    annotations: {}
    ## @param dex.service.extraPorts Extra ports to expose (normally used with the `sidecar` value)
    ##
    extraPorts: []
    ## @param dex.service.sessionAffinity Session Affinity for Kubernetes service, can be "None" or "ClientIP"
    ## If "ClientIP", consecutive client requests will be directed to the same Pod
    ## ref: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies
    ##
    sessionAffinity: None
    ## @param dex.service.sessionAffinityConfig Additional settings for the sessionAffinity
    ## sessionAffinityConfig:
    ##   clientIP:
    ##     timeoutSeconds: 300
    sessionAffinityConfig: {}

  ## Dex container ports
  ## @param dex.containerPorts.http Dex container HTTP port
  ## @param dex.containerPorts.grpc Dex gRPC port
  ## @param dex.containerPorts.metrics Dex metrics port
  ##
  containerPorts:
    http: 5556
    grpc: 5557
    metrics: 5558

  ## Metrics configuration for Dex
  ##
  metrics:
    ## Enable metrics for Argo Dex
    ## @param dex.metrics.enabled Enable metrics service for Dex
    ##
    enabled: false
    service:
      ## @param dex.metrics.service.type Dex service type
      ##
      type: ClusterIP
      ## @param dex.metrics.service.port Dex metrics service port
      ##
      port: 5558

      ## Node ports to expose
      ## @param dex.metrics.service.nodePort Node port for the Dex service
      ## NOTE: choose port between <30000-32767>
      ##
      nodePort: ""

      ## @param dex.metrics.service.clusterIP Dex service metrics service Cluster IP
      ## e.g.:
      ## clusterIP: None
      ##
      clusterIP: ""
      ## @param dex.metrics.service.loadBalancerIP Dex service Load Balancer IP
      ## ref: https://kubernetes.io/docs/concepts/services-networking/service/#type-loadbalancer
      ##
      loadBalancerIP: ""
      ## @param dex.metrics.service.loadBalancerSourceRanges Dex service Load Balancer sources
      ## ref: https://kubernetes.io/docs/tasks/access-application-cluster/configure-cloud-provider-firewall/#restrict-access-for-loadbalancer-service
      ## e.g:
      ## loadBalancerSourceRanges:
      ##   - 10.10.10.0/24
      ##
      loadBalancerSourceRanges: []
      ## @param dex.metrics.service.externalTrafficPolicy Dex service external traffic policy
      ## ref https://kubernetes.io/docs/tasks/access-application-cluster/create-external-load-balancer/#preserving-the-client-source-ip
      ##
      externalTrafficPolicy: Cluster
      ## @param dex.metrics.service.annotations Additional custom annotations for Dex service
      ##
      annotations: {}
      ## @param dex.metrics.service.sessionAffinity Session Affinity for Kubernetes service, can be "None" or "ClientIP"
      ## If "ClientIP", consecutive client requests will be directed to the same Pod
      ## ref: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies
      ##
      sessionAffinity: None
      ## @param dex.metrics.service.sessionAffinityConfig Additional settings for the sessionAffinity
      ## sessionAffinityConfig:
      ##   clientIP:
      ##     timeoutSeconds: 300
      sessionAffinityConfig: {}

    ## Dex metrics service monitor configuration
    ##
    serviceMonitor:
      ## @param dex.metrics.serviceMonitor.enabled Create ServiceMonitor Resource for scraping metrics using PrometheusOperator
      ##
      enabled: false
      ## @param dex.metrics.serviceMonitor.namespace Namespace which Prometheus is running in
      ## e.g:
      ## namespace: monitoring
      ##
      namespace: ""
      ## @param dex.metrics.serviceMonitor.jobLabel The name of the label on the target service to use as the job name in prometheus.
      ##
      jobLabel: ""
      ## @param dex.metrics.serviceMonitor.interval Interval at which metrics should be scraped
      ## ref: https://github.com/coreos/prometheus-operator/blob/master/Documentation/api.md#endpoint
      ##
      interval: 30s
      ## @param dex.metrics.serviceMonitor.scrapeTimeout Timeout after which the scrape is ended
      ## ref: https://github.com/coreos/prometheus-operator/blob/master/Documentation/api.md#endpoint
      ##
      scrapeTimeout: 10s
      ## @param dex.metrics.serviceMonitor.relabelings RelabelConfigs to apply to samples before scraping
      ## ref: https://github.com/coreos/prometheus-operator/blob/master/Documentation/api.md#relabelconfig
      ##
      relabelings: []
      ## @param dex.metrics.serviceMonitor.metricRelabelings MetricRelabelConfigs to apply to samples before ingestion
      ## ref: https://github.com/coreos/prometheus-operator/blob/master/Documentation/api.md#relabelconfig
      ##
      metricRelabelings: []
      ## @param dex.metrics.serviceMonitor.selector ServiceMonitor selector labels
      ## ref: https://github.com/bitnami/charts/tree/main/bitnami/prometheus-operator#prometheus-configuration
      ##
      ## selector:
      ##   prometheus: my-prometheus
      ##
      selector: {}
      ## @param dex.metrics.serviceMonitor.honorLabels honorLabels chooses the metric's labels on collisions with target labels
      ##
      honorLabels: false

  ## ServiceAccount configuration for the Dex
  ##
  serviceAccount:
    ## @param dex.serviceAccount.create Specifies whether a ServiceAccount should be created for Dex
    ##
    create: true
    ## @param dex.serviceAccount.name The name of the ServiceAccount to use.
    ## If not set and create is true, a name is generated using the common.names.fullname template
    ##
    name: ""
    ## @param dex.serviceAccount.automountServiceAccountToken Automount service account token for the Dex service account
    ##
    automountServiceAccountToken: true
    ## @param dex.serviceAccount.annotations Annotations for service account. Evaluated as a template. Only used if `create` is `true`.
    ##
    annotations: {}

  ## @param dex.command Override default container command (useful when using custom images)
  ##
  command: []
  ## @param dex.args Override default container args (useful when using custom images)
  ##
  args: []
  ## @param dex.extraArgs Add extra args to the default args for Dex
  ##
  extraArgs: []
  ## @param dex.hostAliases Dex pods host aliases
  ## https://kubernetes.io/docs/concepts/services-networking/add-entries-to-pod-etc-hosts-with-host-aliases/
  ##
  hostAliases: []
  ## @param dex.podLabels Extra labels for Dex pods
  ## ref: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/
  ##
  podLabels: {}
  ## @param dex.podAnnotations Annotations for Dex pods
  ## ref: https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/
  ##
  podAnnotations: {}
  ## @param dex.podAffinityPreset Pod affinity preset. Ignored if `dex.affinity` is set. Allowed values: `soft` or `hard`
  ## ref: https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#inter-pod-affinity-and-anti-affinity
  ##
  podAffinityPreset: ""
  ## @param dex.podAntiAffinityPreset Pod anti-affinity preset. Ignored if `dex.affinity` is set. Allowed values: `soft` or `hard`
  ## ref: https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#inter-pod-affinity-and-anti-affinity
  ##
  podAntiAffinityPreset: soft
  ## Node dex.affinity preset
  ## ref: https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#node-affinity
  ##
  nodeAffinityPreset:
    ## @param dex.nodeAffinityPreset.type Node affinity preset type. Ignored if `dex.affinity` is set. Allowed values: `soft` or `hard`
    ##
    type: ""
    ## @param dex.nodeAffinityPreset.key Node label key to match. Ignored if `dex.affinity` is set
    ##
    key: ""
    ## @param dex.nodeAffinityPreset.values Node label values to match. Ignored if `dex.affinity` is set
    ## E.g.
    ## values:
    ##   - e2e-az1
    ##   - e2e-az2
    ##
    values: []
  ## @param dex.affinity Affinity for Dex pods assignment
  ## ref: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity
  ## NOTE: `dex.podAffinityPreset`, `dex.podAntiAffinityPreset`, and `dex.nodeAffinityPreset` will be ignored when it's set
  ##
  affinity: {}
  ## @param dex.nodeSelector Node labels for Dex pods assignment
  ## ref: https://kubernetes.io/docs/user-guide/node-selection/
  ##
  nodeSelector: {}
  ## @param dex.tolerations Tolerations for Dex pods assignment
  ## ref: https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/
  ##
  tolerations: []
  ## @param dex.schedulerName Name of the k8s scheduler (other than default)
  ## ref: https://kubernetes.io/docs/tasks/administer-cluster/configure-multiple-schedulers/
  ##
  schedulerName: ""
  ## @param dex.shareProcessNamespace Enable shared process namespace in a pod.
  ## If set to false (default), each container will run in separate namespace, dex will have PID=1.
  ## If set to true, the /pause will run as init process and will reap any zombie PIDs,
  ## for example, generated by a custom exec probe running longer than a probe timeoutSeconds.
  ## Enable this only if customLivenessProbe or customReadinessProbe is used and zombie PIDs are accumulating.
  ## Ref: https://kubernetes.io/docs/tasks/configure-pod-container/share-process-namespace/
  ##
  shareProcessNamespace: false
  ## @param dex.topologySpreadConstraints Topology Spread Constraints for pod assignment
  ## https://kubernetes.io/docs/concepts/workloads/pods/pod-topology-spread-constraints/
  ## The value is evaluated as a template
  ##
  topologySpreadConstraints: []
  ## @param dex.updateStrategy.type Dex statefulset strategy type
  ## ref: https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/#update-strategies
  ##
  updateStrategy:
    ## StrategyType
    ## Can be set to RollingUpdate or OnDelete
    ##
    type: RollingUpdate
  ## @param dex.priorityClassName Dex pods' priorityClassName
  ##
  priorityClassName: ""
  ## @param dex.runtimeClassName Name of the runtime class to be used by pod(s)
  ## ref: https://kubernetes.io/docs/concepts/containers/runtime-class/
  ##
  runtimeClassName: ""
  ## @param dex.lifecycleHooks for the Dex container(s) to automate configuration before or after startup
  ##
  lifecycleHooks: {}
  ## @param dex.extraEnvVars Array with extra environment variables to add to Dex nodes
  ## e.g:
  ## extraEnvVars:
  ##   - name: FOO
  ##     value: "bar"
  ##
  extraEnvVars: []
  ## @param dex.extraEnvVarsCM Name of existing ConfigMap containing extra env vars for Dex nodes
  ##
  extraEnvVarsCM: ""
  ## @param dex.extraEnvVarsSecret Name of existing Secret containing extra env vars for Dex nodes
  ##
  extraEnvVarsSecret: ""
  ## @param dex.extraVolumes Optionally specify extra list of additional volumes for the Dex pod(s)
  ##
  extraVolumes: []
  ## @param dex.extraVolumeMounts Optionally specify extra list of additional volumeMounts for the Dex container(s)
  ##
  extraVolumeMounts: []
  ## @param dex.sidecars Add additional sidecar containers to the Dex pod(s)
  ## e.g:
  ## sidecars:
  ##   - name: your-image-name
  ##     image: your-image
  ##     imagePullPolicy: Always
  ##     ports:
  ##       - name: portname
  ##         containerPort: 1234
  ##
  sidecars: []
  ## @param dex.initContainers Add additional init containers to the Dex pod(s)
  ## ref: https://kubernetes.io/docs/concepts/workloads/pods/init-containers/
  ## e.g:
  ## initContainers:
  ##  - name: your-image-name
  ##    image: your-image
  ##    imagePullPolicy: Always
  ##    command: ['sh', '-c', 'echo "hello world"']
  ##
  initContainers: []

## @section Shared config for Argo CD components
config:
  ## @param config.knownHosts [string] Known hosts to be added to the known hosts list by default. Check the values to see the default value
  ##
  knownHosts: |
    bitbucket.org ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAubiN81eDcafrgMeLzaFPsw2kNvEcqTKl/VqLat/MaB33pZy0y3rJZtnqwR2qOOvbwKZYKiEO1O6VqNEBxKvJJelCq0dTXWT5pbO2gDXC6h6QDXCaHo6pOHGPUy+YBaGQRGuSusMEASYiWunYN0vCAI8QaXnWMXNMdFP3jHAJH0eDsoiGnLPBlBp4TNm6rYI74nMzgz3B9IikW4WVK+dc8KZJZWYjAuORU3jc1c/NPskD2ASinf8v3xnfXeukU0sJ5N6m5E8VLjObPEO+mN2t/FZTMZLiFqPWc/ALSqnMnnhwrNi2rbfg/rd/IpL8Le3pSBne8+seeFVBoGqzHM9yXw==
    github.com ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ==
    gitlab.com ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBFSMqzJeV9rUzU4kWitGjeR4PWSa29SPqJ1fVkhtj3Hw9xjLVXVYrU9QlYWrOLXBpQ6KWjbjTDTdDkoohFzgbEY=
    gitlab.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAfuCHKVTjquxvt6CM6tdG4SLp1Btn/nOeHHE5UOzRdf
    gitlab.com ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCsj2bNKTBSpIYDEGk9KxsGh3mySTRgMtXL583qmBpzeQ+jqCMRgBqB98u3z++J1sKlXHWfM9dyhSevkMwSbhoR8XIq/U0tCNyokEi/ueaBMCvbcTHhO7FcwzY92WK4Yt0aGROY5qX2UKSeOvuP4D6TPqKF1onrSzH9bx9XUf2lEdWT/ia1NEKjunUqu1xOB/StKDHMoX4/OKyIzuS0q/T1zOATthvasJFoPrAjkohTyaDUz2LN5JoH839hViyEG82yB+MjcFV5MU3N1l1QL3cVUCh93xSaua1N85qivl+siMkPGbO5xR/En4iEY6K2XPASUEMaieWVNTRCtJ4S8H+9
    ssh.dev.azure.com ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC7Hr1oTWqNqOlzGJOfGJ4NakVyIzf1rXYd4d7wo6jBlkLvCA4odBlL0mDUyZ0/QUfTTqeu+tm22gOsv+VrVTMk6vwRU75gY/y9ut5Mb3bR5BV58dKXyq9A9UeB5Cakehn5Zgm6x1mKoVyf+FFn26iYqXJRgzIZZcZ5V6hrE0Qg39kZm4az48o0AUbf6Sp4SLdvnuMa2sVNwHBboS7EJkm57XQPVU3/QpyNLHbWDdzwtrlS+ez30S3AdYhLKEOxAG8weOnyrtLJAUen9mTkol8oII1edf7mWWbWVf0nBmly21+nZcmCTISQBtdcyPaEno7fFQMDD26/s0lfKob4Kw8H
    vs-ssh.visualstudio.com ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC7Hr1oTWqNqOlzGJOfGJ4NakVyIzf1rXYd4d7wo6jBlkLvCA4odBlL0mDUyZ0/QUfTTqeu+tm22gOsv+VrVTMk6vwRU75gY/y9ut5Mb3bR5BV58dKXyq9A9UeB5Cakehn5Zgm6x1mKoVyf+FFn26iYqXJRgzIZZcZ5V6hrE0Qg39kZm4az48o0AUbf6Sp4SLdvnuMa2sVNwHBboS7EJkm57XQPVU3/QpyNLHbWDdzwtrlS+ez30S3AdYhLKEOxAG8weOnyrtLJAUen9mTkol8oII1edf7mWWbWVf0nBmly21+nZcmCTISQBtdcyPaEno7fFQMDD26/s0lfKob4Kw8H

  ## @param config.extraKnownHosts Add extra known hosts to the known hosts list
  ## E.g.:
  ##   extraKnownHosts: |
  ##     gitlab.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAfuCHKVTjquxvt6CM6tdG4SLp1Btn/nOeHHE5UOzRdf
  ##     gitlab.com ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCsj2bNKTBSpIYDEGk9KxsGh3mySTRgMtXL583qmBpzeQ+jqCMRgBqB98u3z++J1sKlXHWfM9dyhSevkMwSbhoR8XIq/U0tCNyokEi/ueaBMCvbcTHhO7FcwzY92WK4Yt0aGROY5qX2UKSeOvuP4D6TPqKF1onrSzH9bx9XUf2lEdWT/ia1NEKjunUqu1xOB/StKDHMoX4/OKyIzuS0q/T1zOATthvasJFoPrAjkohTyaDUz2LN5JoH839hViyEG82yB+MjcFV5MU3N1l1QL3cVUCh93xSaua1N85qivl+siMkPGbO5xR/En4iEY6K2XPASUEMaieWVNTRCtJ4S8H+9
  ##
  extraKnownHosts: ""

  ## @param config.createExtraKnownHosts Whether to create or not the extra known hosts configmap
  ##
  createExtraKnownHosts: true

  ## @param config.styles Custom CSS styles
  ## Ref: https://argo-cd.readthedocs.io/en/stable/operator-manual/custom-styles/
  ## E.g.:
  ## styles: |
  ##  .nav-bar {
  ##    background: linear-gradient(to bottom, #999, #777, #333, #222, #111);
  ##  }
  ##
  styles: ""

  ## @param config.existingStylesConfigmap Use an existing styles configmap
  ##
  existingStylesConfigmap: ""

  ## @param config.tlsCerts TLS certificates used to verify the authenticity of the repository servers
  ## Certificates will be generated by default if the values are not set.
  ## E.g:
  ## tlsCerts:
  ##   argocd-1.example.com: |
  ##     -----BEGIN CERTIFICATE-----
  ##     (...)
  ##     -----END CERTIFICATE-----
  ##   argocd-2.example.com: |
  ##     -----BEGIN CERTIFICATE-----
  ##     (...)
  ##     -----END CERTIFICATE-----
  ##
  tlsCerts: {}

  ## @param config.gpgKeys GnuPG public keys to add to the keyring
  ## Keys will be generated by default if the values are not set.
  ## Note: Public keys should be exported with `gpg --export --armor <KEY>`
  ##
  gpgKeys: {}
    # 4AEE18F83AFDEB23: |
    #   -----BEGIN PGP PUBLIC KEY BLOCK-----
    #   ...
    #   -----END PGP PUBLIC KEY BLOCK-----

  ## Argo CD general secret configuration
  ##
  secret:
    ## @param config.secret.create Whether to create or not the secret
    ##
    create: true
    ## Annotations to be added to argocd-secret
    ## @param config.secret.annotations General secret extra annotations
    ##
    annotations: {}

    ## Webhook Configs
    ## @param config.secret.githubSecret GitHub secret to configure webhooks
    ## @param config.secret.gitlabSecret GitLab secret to configure webhooks
    ## @param config.secret.bitbucketServerSecret BitBucket secret to configure webhooks
    ## @param config.secret.bitbucketUUID BitBucket UUID to configure webhooks
    ## @param config.secret.gogsSecret Gogs secret to configure webhooks
    ##
    githubSecret: ""
    gitlabSecret: ""
    bitbucketServerSecret: ""
    bitbucketUUID: ""
    gogsSecret: ""

    ## Extra keys to add to the general config secret. Useful for injecting SSO secrets into environment variables.
    ## Ref: https://argo-cd.readthedocs.io/en/stable/operator-manual/user-management/#sso
    ## @param config.secret.extra Extra keys to add to the configuration secret.
    ## All values must be non-empty.
    ## E.g:
    ##  LDAP_PASSWORD: "mypassword"
    ##
    extra: {}

    ## Argo CD TLS Data.
    ## @param config.secret.argocdServerTlsConfig.key TLS key for the Argo CD config secret
    ## @param config.secret.argocdServerTlsConfig.crt TLS certificate for the Argo CD config secret
    ## E.g:
    ##   key:
    ##   crt: |
    ##     -----BEGIN CERTIFICATE-----
    ##     <cert data>
    ##     -----END CERTIFICATE-----
    ##     -----BEGIN CERTIFICATE-----
    ##     <ca cert data>
    ##     -----END CERTIFICATE-----
    ##
    argocdServerTlsConfig:
      key: ""
      crt: ""

    ## Argo admin password
    ## @param config.secret.argocdServerAdminPassword Argo CD server admin password. Autogenerated by default.
    ##
    argocdServerAdminPassword: ""
    ## Password modification time defaults to current time if not set
    ## @param config.secret.argocdServerAdminPasswordMtime Argo CD server password modification time
    ## E.g:
    ## argocdServerAdminPasswordMtime: "2006-01-02T15:04:05Z"
    ##
    argocdServerAdminPasswordMtime: ""

    ## Create a secret with optional repository credentials
    ## @param config.secret.repositoryCredentials Repository credentials to add to the Argo CD server confgi secret
    ## E.g.
    ## repositoryCredentials:
    ##   sample-ssh-key: |
    ##     -----BEGIN RSA PRIVATE KEY-----
    ##     <key content>
    ##     -----END RSA PRIVATE KEY-----
    ##
    repositoryCredentials: {}

  ## External Cluster Credentials
  ## Refs:
  ## - https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup/#clusters
  ## - https://argo-cd.readthedocs.io/en/stable/operator-manual/security/#external-cluster-credentials
  ## @param config.clusterCredentials Configure external cluster credentials
  ## E.g
  ##  - name: mycluster
  ##   server: https://mycluster.com
  ##   labels: {}
  ##   annotations: {}
  ##   config:
  ##     bearerToken: "<authentication token>"
  ##     tlsClientConfig:
  ##       insecure: false
  ##       caData: "<base64 encoded certificate>"
  ## - name: mycluster2
  ##   server: https://mycluster2.com
  ##   labels: {}
  ##   annotations: {}
  ##   namespaces: namespace1,namespace2
  ##   config:
  ##     bearerToken: "<authentication token>"
  ##     tlsClientConfig:
  ##       insecure: false
  ##       caData: "<base64 encoded certificate>"
  ##
  clusterCredentials: []

## @section Init Container Parameters

## 'volumePermissions' init container parameters
## Changes the owner and group of the persistent volume mount point to runAsUser:fsGroup values
##   based on the *podSecurityContext/*containerSecurityContext parameters
##
volumePermissions:
  ## @param volumePermissions.enabled Enable init container that changes the owner/group of the PV mount point to `runAsUser:fsGroup`
  ##
  enabled: false
  ## Bitnami Shell image
  ## ref: https://hub.docker.com/r/bitnami/bitnami-shell/tags/
  ## @param volumePermissions.image.registry Bitnami Shell image registry
  ## @param volumePermissions.image.repository Bitnami Shell image repository
  ## @param volumePermissions.image.tag Bitnami Shell image tag (immutable tags are recommended)
  ## @param volumePermissions.image.digest Bitnami Shell image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag
  ## @param volumePermissions.image.pullPolicy Bitnami Shell image pull policy
  ## @param volumePermissions.image.pullSecrets Bitnami Shell image pull secrets
  ##
  image:
    registry: docker.io
    repository: bitnami/bitnami-shell
    tag: 11-debian-11-r115
    digest: ""
    pullPolicy: IfNotPresent
    ## Optionally specify an array of imagePullSecrets.
    ## Secrets must be manually created in the namespace.
    ## ref: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/
    ## e.g:
    ## pullSecrets:
    ##   - myRegistryKeySecretName
    ##
    pullSecrets: []
  ## Init container's resource requests and limits
  ## ref: https://kubernetes.io/docs/user-guide/compute-resources/
  ## @param volumePermissions.resources.limits The resources limits for the init container
  ## @param volumePermissions.resources.requests The requested resources for the init container
  ##
  resources:
    limits: {}
    requests: {}
  ## Init container Container Security Context
  ## ref: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-container
  ## @param volumePermissions.containerSecurityContext.runAsUser Set init container's Security Context runAsUser
  ## NOTE: when runAsUser is set to special value "auto", init container will try to chown the
  ##   data folder to auto-determined user&group, using commands: `id -u`:`id -G | cut -d" " -f2`
  ##   "auto" is especially useful for OpenShift which has scc with dynamic user ids (and 0 is not allowed)
  ##
  containerSecurityContext:
    runAsUser: 0

## @section Other Parameters

## RBAC configuration
##
rbac:
  ## @param rbac.create Specifies whether RBAC resources should be created
  ##
  create: true

## Redis parameters
##
redis:
  ## Bitnami Redis image
  ## ref: https://hub.docker.com/r/bitnami/redis/tags/
  ## @param redis.image.registry Redis image registry
  ## @param redis.image.repository Redis image repository
  ## @param redis.image.tag Redis image tag (immutable tags are recommended)
  ## @param redis.image.digest Redis image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag
  ## @param redis.image.pullPolicy Redis image pull policy
  ## @param redis.image.pullSecrets Redis image pull secrets
  ##
  image:
    registry: docker.io
    repository: bitnami/redis
    tag: 7.0.11-debian-11-r8
    digest: ""
    ## Specify a imagePullPolicy
    ## Defaults to 'Always' if image tag is 'latest', else set to 'IfNotPresent'
    ## ref: https://kubernetes.io/docs/user-guide/images/#pre-pulling-images
    ##
    pullPolicy: IfNotPresent
    ## Optionally specify an array of imagePullSecrets.
    ## Secrets must be manually created in the namespace.
    ## ref: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/
    ## e.g:
    ## pullSecrets:
    ##   - myRegistryKeySecretName
    ##
    pullSecrets: []

  ## @param redis.enabled Enable Redis dependency
  ##
  enabled: true

  ## @param redis.nameOverride Name override for the Redis dependency
  ##
  nameOverride: ""
  ## @param redis.service.port Service port for Redis dependency
  ##
  service:
    port: 6379

  ## Use password authentication
  ## @param redis.auth.enabled Enable Redis dependency authentication
  ## @param redis.auth.existingSecret Existing secret to load redis dependency password
  ## @param redis.auth.existingSecretPasswordKey Pasword key name inside the existing secret
  ##
  auth:
    enabled: true
    ## Name of existing secret object containing the password
    ##
    existingSecret: ""
    ##
    ## Password key to be retrieved from Redis&reg; secret
    ##
    existingSecretPasswordKey: 'redis-password'

  ## Cluster settings
  ## @param redis.architecture Redis&reg; architecture. Allowed values: `standalone` or `replication`
  ## TODO(miguelaeh): We need to test the chart with redis sentinel, it seems to be supported at: https://github.com/argoproj/argo-cd/blob/2a410187565e15633b6f2a8c8d8da22cf02b257d/util/cache/cache.go#L40
  ##
  persistence:
    persistence: longhorn
  architecture: standalone

##
## External Redis&reg;
##
externalRedis:
  ## Redis&reg; host
  ## @param externalRedis.host External Redis host
  ##
  host: ""
  ## Redis&reg; port
  ## @param externalRedis.port External Redis port
  ##
  port: 6379
  ## Redis&reg; password for authentication
  ## Ignored if existingSecret is set
  ## @param externalRedis.password External Redis password
  ##
  password: ""
  ## Name of existing secret object containing the password
  ## @param externalRedis.existingSecret Existing secret for the external redis
  ##
  existingSecret: ""
  ## Password key to be retrieved from Redis&reg; secret
  ## @param externalRedis.existingSecretPasswordKey Password key for the existing secret containing the external redis password
  ##
  existingSecretPasswordKey: 'redis-password'

## Wait-for-redis init container configuration
##
redisWait:
  ## @param redisWait.enabled Enables waiting for redis
  ##
  enabled: true
  ## @param redisWait.extraArgs Additional arguments for the redis-cli call, such as TLS
  ##
  extraArgs: ''
  ## @param redisWait.securityContext Security context for init container
  ##
  securityContext: {}
