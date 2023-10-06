FROM localhost/big_box

USER root

RUN apt-get install -y curl apt-transport-https && \
    keyring_location=/usr/share/keyrings/modular-installer-archive-keyring.gpg && \
    curl -1sLf 'https://dl.modular.com/bBNWiLZX5igwHXeu/installer/gpg.0E4925737A3895AD.key' \
        |  gpg --dearmor >> ${keyring_location} && \
    curl -1sLf 'https://dl.modular.com/bBNWiLZX5igwHXeu/installer/config.deb.txt?distro=debian&codename=wheezy' \
        > /etc/apt/sources.list.d/modular-installer.list && \
    apt-get update && \
    apt-get install -y modular python3.11-venv


USER underpriv

ARG MODULAR_AUTH

RUN modular auth $MODULAR_AUTH && \
    modular install mojo && \
    ~/.local/bin/ex -snc '$-2,$d|x' $HOME/.modular/modular.cfg && \
    echo 'export PATH=~/.modular/pkg/packages.modular.com_mojo/bin:$PATH' >> ~/.bashrc && \
    echo 'export MODULAR_HOME=/home/underpriv/.modular' >> ~/.bashrc

COPY --chmod=777 ./setup_env.sh /home/underpriv/setup_env.sh

RUN /home/underpriv/setup_env.sh
