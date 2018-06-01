function __kube_reboot_print_help -d "Prints help text"
  echo "usage: kube-reboot -n|--node=<k8s_node> -p|--profile=<aws_profile> [-c|--context=<k8s_context] [-r|--region=<aws_region>]"
end

function kube-reboot -d "Drains a Kubernetes node & reboots the instance"
  set -l options (fish_opt -s h -l help)
  set options $options (fish_opt -s c -l context -r)
  set options $options (fish_opt -s n -l node -r)
  set options $options (fish_opt -s p -l profile -r)
  set options $options (fish_opt -s r -l region -r)
  argparse -n "kube-reboot" $options -- $argv

  if test $status -ne 0
    return 1
  end

  if set -q _flag_h
    __kube_reboot_print_help
    return 0
  end

  if not set -q _flag_n _flag_p
    __kube_reboot_print_help
    return 1
  end

  set -q _flag_c; or set -l _flag_c (kubectl config current-context)
  set -q _flag_r; or set -l _flag_r (string split "." -- $_flag_c)[2]; or \
    set -l _flag_r "us-east-1"

  set -l k8s_node $_flag_n
  if string match -i -r -q "^no\/.*" $k8s_node
    set k8s_node (string sub -s 4 $k8s_node)
  end

  kubectl --context=$_flag_c drain --timeout=2m --delete-local-data --force \
    --ignore-daemonsets $k8s_node

  if test $status -eq 0
    set -l instance_id (kube-instance -n$k8s_node -p$_flag_p -r$_flag_r)

    aws --profile $_flag_p ec2 reboot-instances \
      --instance-ids $instance_id --region=$_flag_r
  end
end
