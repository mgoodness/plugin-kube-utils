function kube-all -d "Runs a command in all Kubernetes contexts"
  for context in (kubectl config get-contexts -o name)
    echo "## $context"
    kubectl --context $context $argv
    echo
  end
end
