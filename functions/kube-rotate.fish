function kube-rotate -d 'Drains a Kubernetes node & terminates the instance' -a k8s_node
  if test -z "$k8s_node"
    echo "usage: kube-rotate <k8s_node>"
    return 1
  end

  if string match -i -r -q "^no\/.*" $k8s_node
    set k8s_node (string sub -s 4 $k8s_node)
  end

  kubectl drain --timeout=2m --delete-local-data --force --ignore-daemonsets $k8s_node
  kubectl delete node $k8s_node

  if test $status -eq 0
    set -l instance_id (kube-instance $k8s_node)

    aws ec2 terminate-instances --instance-ids $instance_id
  end
end
