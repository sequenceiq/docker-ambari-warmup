FROM sequenceiq/ambari:2.0.0-consul
MAINTAINER SequenceIQ

ADD HDP.repo /etc/yum.repos.d/
ADD HDP-UTILS.repo /etc/yum.repos.d/
ADD download-warmup-deps.sh /tmp/
RUN /tmp/download-warmup-deps.sh

RUN yum install -y wget
RUN wget http://xenia.sote.hu/ftp/mirrors/www.apache.org/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz && tar xzf apache-maven-3.3.3-bin.tar.gz -C /usr/local && cd /usr/local && ln -s apache-maven-3.3.3 maven
ENV M2_HOME /usr/local/maven
ENV PATH $PATH:$M2_HOME/bin

RUN cd /var/lib/ambari-server/resources/stacks/HDP/2.2/services && git clone https://github.com/sequenceiq/zeppelin-stack.git
