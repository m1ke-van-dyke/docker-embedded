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
                    && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
    
WORKDIR ~/aarch64-toolchain
RUN wget -q https://releases.linaro.org/components/toolchain/binaries/latest/aarch64-elf/gcc-linaro-6.3.1-2017.02-x86_64_aarch64-elf.tar.xz
ADD gcc-linaro-6.3.1-2017.02-x86_64_aarch64-elf.tar.xz ~/arm64-toolchain
    
ENV PATH "$PATH:~/arm64-toolchain/gcc-linaro-6.3.1-2017.02-x86_64_aarch64-elf/bin"
