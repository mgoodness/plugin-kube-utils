function __fish_print_k8s_nodes -d "Prints a list of Kubernetes nodes" -a select
  command kubectl get nodes \
    -o go-template='{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}'
end
