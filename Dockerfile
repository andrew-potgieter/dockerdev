FROM docker.thinktopic.com/dockerdev

RUN add-apt-repository ppa:neovim-ppa/unstable

RUN apt-get update
RUN apt-get upgrade -y
RUN DEBIAN_FRONTEND=noninteractive && apt-get install -y -q \
    tmux iputils-ping openvpn supervisor openssh-server net-tools neovim zsh

RUN mkdir -p /var/run/sshd var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN pip install paver

RUN git clone git@github.com:thinktopic/cn-deploy.git
RUN cd cn-deploy && ./setup.sh

ENV LEIN_ROOT true

COPY target/ /root/

RUN mkdir /root/.config
RUN ln -s /root/.vim /root/.config/nvim

RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8  

