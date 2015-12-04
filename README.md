#Docker cloudwatch log shipper container

Simple docker image for shipping logs to cloudwatch using awslogs.
Pass logs to ship through multiple environment variables prefixed
`CLOUDWATCH_LOGS_`. For example,

    CLOUDWATCH_LOGS_SYSLOG=/var/syslog
    CLOUDWATCH_LOGS_KERNEL=/var/log/kernel.log
    
We also need to set the IAM policy on instances to include

	{
	  "Version": "2012-10-17",
	  "Statement": [
	    {
	      "Effect": "Allow",
	      "Action": [
	        "logs:CreateLogGroup",
	        "logs:CreateLogStream",
	        "logs:PutLogEvents",
	        "logs:DescribeLogStreams"
	    ],
	      "Resource": [
	        "arn:aws:logs:*:*:*"
	    ]
	  }
	 ]
	}
 
