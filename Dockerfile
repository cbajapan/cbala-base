FROM ghcr.io/cbajapan/cbala-r8systemd:main

RUN yum -y install \
    pango \
    libXv \
    libxml2 \
    libpng15 \
    tcpdump \
    wget \
    initscripts \
    sudo \
    which \
    crontabs \
    unzip \
    java-1.8.0-openjdk \
    && yum clean all 

EXPOSE 9999 9990 8080 8443 16000-16004/tcp 16000-16004/udp
WORKDIR /installer/
