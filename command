pexec -c dgx-h100 -j "for i in 0 3 4 5 6 9 10 11; do ibstat -d mlx5_${i} \| grep -i \\"mlx5_\\|state\\|infiniband\"; done"

pexec -c dgx-h100 -j "lspci \| grep ConnectX"
