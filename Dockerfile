FROM docker.thinktopic.com/dockerdev

RUN add-apt-repository ppa:neovim-ppa/unstable

RUN apt-get update && apt-get upgrade -y
RUN DEBIAN_FRONTEND=noninteractive && apt-get install -y -q \
    tmux iputils-ping openvpn supervisor openssh-server net-tools neovim zsh

RUN mkdir -p /var/run/sshd var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN pip install paver

RUN git clone git@github.com:thinktopic/cn-deploy.git
RUN cd cn-deploy && ./setup.sh

ENV LEIN_ROOT true

COPY client.ovpn /root/.ssh/client.ovpn
COPY ap.ovpn /root/.ssh/ap.ovpn
RUN chmod 700 /root/.ssh
RUN cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys

COPY dev-docker-run-cmd.sh /root/
COPY .m2 /root/.m2/
COPY .vim /root/.vim/
COPY .vim /root/.config/nvim/
COPY .vimrc /root/.vimrc
COPY .vimrc /root/.config/nvim/init.vim
COPY vim-init /root/vim-init

COPY .tmux.conf /root/.tmux.conf
COPY .bashrc /root/.bashrc
COPY .bash_history /root/.bash_history
