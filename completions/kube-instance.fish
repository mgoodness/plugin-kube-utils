complete -c "kube-instance" -f
complete -xc "kube-instance" -s n -l node -a "(__fish_print_k8s_nodes)"
complete -xc "kube-instance" -s p -l profile -a "(__fish_print_aws_profiles)"
