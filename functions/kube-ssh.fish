function __kube_ssh_print_help -d "Prints help text"
  echo "usage: kube-ssh -n|--node=<k8s_node> -u|--username=<username> [-c|--context=<k8s_context]"
end

function kube-ssh -d "Logs into a Kubernetes node using SSH"
  set -l options (fish_opt -s h -l help)
  set options $options (fish_opt -s c -l context -r)
  set options $options (fish_opt -s n -l node -r)
  set options $options (fish_opt -s u -l username -r)
  argparse -n "kube-ssh" $options -- $argv

  if test $status -ne 0
    return 1
  end

  if set -q _flag_h
    __kube_ssh_print_help
    return 0
  end

  if not set -q _flag_n _flag_u
    __kube_ssh_print_help
    return 1
  end

  set -q _flag_c; or set -l _flag_c (kubectl config current-context)

  set -l k8s_node $_flag_n
  if string match -i -r -q "^no\/.*" $k8s_node
    set k8s_node (string sub -s 4 $k8s_node)
  end

  set -l ip (kubectl --context=$_flag_c get nodes $k8s_node -o go-template='{{range .status.addresses}}{{if eq .type "InternalIP"}}{{print .address}}{{end}}{{end}}')
  ssh "$_flag_u@$ip"
end
