# Wilmar Perez
# Accademic Code::Demostration purposes only
# #############################################
# Use of AWS CLI on S3
#
#

# Let's define some variables
# Replace the values appropiately

AWS_PROFILE_FULL_ACCESS="LOCAL_PROFILE_WITH_FULL_ACCESS"
AWS_PROFILE_LIMITED_ACCESS="LOCAL_PROFILE_WITH_LIMITED_ACCESS"
BUCKET_NAME="RANDOM_NAME_1"
BUCKET_NAME_2="RANDOM_NAME_2"
REGION="AWS_REGION"

clear
read -p "Let's try to create a new bucket with a user that has full authorization:: aws s3 mb s3://devonaws111111prettyrandombucketname123409872345666654444 --profile DevOnAWS-fullaccess " -n1 -s
aws s3 mb s3://$BUCKET_NAME --profile $AWS_PROFILE_FULL_ACCESS --region $REGION

echo ""
echo "#################################################################################"
echo ""
read -p "Let's confirm the bucket was created using a full access profile  " -n1 -s
clear
aws s3 ls --profile $AWS_PROFILE_FULL_ACCESS | grep $BUCKET_NAME

echo ""
echo "#################################################################################"
echo ""
read -p "Let's confirm the bucket was created using a limited access profile  " -n1 -s
clear
aws s3 ls --profile $AWS_PROFILE_LIMITED_ACCESS | grep $BUCKET_NAME

echo ""
echo "#################################################################################"
echo ""
read -p "Let's try to create a new bucket with a user that has limited authorization  " -n1 -s
clear
aws s3 mb s3://$BUCKET_NAME_2 --profile $AWS_PROFILE_LIMITED_ACCESS

echo ""
echo "#################################################################################"
echo ""
read -p "Let's delete that bucket that we do not need anymore!  " -n1 -s
clear
aws s3 rb s3://$BUCKET_NAME --profile $AWS_PROFILE_FULL_ACCESS --force

