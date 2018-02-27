complete -c "kube-ssh" -f
complete -xc "kube-ssh" -s c -l context -a "(__fish_print_k8s_contexts)"
complete -xc "kube-ssh" -s n -l node -a "(__fish_print_k8s_nodes)"
