#Docker cloudwatch log shipper container

Simple docker image for shipping logs to cloudwatch using awslogs.
Pass logs to ship through multiple environment variables prefixed
CLOUDWATCH_LOGS_. For example,

    CLOUDWATCH_LOGS_SYSLOG=/var/syslog
    CLOUDWATCH_LOGS_KERNEL=/var/log/kernel.log
