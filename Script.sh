#!/bin/bash

# Input file with the list of S3 buckets and AWS accounts
input_file="input.csv"

# Output file with the size of the S3 buckets
output_file="output.csv"

# Create the output file with the header
echo "Bucket,Account,Size (GB)" > $output_file

# Read the input file line by line
while IFS=',' read -r bucket account
do
  # Get the size of the S3 bucket using the AWS CLI
  size=$(aws --profile $account s3 ls s3://$bucket --recursive | awk 'BEGIN {total=0}{total+=$3}END{print total/1024/1024/1024}')

  # Append the bucket name, account and size of the S3 bucket to the output file
  echo "$bucket,$account,$size" >> $output_file
done < $input_file
