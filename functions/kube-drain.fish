function __kube_drain_print_help -d "Prints help text"
  echo "usage: kube-drain -n|--node=<k8s_node> [-c|--context=<k8s_context]"
end

function kube-drain -d "Drains a Kubernetes node"
  set -l options (fish_opt -s h -l help)
  set options $options (fish_opt -s c -l context -r)
  set options $options (fish_opt -s n -l node -r)
  argparse -n "kube-drain" $options -- $argv

  if test $status -ne 0
    return 1
  end

  if set -q _flag_h
    __kube_drain_print_help
    return 0
  end

  if not set -q _flag_n
    __kube_drain_print_help
    return 1
  end

  set -q _flag_c; or set -l _flag_c (kubectl config current-context)

  set -l k8s_node $_flag_n
  if string match -i -r -q "^no\/.*" $k8s_node
    set k8s_node (string sub -s 4 $k8s_node)
  end

  kubectl --context=$_flag_c drain --timeout=2m --delete-local-data --force \
    --ignore-daemonsets $k8s_node
end
