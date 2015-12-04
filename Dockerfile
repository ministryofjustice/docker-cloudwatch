FROM ubuntu:trusty
MAINTAINER tools@digital.justice.gov.uk
COPY files/confd /etc/confd

RUN apt-get update 
RUN apt-get install -y \
    python \
    python-pip

ADD files/bin/confd-0.10.0-linux-amd64 /usr/local/bin/confd
RUN chmod +x /usr/local/bin/confd
COPY files/run.sh $WORKDIR
ADD https://s3.amazonaws.com/aws-cloudwatch/downloads/latest/awslogs-agent-setup.py /usr/local/bin/awslogs-agent-setup.py

RUN chmod +x /usr/local/bin/awslogs-agent-setup.py

ENTRYPOINT ["sh", "./run.sh"]
