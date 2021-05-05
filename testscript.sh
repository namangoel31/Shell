aws s3 cp $BUCKET_URL/testcode.py /home/Shell/testcode.py
aws s3 cp $BUCKET_URL/dataset.csv /home/Shell/dataset.csv
python3 /home/Shell/testcode.py
aws s3 cp /home/Shell/out.zip $BUCKET_URL/out.zip
