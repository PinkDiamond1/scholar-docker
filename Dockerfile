FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install locales

# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Install dependencies
RUN apt-get install -y git

# Clone dawn-v3.0.0
RUN git clone https://github.com/EOSIO/eos.git --recursive && \
    cd eos && \
    git checkout tags/dawn-v3.0.0

# Install EOS dependencies
RUN apt-get install -y curl tar clang-4.0 cmake make autoconf libtool build-essential openssl \
    lldb-4.0 libclang-4.0-dev libbz2-dev libssl-dev libgmp3-dev libbz2-dev libicu-dev python3-dev

# Install EOS.IO Software
WORKDIR /eos
ENV TEMP_DIR /tmp
RUN ./eosio_build.sh
