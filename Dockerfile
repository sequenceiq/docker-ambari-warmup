FROM sequenceiq/ambari:2.0.0-consul
MAINTAINER SequenceIQ

ADD HDP.repo /etc/yum.repos.d/
ADD download-warmup-deps.sh /tmp/
RUN /tmp/download-warmup-deps.sh

RUN yum install -y wget
RUN wget http://mirror.cc.columbia.edu/pub/software/apache/maven/maven-3/3.3.1/binaries/apache-maven-3.3.1-bin.tar.gz && tar xzf apache-maven-3.3.1-bin.tar.gz -C /usr/local && cd /usr/local && ln -s apache-maven-3.3.1 maven
ENV M2_HOME /usr/local/maven
ENV PATH $PATH:$M2_HOME/bin

RUN cd /var/lib/ambari-server/resources/stacks/HDP/2.2/services && git clone https://github.com/abajwa-hw/zeppelin-stack.git
#RUN cd /root && git clone https://github.com/apache/incubator-zeppelin.git
#RUN cd /root && mv incubator-zeppelin zeppelin
#RUN cd /root/zeppelin && sed -i "s/<jets3t.version>0.9.0<\/jets3t.version>/<jets3t.version>0.9.3<\/jets3t.version>\n\t\t\t\t<codehaus.jackson.version>1.9.13<\/codehaus.jackson.version>/g" pom.xml && mvn clean package -Phadoop-2.6 -Dhadoop.version=2.6.0 -Pspark-1.2 -Pyarn -DskipTests
