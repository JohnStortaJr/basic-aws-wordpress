# Create an S3 bucket from the AWS CLI

## Prerequisites
- Create an AWS account (*free tier will work fine*)
- Create an IAM user for your AWS account with the `AdministratorAccess` policy
- Create an AWS Access Key and Secret Key (*be sure to save these keys*)
- Install the AWS CLI
- Configure the AWS CLI with a named profile

## Commands
Replace `BUCKET_NAME` with the actual name you wish to use for your bucket.

**s3 bucket names must be globally unique.**

Create the bucket in `us-east-1`. Adjust region as needed.

```ShellSession
aws s3api create-bucket --bucket BUCKET_NAME --region us-east-1
```

Enable versioning for the bucket

```ShellSession
aws s3api put-bucket-versioning --bucket BUCKET_NAME --versioning-configuration Status=Enabled
```