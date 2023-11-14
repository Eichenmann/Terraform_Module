#!/bin/bash
echo "Hello, World!" > /tmp/hello.txt
aws s3 cp /tmp/hello.txt s3://${bucket_name}/hello.txt
