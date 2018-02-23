function __kube_instance_print_help -d "Prints help text"
  echo "usage: kube-instance -n|--node=<k8s_node> -p|--profile=<aws_profile> [-r|--region=<aws_region>]"
end

function kube-instance -d "Translates a Kubernetes node name to an AWS instance ID"
  set -l options (fish_opt -s h -l help)
  set options $options (fish_opt -s n -l node -r)
  set options $options (fish_opt -s p -l profile -r)
  set options $options (fish_opt -s r -l region -r)
  argparse -n "kube-instance" $options -- $argv

  if test $status -ne 0
    return 1
  end

  if set -q _flag_h
    __kube_instance_print_help
    return 0
  end

  if not set -q _flag_n _flag_p
    __kube_instance_print_help
    return 1
  end

  set -q _flag_r; or set -l _flag_r "us-east-1"

  if string match -i -r -q "^no\/.*" $_flag_n
    set k8s_node (string sub -s 4 $k8s_node)
  end

  aws --profile $_flag_p ec2 describe-instances --out=text --region=$_flag_r \
    --filters Name=network-interface.private-dns-name,Values=$k8s_node \
    --query "Reservations[0].Instances[0].{InstanceID:InstanceId}"
end
