FROM amazon/aws-cli

RUN yum update -y && \
    yum install -y zip && \
    yum install -y cifs-utils && \ 
    yum install -y nfs-utils nfs4-acl-tools && \
    yum install -y tar && \
    yum clean all

ENTRYPOINT [] 