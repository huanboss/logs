pexec -c dgx-h100 -j "for i in 0 3 4 5 6 9 10 11; do ibstat -d mlx5_${i} \| grep -i \\"mlx5_\\|state\\|infiniband\"; done"

pexec -c dgx-h100 -j "lspci \| grep ConnectX"


pdsh -g category=k8s-control-plane service containerd restart
pdsh -g category=k8s-control-plane service kubelet restart

root@hl-bcm-head-01:~# kubectl get pod -n network-operator
NAME                                                              READY   STATUS    RESTARTS         AGE
network-operator-6d5b756846-blxsn                                 1/1     Running   11 (28d ago)     57d
network-operator-node-feature-discovery-gc-5549bd5db-8d694        1/1     Running   0                46d
network-operator-node-feature-discovery-master-67c7dcc69d-5jfnx   1/1     Running   7 (28d ago)      57d
network-operator-node-feature-discovery-worker-bftmn              1/1     Running   0                57d
network-operator-node-feature-discovery-worker-kx8d9              1/1     Running   6 (6h20m ago)    57d
network-operator-node-feature-discovery-worker-m7kxj              1/1     Running   8 (28d ago)      57d
network-operator-node-feature-discovery-worker-p525x              1/1     Running   3 (6h21m ago)    57d
network-operator-node-feature-discovery-worker-rg8hd              1/1     Running   10 (6h20m ago)   57d
network-operator-node-feature-discovery-worker-rtpgw              1/1     Running   1 (45d ago)      57d
network-operator-node-feature-discovery-worker-t99bx              1/1     Running   0                42d
network-operator-node-feature-discovery-worker-wtwpj              1/1     Running   8 (6h21m ago)    57d
network-operator-sriov-network-operator-54bbf96667-bcc6t          1/1     Running   6 (46d ago)      57d
sriov-device-plugin-9jf65                                         1/1     Running   0                39m
sriov-device-plugin-jhhw4                                         1/1     Running   0                39m
sriov-device-plugin-lm724                                         1/1     Running   0                39m
sriov-device-plugin-lw785                                         1/1     Running   0                39m
sriov-device-plugin-q9bfl                                         1/1     Running   0                39m
sriov-network-config-daemon-9twtd                                 1/1     Running   0                42d
sriov-network-config-daemon-l89nb                                 1/1     Running   0                42d
sriov-network-config-daemon-t2mdp                                 1/1     Running   0                42d
sriov-network-config-daemon-v88qp                                 1/1     Running   0                42d
sriov-network-config-daemon-zg9dh                                 1/1     Running   0                42d

  Warning  FailedScheduling  50s   default-scheduler  0/8 nodes are available: 3 node(s) had untolerated taint {node-role.kubernetes.io/control-plane: }, 5 Insufficient nvidia.com/resibp154s0, 5 Insufficient nvidia.com/resibp192s0, 5 Insufficient nvidia.com/resibp206s0, 5 Insufficient nvidia.com/resibp220s0, 5 Insufficient nvidia.com/resibp24s0, 5 Insufficient nvidia.com/resibp64s0, 5 Insufficient nvidia.com/resibp79s0, 5 Insufficient nvidia.com/resibp94s0. no new claims to deallocate, preemption: 0/8 nodes are available: 3 Preemption is not helpful for scheduling, 5 No preemption victims found for incoming pod.

kubectl -n network-operator logs ds/sriov-network-config-daemon -c sriov-network-config-daemon | tail -n 200

