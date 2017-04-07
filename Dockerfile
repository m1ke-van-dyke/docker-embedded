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
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir ~/aarch64-toolchain && \
    cd ~/aarch64-toolchain && \
    wget -q https://releases.linaro.org/components/toolchain/binaries/latest/aarch64-elf/gcc-linaro-6.3.1-2017.02-x86_64_aarch64-elf.tar.xz && \
    tar xf gcc-linaro-6.3.1-2017.02-x86_64_aarch64-elf.tar.xz && \
    export PATH=$PATH:$PWD/gcc-linaro-6.3.1-2017.02-x86_64_aarch64-elf/bin
