function kube-context -d "Switches Kubernetes context" -a context
  kubectl config use-context $context
end
