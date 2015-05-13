FROM sequenceiq/ambari:2.0.0-consul
MAINTAINER SequenceIQ

ADD HDP.repo /etc/yum.repos.d/
ADD download-warmup-deps.sh /tmp/
RUN /tmp/download-warmup-deps.sh