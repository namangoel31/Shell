#!/bin/sh
echo "You are in second shell!"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install
aws s3 cp $BUCKET_URL/testcode.py /home/Shell/testcode.py
python3 /home/Shell/testcode.py
echo "second shell complete"
