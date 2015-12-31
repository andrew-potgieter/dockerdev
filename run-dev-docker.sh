#!/bin/bash
docker stop dockerdev
docker rm dockerdev

docker run -it --privileged --restart=always --net host \
           -v /var/run/docker.sock:/var/run/docker.sock \
	   -v $(which docker):/bin/docker \
	   -v ~/dev:/root/dev \
	   -p 2255:2255 \
	   -w="/root/dev" --name dockerdev dockerdev:ap \
	   /root/dev-docker-run-cmd.sh

