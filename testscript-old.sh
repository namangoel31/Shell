#!/bin/sh
echo "You are in second shell!"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install
aws s3 cp s3://batchawsbucket/DbAccess/testcode.py /home/Shell/testcode.py
python3 /home/Shell/testcode.py
aws s3 cp /home/Shell/testfile.txt s3://batchawsbucket/DbAccess/testfile.txt
