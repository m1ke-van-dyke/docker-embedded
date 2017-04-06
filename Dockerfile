FROM debian:jessie

RUN apt-get update && \
    apt-get install -y build-essential \
                        git  \
                        cmake  \
                        gcc \
                        python \
                        gcc-arm-none-eabi  \
                        qemu-user \
                        gcovr \
                        wget \
                        curl \
                    && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
