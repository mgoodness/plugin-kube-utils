complete -c "kube-rotate" -f
complete -xc "kube-rotate" -s c -l context -a "(__fish_print_k8s_contexts)"
complete -xc "kube-rotate" -s n -l node -a "(__fish_print_k8s_nodes)"
complete -xc "kube-rotate" -s p -l profile -a "(__fish_print_aws_profiles)"
