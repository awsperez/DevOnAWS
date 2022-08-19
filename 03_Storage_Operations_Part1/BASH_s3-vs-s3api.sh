# Wilmar Perez
# awsperez@amazon.com
# 
# Create S3 Buckets with different users
#
#

# Let's define some variables
AWS_PROFILE="LOCAL_PROFILE"
BUCKET_NAME="RANDOM_BUCKET_NAME"
REGION="AWS_REGION"


clear
read -p "What is the region of the default profile? " -n1 -s
aws configure get region

echo ""
echo "#################################################################################"
echo ""
read -p "Next... " -n1 -s


clear
read -p "What is the region of the profile we want to use? " -n1 -s
aws configure get region --profile=$AWS_PROFILE

echo ""
echo "#################################################################################"
echo ""
read -p "Next... " -n1 -s

clear
read -p "Let's list buckets with the s3 command set " -n1 -s
aws s3 ls --profile=$AWS_PROFILE

echo ""
echo "#################################################################################"
echo ""
read -p "Next... " -n1 -s

echo ""
echo "#################################################################################"
echo ""
read -p "Let's list buckets with the s3api command set " -n1 -s
aws s3api list-buckets --profile=$AWS_PROFILE

