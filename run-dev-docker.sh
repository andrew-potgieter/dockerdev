#!/bin/bash
docker stop dockerdev
docker rm dockerdev

docker run -t --privileged --restart=always --net host \
           -v /var/run/docker.sock:/var/run/docker.sock \
	   -v $(which docker):/bin/docker \
	   -v ~/Workspaces/mars:/root/dev \
	   -v ~/.vim:/root/.vim -v ~/.vimrc:/root/.vimrc \
	   -w="/root/dev" --name dockerdev -d dockerdev-ap /bin/bash

DOCKERDEV=(docker inspect --format '{{ .NetworkSettings.IPAddress }}' dockerdev)
echo "Container's ip address is $DOCKERDEV"
