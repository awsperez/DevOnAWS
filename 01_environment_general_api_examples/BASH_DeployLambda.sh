# Wilmar Perez
# Accademic Code::Demostration purposes only
# #############################################
# Deploy a Lambda function using AWS CLI
#


# Let's define some variables
# Replace LOCAL_PROFILE, AWS_ACCOUNT and ROLE_NAME with valid values

AWS_PROFILE="LOCAL_PROFILE"
FUNCTION_NAME="A_SIMPLE_LAMBDA_FUNCTION"
ZIP_FILE="fileb://Lambda_To_Deploy/deploymentPackage.zip"
RUNTIME="python3.9 "
ROLE="arn:aws:iam::AWS_ACCOUNT:role/ROLE_NAME"
HANDLER="lambda_handler"

clear

echo "Trying to delete the function in case it already exists"
aws lambda delete-function --profile $AWS_PROFILE --function-name $FUNCTION_NAME

read -p "Shall we go on? " -n1 -s

echo "################################################################################"
echo "Create the function"
aws lambda create-function --profile $AWS_PROFILE --function-name $FUNCTION_NAME --zip-file $ZIP_FILE \
                            --runtime $RUNTIME --role $ROLE --handler $HANDLER