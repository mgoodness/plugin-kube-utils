function kube-all -d 'Runs a command in all Kubernetes contexts'
  set -l current_context (kubectl config current-context)

  for context in (kubectl config view \
    -o go-template="{{ range .contexts }}{{ .name | println }}{{ end }}")
    kubectl config use-context $context
    kubectl $argv
    echo
  end

  kubectl config use-context $current_context
end

