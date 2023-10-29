FROM debian:testing

RUN apt-get update
RUN apt-get -y install bash wget sed gawk cpio gzip tar gcc make grub-common
RUN apt-get -y install xz-utils
RUN apt-get -y install flex vim binutils bison pahole util-linux	kmod	 e2fsprogs jfsutils reiserfsprogs	 xfsprogs	 squashfs-tools	btrfs-progs	pcmciautils	ppp procps	udev	grub	 iptables	 openssl  bc	sphinx cpio tar	
RUN apt-get -y install libelf-dev libssl-dev xorriso mtools grub-efi grub-pc-bin
RUN apt-get -y install texinfo g++
RUN apt-get -y install squashfs-tools

RUN rm /bin/sh && ln -s /bin/bash /bin/sh # dash doesn't have `time` command apparently

WORKDIR /app
CMD bash