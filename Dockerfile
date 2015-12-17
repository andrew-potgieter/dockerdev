FROM docker.thinktopic.com/dockerdev

RUN apt-get update && apt-get upgrade -y
RUN DEBIAN_FRONTEND=noninteractive && apt-get install -y -q \
    tmux iputils-ping
RUN pip install paver

RUN alias d='docker' && alias dm='docker-machine' && alias dl='docker logs -f --tail=1000'

COPY ~/.m2 /root/.m2
COPY ~/.vim /root/.vim
COPY ~/.vimrc /root/.vimrc
COPY ~/.tmux.conf /root/.tmux.conf
