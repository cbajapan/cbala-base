FROM centos/systemd

ENV JAVA_VERSION=8 \
JAVA_UPDATE=391 \
JAVA_BUILD=10 \
JAVA_ARCH=x64 \
JAVA_DL_URL=https://javadl.oracle.com/webapps/download/AutoDL?BundleId%3D247937_0ae14417abb444ebb02b9815e2103550

RUN yum -y install \
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
&& yum clean all

RUN wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" \
"${JAVA_DL_URL}" \
-O jdk-${JAVA_VERSION}u${JAVA_UPDATE}-linux-${JAVA_ARCH}.rpm \
&& rpm -ivh jdk-${JAVA_VERSION}u${JAVA_UPDATE}-linux-${JAVA_ARCH}.rpm \
&& rm jdk-${JAVA_VERSION}u${JAVA_UPDATE}-linux-${JAVA_ARCH}.rpm

EXPOSE 9999 9990 8080 8443 16000-16004/tcp 16000-16004/udp

WORKDIR /installer/
