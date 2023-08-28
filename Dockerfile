#FROM registry.fedoraproject.org/fedora
#FROM docker.io/redhat/ubi9:latest
FROM docker.io/library/debian

#RUN yum update && yum upgrade -y
#RUN yum install yum-utils git gcc gdbm     \
#    openssl-devel libffi-devel bzip2-devel \
#    xz-devel zlib-devel ncurses-devel      \
#    sqlite-devel libuuid-devel python3-tkinter -y

RUN apt-get update
RUN apt-get install -y pkg-config build-essential gdb lcov pkg-config \
      libbz2-dev libffi-dev libgdbm-dev libgdbm-compat-dev liblzma-dev \
      libncurses5-dev libreadline6-dev libsqlite3-dev libssl-dev \
      lzma lzma-dev tk-dev uuid-dev zlib1g-dev git \
      automake libtool bison

RUN useradd -m --uid 1000 --user-group -s /bin/bash underpriv
USER underpriv

COPY --chmod=777 ./local_install.sh /home/underpriv/local_install.sh
