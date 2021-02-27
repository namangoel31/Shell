#!/bin/sh
echo "You are in second shell!"
aws s3 cp $BUCKET_URL/testcode.py /home/Shell/testcode.py
python3 /home/Shell/testcode.py
echo "second shell complete"
