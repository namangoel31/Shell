aws s3 cp $BUCKET_URL/testcode.py /home/Shell/testcode.py
python3 /home/Shell/testcode.py
aws s3 cp /home/Shell/out.zip $BUCKET_URL/out.zip
