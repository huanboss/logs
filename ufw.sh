#!/bin/bash

echo "=== RESET UFW ==="
ufw disable
ufw --force reset
ufw default deny incoming
ufw default allow outgoing

echo "=== Allow ICMP (ping) ==="
# UFW mặc định allow ping inbound, không cần mở.

echo "=== SSH (60022) ==="
ufw allow 60022/tcp

echo "=== CMDaemon / Cluster Management ==="
ufw allow 8080/tcp
ufw allow 8081/tcp
ufw allow 8082/udp

echo "=== Web GUI ==="
ufw allow 80/tcp
ufw allow 443/tcp

echo "=== PXE Node Provisioning ==="
ufw allow 67:68/udp
ufw allow 69/udp
ufw allow 873/tcp
ufw allow 873/udp

echo "=== Authentication / LDAP / NTP ==="
ufw allow 389/tcp
ufw allow 636/tcp
ufw allow 123/udp

echo "=== NFS FULL (TCP/UDP) ==="
ufw allow 111/tcp
ufw allow 111/udp
ufw allow 2049/tcp
ufw allow 2049/udp
ufw allow 942/tcp
ufw allow 942/udp
ufw allow 4000/tcp
ufw allow 4000/udp
ufw allow 4001/tcp
ufw allow 4001/udp
ufw allow 4002/tcp
ufw allow 4002/udp
ufw allow 4003/tcp
ufw allow 4003/udp
ufw allow 4005/udp

echo "=== Kubernetes Control Plane ==="
ufw allow 2379/tcp
ufw allow 2380/tcp
ufw allow 6443/tcp
ufw allow 10443:10444/tcp
ufw allow 10249:10259/tcp

echo "=== Worker Node Ports ==="
ufw allow 30000:32767/tcp
ufw allow 30000:32767/udp

echo "=== BCM Networking 6780–6784 ==="
ufw allow 6780:6784/tcp
ufw allow 6780:6784/udp

echo "=== Workload Managers ==="
# SLURM
ufw allow 6817/tcp
ufw allow 6818/tcp
ufw allow 6819/tcp

# PBS PRO
ufw allow 15001:15007/tcp
ufw allow 15001:15007/udp

# UGE
ufw allow 6444/tcp
ufw allow 6445/tcp

# LSF
ufw allow 7869/tcp
ufw allow 7869/udp
ufw allow 6878/tcp
ufw allow 6881/tcp
ufw allow 6882/tcp
ufw allow 6891/tcp

echo "=== NVIDIA / DGX ==="
ufw allow 5555/tcp
ufw allow 9100/tcp

echo "=== Additional Operational Ports ==="
ufw allow 53/tcp
ufw allow 53/udp
ufw allow 514/udp
ufw allow 161:162/udp
ufw allow 8472/udp
ufw allow 9090/tcp
ufw allow 9000/tcp
ufw allow 9000/udp
ufw allow 9099/tcp
ufw allow 9400/tcp
ufw allow 2381/tcp

echo "=== BGP / VXLAN / WireGuard / Calico / Cilium ==="
ufw allow 179/tcp
ufw allow 4789/udp
ufw allow 5473/tcp
ufw allow 51820/udp
ufw allow 51821/udp

echo "=== ENABLE UFW ==="
ufw --force enable

echo "=== DONE ==="
ufw status numbered
