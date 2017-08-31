function kube-instance -d 'Translates Kubernetes node name to AWS instance ID' -a k8s_node
  if test -z "$k8s_node"
    echo "usage: kube-instance <k8s_node>"
    return 1
  end

  if string match -i -r -q "^no\/.*" $k8s_node
    set k8s_node (string sub -s 4 $k8s_node)
  end

  aws ec2 describe-instances --out=text\
    --filters Name=network-interface.private-dns-name,Values=$k8s_node \
    --query 'Reservations[0].Instances[0].{InstanceID:InstanceId}'
end
