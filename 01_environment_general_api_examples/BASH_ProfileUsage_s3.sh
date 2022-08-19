# Wilmar Perez
# Accademic Code::Demostration purposes only
# #############################################
# Use of AWS CLI on S3
#
#


# Let's define some variables
# Replace LOCAL_PROFILE, AN_EXISTING_BUCKET  with valid values

AWS_PROFILE="LOCAL_PROFILE"
AWS_BUCKET="AN_EXISTING_BUCKET"

clear
read -p "Let us try to list S3 buckets without permissions:: aws s3 ls " -n1 -s
aws s3 ls
echo '##################################################################'
read -p "Let's continue... " -n1 -s

clear
read -p "Let us try to list S3 buckets with permissions:: aws s3 ls --profile [my profile] " -n1 -s
aws s3 ls --profile $AWS_PROFILE
echo '##################################################################'
read -p "Let's continue... " -n1 -s

clear
read -p "Let us try to list the content of one single S3 bucket:: aws s3 ls s3://[my bucket] --profile [my profile] " -n1 -s
aws s3 ls s3://$AWS_BUCKET  --profile $AWS_PROFILE
read -p "Let's continue... " -n1 -s
echo '##################################################################'

clear
read -p "Let us try to list the content of one single S3 bucket recursively:: aws s3 ls s3://[my bucket] --recursive --profile [my profile] " -n1 -s
aws s3 ls s3://$AWS_BUCKET  --recursive --profile $AWS_PROFILE
echo '##################################################################'
read -p "Let's continue... " -n1 -s
clear