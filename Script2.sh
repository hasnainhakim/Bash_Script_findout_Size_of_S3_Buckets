#!/bin/bash

# Input file with the list of S3 buckets and AWS accounts
input_file="input.csv"

# Output file with the size of the S3 buckets
output_file="output.csv"

# Create the output file with the header
echo "Bucket,Account,Object,Size (GB)" > $output_file

# Read the input file line by line
while IFS=',' read -r bucket account
do
  # Get the size of the S3 bucket using the AWS CLI
  aws --profile $account s3 ls s3://$bucket --recursive --human-readable --summarize | awk -v bucket=$bucket -v account=$account '{if($3 !~ /^Total/) { print bucket","account","$4","$3/1024/1024/1024}}' >> $output_file
done < $input_file
