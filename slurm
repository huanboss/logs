root@hl-bcm-head-01:/cm/shared# srun -v -w dgx04,dgx05 -N 2 --gres=gpu:3 --export="NCCL_NET=IB,NCCL_DEBUG=TRACE,PMIX_MCA_gds=hash,CUDA_VISIBLE_DEVICES=1,2,3" --mpi=pmix --container-image=/cm/shared/nvidia+pytorch+24.09-py3.sqsh --container-mounts=/dev/infiniband:/dev/infiniband,/run/udev:/run/udev:ro all_reduce_perf_mpi -b 1G -e 32G -f 2 -g 3
srun: defined options
srun: -------------------- --------------------
srun: export              : NCCL_NET=IB,NCCL_DEBUG=TRACE,PMIX_MCA_gds=hash,CUDA_VISIBLE_DEVICES=1,2,3
srun: gres                : gres/gpu:3
srun: mpi                 : pmix
srun: nodelist            : dgx04,dgx05
srun: nodes               : 2
srun: verbose             : 1
srun: -------------------- --------------------
srun: end of defined options
srun: Waiting for resource configuration
srun: Nodes dgx[04-05] are ready for job
srun: jobid 62: nodes(2):`dgx[04-05]', cpu counts: 2(x2)
srun: CpuBindType=(null type)
srun: launching StepId=62.0 on host dgx04, 1 tasks: 0
srun: launching StepId=62.0 on host dgx05, 1 tasks: 1
srun: topology/default: init: topology Default plugin loaded
srun: Node dgx04, 1 tasks started
srun: Node dgx05, 1 tasks started
# nThread 1 nGpus 3 minBytes 1073741824 maxBytes 34359738368 step: 2(factor) warmup iters: 5 iters: 20 agg iters: 1 validation: 1 graph: 0
#
# Using devices
#  Rank  0 Group  0 Pid 4140700 on      dgx04 device  0 [0x1b] NVIDIA H200
#  Rank  1 Group  0 Pid 4140700 on      dgx04 device  1 [0x43] NVIDIA H200
#  Rank  2 Group  0 Pid 4140700 on      dgx04 device  2 [0x52] NVIDIA H200
#  Rank  3 Group  0 Pid 230137 on      dgx05 device  0 [0x1b] NVIDIA H200
#  Rank  4 Group  0 Pid 230137 on      dgx05 device  1 [0x52] NVIDIA H200
#  Rank  5 Group  0 Pid 230137 on      dgx05 device  2 [0x61] NVIDIA H200
dgx04:4140700:4140700 [0] NCCL INFO Bootstrap : Using ibp24s0:10.65.8.14<0>
dgx05: Test CUDA failure common.cu:652 'out of memory'
 .. dgx05 pid 230137: Test failure common.cu:941
 .. dgx05 pid 230137: Test failure common.cu:843
dgx04: Test CUDA failure common.cu:652 'out of memory'
 .. dgx04 pid 4140700: Test failure common.cu:941
 .. dgx04 pid 4140700: Test failure common.cu:843
slurmstepd: error:  mpi/pmix_v4: _errhandler: dgx05 [1]: pmixp_client_v2.c:211: Error handler invoked: status = -61, source = [slurm.pmix.62.0:1]
srun: Complete StepId=62.0 received
srun: Job step aborted: Waiting up to 32 seconds for job step to finish.
srun: Complete StepId=62.0 received
slurmstepd: error: *** STEP 62.0 ON dgx04 CANCELLED AT 2025-11-06T16:29:10 ***
slurmstepd: error:  mpi/pmix_v4: _errhandler: dgx04 [0]: pmixp_client_v2.c:211: Error handler invoked: status = -61, source = [slurm.pmix.62.0:0]
srun: Complete StepId=62.0 received
srun: Received task exit notification for 1 task of StepId=62.0 (status=0x0200).
srun: error: dgx05: task 1: Exited with exit code 2
srun: Received task exit notification for 1 task of StepId=62.0 (status=0x0200).
srun: error: dgx04: task 0: Exited with exit code 2

