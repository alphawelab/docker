FROM amazon/aws-cli

RUN yum update -y \
  && yum install -y \
  samba-client \
  samba-common \
  cifs-utils \
  nfs-utils \
  nfs4-acl-tools \
  zip \
  tar \
  && yum clean all

ENTRYPOINT []
