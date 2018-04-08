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

# Install EOS.IO Software
RUN cd eos && ./eosio_build.sh
