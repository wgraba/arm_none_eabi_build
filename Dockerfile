FROM ubuntu:18.04

WORKDIR /provision

COPY ./gcc-arm-none-eabi-latest-linux.tar.bz2 /provision

RUN mkdir -p /opt/gcc-arm-none-eabi && \
    tar xvf gcc-arm-none-eabi-latest-linux.tar.bz2 -C /opt/gcc-arm-none-eabi --strip 1 && \
    ln -s /opt/gcc-arm-none-eabi/bin/* /usr/bin && \
    rm -rf /provision

RUN apt-get --yes update && \
    apt-get --yes --no-install-recommends install \
    gawk \
    bison \
    cppcheck \
    flex \
    make \
    sed \
    && rm -rf /var/lib/apt/lists/*
