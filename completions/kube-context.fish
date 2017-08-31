function __fish_print_k8s_contexts -d 'Print a list of Kubernets contexts' -a select
  command kubectl config view \
    -o go-template="{{ range .contexts }}{{ .name | println }}{{ end }}"
end

complete -c kube-context -f -a "(__fish_print_k8s_contexts)"
