function unschedulable -d 'Lists unschedulable pods'
  kubectl get pods --all-namespaces -o json | \
  jq '.items[] | select(.status.conditions[].reason == "Unschedulable") | {"name": .metadata.name, "namespace": .metadata.namespace, "tier": .spec.nodeSelector.tier}'
end
