#!/bin/bash
# This scripts initialize Kubernetes cluster and creates a script file
# for worker nodes to join the cluster.

if [ "$EUID" -ne 0 ]; then
  echo "You have to run this script with root privileges."
  exit 1
fi

kubeadm init --pod-network-cidr 10.244.0.0/16 --control-plane-endpoint ${master_external_ip}

echo "#!/bin/bash
" > /worker-join.sh
kubeadm token create --print-join-command >> /worker-join.sh

echo "Join script generated. Run the script in worker nodes to join the cluster."