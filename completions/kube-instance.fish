function __fish_print_k8s_nodes -d "Print a list of Kubernetes nodes" -a select
  command kubectl get no \
    -o go-template='{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}'
end

complete -c kube-instance -f -a "(__fish_print_k8s_nodes)"
