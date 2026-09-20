FROM ubuntu:24.04

SHELL ["/bin/bash", "-c"]

ARG DEBIAN_FRONTEND=noninteractive

RUN echo 'APT::Install-Recommends "0";' >> /etc/apt/apt.conf.d/99local && \
    echo 'APT::Install-Suggests   "0";' >> /etc/apt/apt.conf.d/99local && \
    echo 'APT::Get::Assume-Yes    "1";' >> /etc/apt/apt.conf.d/99local

RUN apt-get update && apt-get install apt-utils && apt-get upgrade && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp/dir

COPY scripts/01*.sh .
RUN apt-get update && bash -xe ./01*.sh && rm -rf * && rm -rf /var/lib/apt/lists/*

COPY scripts/02*.sh .
RUN apt-get update && bash -xe ./02*.sh && rm -rf * && rm -rf /var/lib/apt/lists/*

ARG CHRONOS_USER=chronos
ARG CHRONOS_UID=1001
ARG CHRONOS_GID=1001

COPY scripts/03*.sh .
RUN apt-get update && bash -xe ./03*.sh && rm -rf * && rm -rf /var/lib/apt/lists/*

ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

USER ${CHRONOS_USER}
ENV HOME=/home/${CHRONOS_USER}
WORKDIR /home/${CHRONOS_USER}

CMD ["/bin/bash"]
