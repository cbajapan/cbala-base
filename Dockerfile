FROM centos/systemd

RUN rpm --import https://yum.corretto.aws/corretto.key \
&& curl -L -o /etc/yum.repos.d/corretto.repo https://yum.corretto.aws/corretto.repo \
&& yum -y install \
pango \
libXv \
libxml2 \
tcpdump \
wget \
initscripts \
sudo \
which \
crontabs \
unzip \
java-1.8.0-amazon-corretto-devel \
&& yum clean all

EXPOSE 9999 9990 8080 8443 16000-16004/tcp 16000-16004/udp
WORKDIR /installer/
