complete -c "kube-reboot" -f
complete -xc "kube-reboot" -s c -l context -a "(__fish_print_k8s_contexts)"
complete -xc "kube-reboot" -s n -l node -a "(__fish_print_k8s_nodes)"
complete -xc "kube-reboot" -s p -l profile -a "(__fish_print_aws_profiles)"
