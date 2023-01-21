If you have multiple AWS accounts and multiple S3 buckets, you can create a CSV file with the following format:

bucket_name, account_name
bucket_name, account_name
...

Please note that this script assumes that you have the AWS CLI configured with the proper credentials and permissions for each of the accounts specified in the input file.

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

second script will output a CSV file with the bucket name, the aws account name, the object name and its size in GB.
