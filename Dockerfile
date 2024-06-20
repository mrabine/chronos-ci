FROM ubuntu:22.04

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    netbase ca-certificates git build-essential \
    chrpath diffstat gawk lz4 tmux python3-setuptools
