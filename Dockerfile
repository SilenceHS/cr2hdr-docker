FROM debian:10

RUN apt-get update && \
    apt-get install -y \
    mercurial \
    gcc-arm-none-eabi \
    python3-pip \
    gcc-multilib \
    exiftool \
    dcraw \
    make && \
    pip3 install docutils
RUN hg clone -r unified https://foss.heptapod.net/magic-lantern/magic-lantern
WORKDIR /magic-lantern/modules/dual_iso/
RUN make cr2hdr
RUN cp /magic-lantern/modules/dual_iso/cr2hdr /usr/bin/cr2hdr
RUN rm -fr /magic-lantern
WORKDIR /data
