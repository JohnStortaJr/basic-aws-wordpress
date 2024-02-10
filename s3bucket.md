# Create an S3 bucket from the AWS CLI

## Cost
S3 buckets are part of the AWS free tier with limitations on the amount
of space you consume and the number of PUTs and GETs. Be sure to check
the current restrictions before creating the resource. 

## Prerequisites
Be sure that the prerequisites specified in the [README.md](README.md) file are completed before proceeding with the steps listed here.

## Naming
- Replace `BUCKET_NAME` in the comamnds with the actual name you wish to use for your bucket
- **s3 bucket names must be globally unique**

## Commands
Create the bucket in `us-east-1` using default values. Adjust region as needed.

```ShellSession
aws s3api create-bucket --bucket BUCKET_NAME --region us-east-1
```

Enable versioning for the bucket

```ShellSession
aws s3api put-bucket-versioning --bucket BUCKET_NAME --versioning-configuration Status=Enabled
```