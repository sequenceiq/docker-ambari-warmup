FROM sequenceiq/ambari:2.1.1-v1
MAINTAINER SequenceIQ

ADD HDP.repo /etc/yum.repos.d/
ADD HDP-UTILS.repo /etc/yum.repos.d/
ADD download-warmup-deps.sh /tmp/
#RUN /tmp/download-warmup-deps.sh