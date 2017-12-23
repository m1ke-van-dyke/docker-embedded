FROM debian:stretch

RUN apt-get update && \
    apt-get install -y build-essential \
                        git  \
                        cmake  \
                        gcc \
                        python \
                        gcc-arm-none-eabi  \
                        libnewlib-arm-none-eabi \
                        qemu-system-arm \
                        gcovr \
                        wget \
                    && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
    
WORKDIR home/tools/aarch64-toolchain
RUN wget -q https://releases.linaro.org/components/toolchain/binaries/7.1-2017.08/aarch64-elf/gcc-linaro-7.1.1-2017.08-x86_64_aarch64-elf.tar.xz && \
    tar xf gcc-linaro-7.1.1-2017.08-x86_64_aarch64-elf.tar.xz && \
    rm -f gcc-linaro-7.1.1-2017.08-x86_64_aarch64-elf.tar.xz

WORKDIR home/tools/bazel
RUN wget -q https://github.com/bazelbuild/bazel/releases/download/0.9.0/bazel_0.9.0-linux-x86_64.deb && \
    apt install bazel_0.9.0-linux-x86_64.deb && \
    rm -f bazel_0.9.0-linux-x86_64.deb
    
ENV PATH "$PATH:/home/tools/aarch64-toolchain/gcc-linaro-6.3.1-2017.02-x86_64_aarch64-elf/bin"
