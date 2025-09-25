import boto3
from botocore.exceptions import ClientError
import logging

FILENAME = "testS3.txt"

s3_client = boto3.client(
    's3',
    region_name='us-east-1',
    endpoint_url='http://localstack:4566',
    aws_access_key_id="test",
    aws_secret_access_key="test"
)

# création d'un bucket sur S3
try:
    s3_client.create_bucket(Bucket="test-bucket")
except ClientError as e:
    logging.error(e)
print()
print("> bucket \"test-bucket\" créé sur S3")

# upload d'un fichier
with open(FILENAME, "rb") as fd:
    try:
        resp=s3_client.put_object(Bucket="test-bucket", Body=fd.read(), Key=FILENAME)
    except ClientError as e:
        logging.error(e)
print("> fichier \""+FILENAME+"\" uploadé dans le bucket \"test-bucket\"")
print("> La configuration LocalStack fonctionne !")
print()