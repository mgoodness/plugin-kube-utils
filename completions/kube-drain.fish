complete -c "kube-drain" -f
complete -xc "kube-drain" -s c -l context -a "(__fish_print_k8s_contexts)"
complete -xc "kube-drain" -s n -l node -a "(__fish_print_k8s_nodes)"
