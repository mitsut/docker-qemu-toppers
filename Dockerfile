FROM mitsu48/docker-qemu-ubuntu

WORKDIR /home
RUN git clone https://github.com/TOPPERS-ContributedSoftware/qemu.git
WORKDIR /home/qemu
RUN git submodule init && \
git submodule update --recursive && \
git checkout stable-2.12_toppers && \
mkdir build
WORKDIR /home/qemu/build
RUN ../configure --target-list=arm-softmmu && \
make && \
make install 

WORKDIR /home/
