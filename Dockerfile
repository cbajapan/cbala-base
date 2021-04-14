FROM centos/systemd

ENV JAVA_VERSION=8 \
JAVA_UPDATE=281 \
JAVA_BUILD=09 \
JAVA_TOKEN=89d678f2be164786b292527658ca1605 \
JAVA_ARCH=x64

RUN yum -y install \
pango \
libXv \
libxml2 \
tcpdump \
wget \
initscripts \
sudo \
which \
crontabs\
&& yum clean all

RUN wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" \
"http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION}u${JAVA_UPDATE}-b${JAVA_BUILD}/${JAVA_TOKEN}/jdk-${JAVA_VERSION}u${JAVA_UPDATE}-linux-${JAVA_ARCH}.rpm" \
-O jdk-${JAVA_VERSION}u${JAVA_UPDATE}-linux-${JAVA_ARCH}.rpm \
&& rpm -ivh jdk-${JAVA_VERSION}u${JAVA_UPDATE}-linux-${JAVA_ARCH}.rpm \
&& rm jdk-${JAVA_VERSION}u${JAVA_UPDATE}-linux-${JAVA_ARCH}.rpm

EXPOSE 9999 9990 8080 8443 16000-16004/tcp 16000-16004/udp

WORKDIR /installer/
