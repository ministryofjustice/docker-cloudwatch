#!/bin/bash
set -e
set -x

name=awslog
backend=env
conf_file=/etc/cloudwatch/awslog.conf
mkdir -p /etc/cloudwatch

echo "[${name}] booting container."

# Detect any cluster nodes variable 
if [ -z "${AWS_REGION}" ]; then
    export AWS_REGION="eu-west-1"
fi

# Try to make initial configuration every 5 seconds until successful
until confd -onetime -backend ${backend}; do
    echo "[${name}] confd creating initial configuration."
    sleep 5
done

echo "[{$name}] starting service..."
/usr/local/bin/awslogs-agent-setup.py -n -r ${AWS_REGION} -c ${conf_file}
sleep 5

# Follow the logs to allow the script to continue running
tail -f /var/log/awslogs.log
