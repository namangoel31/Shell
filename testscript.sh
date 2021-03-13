#!/bin/sh
echo "You are in second shell!"
aws s3 cp $BUCKET_URL/testcode.py /home/testcode.py
mkdir templates
aws s3 cp $BUCKET_URL/templates/index.html /home/templates/index.html
aws s3 cp $BUCKET_URL/wallstreet.csv /home/wallstreet.csv
python3 /home/Shell/testcode.py
echo "second shell complete"
