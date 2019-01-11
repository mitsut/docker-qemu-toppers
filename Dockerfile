FROM mitsu48/docker-qemu-ubuntu
MAINTAINER Mitsutaka Takada

WORKDIR /home
RUN git clone https://github.com/TOPPERS-ContributedSoftware/qemu.git
WORKDIR /home/qemu
RUN git submodule init && \
git submodule update --recursive && \
git checkout stable-2.12_toppers && \
mkdir build
WORKDIR /home/qemu/build
RUN ../configure --prefix=/home/qemu-arm-softmmu-ubuntu --target-list=arm-softmmu && \
make && \
make install 

WORKDIR /home

RUN tar cvzf qemu-arm-softmmu-ubuntu-`date +%Y%m%d`.tar.gz qemu-arm-softmmu-ubuntu
