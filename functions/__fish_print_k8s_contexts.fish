function __fish_print_k8s_contexts -d "Prints a list of Kubernetes contexts" -a select
  command kubectl config get-contexts -o name
end
