

# Train
# rlaunch --group=midjourney --cpu=8 --gpu=1 --memory=60000 -- bash run_ecm_1hour.sh 1 30000 --eval_every 1 --desc bs128.1hour

rlaunch --group=midjourney --cpu=8 --gpu=1 --memory=60000 -- bash run_ecm_1hour.sh 1 30000 --desc bs128.1hour


# rlaunch --group=midjourney --cpu=10 --gpu=4 --memory=60000 -- bash run_ecm.sh 4 30001 --eval_every 1 --desc bs128.200k

rlaunch --group=midjourney --cpu=10 --gpu=4 --memory=60000 -- bash run_ecm.sh 4 30001 --desc bs128.200k

# Eval
rlaunch --group=midjourney --cpu=10 --gpu=4 --memory=60000 -- bash eval_ecm.sh 4 30002 \
    --resume ct-runs/00014-cifar10-32x32-uncond-ddpmpp-ect-RAdam-0.000100-gpus1-batch128-fp32-bs128.1hour/network-snapshot-latest.pkl

rlaunch --group=midjourney --cpu=10 --gpu=4 --memory=60000 -- bash eval_ecm.sh 4 30002 \
    --resume ct-runs/00019-cifar10-32x32-uncond-ddpmpp-ect-RAdam-0.000100-gpus4-batch128-fp32-bs128.200k/network-snapshot-latest.pkl

# DEBUG
rlaunch --group=midjourney --cpu=10 --gpu=1 --memory=60000 -- bash eval_ecm.sh 1 30002 \
    --resume ct-runs/00014-cifar10-32x32-uncond-ddpmpp-ect-RAdam-0.000100-gpus1-batch128-fp32-bs128.1hour/network-snapshot-latest.pkl