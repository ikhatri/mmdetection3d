#!/bin/bash
xhost +
touch `pwd`/docker_history.txt
docker run --gpus=all --rm -it \
 --shm-size=16gb \
 -v `pwd`:/mmdetection3d \
 -v /efs/waymo_mini:/mmdetection3d/data/waymo \
 -v `pwd`/docker_history.txt:/root/.bash_history \
 -e DISPLAY=$DISPLAY \
 -h $HOSTNAME \
 --privileged \
 mmdetection3d
 