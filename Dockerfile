FROM ubuntu:14.10
MAINTAINER Reto Gmür "reto@apache.org"

RUN apt-get update && apt-get install -y wget openjdk-7-jdk

# Java 8 version
#RUN sed 's/main$/main universe/' -i /etc/apt/sources.list && \
#    apt-get update && apt-get install -y software-properties-common && \
#    add-apt-repository ppa:webupd8team/java -y && \
#    apt-get update && \
#    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
#    apt-get install -y oracle-java8-installer libxext-dev libxrender-dev libxtst-dev && \

RUN  apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

RUN export uid=1000 gid=1000 && \
    adduser --disabled-password --gecos "Clerezza User" --uid 1000 clerezza && \
    echo "clerezza ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/clerezza && \
    chmod 0440 /etc/sudoers.d/clerezza

RUN mkdir -p /home/clerezza/workspace; \
    cd /home/clerezza; wget http://repo1.maven.org/maven2/org/apache/clerezza/platform.launcher.tdb/0.5-incubating/platform.launcher.tdb-0.5-incubating.jar

ADD files/start.sh /usr/local/bin/start.sh

RUN chmod +x /usr/local/bin/start.sh && \
    chown clerezza:clerezza /home/clerezza/workspace

USER clerezza

ENV HOME /home/clerezza
WORKDIR /home/clerezza/workspace
CMD /usr/local/bin/start.sh