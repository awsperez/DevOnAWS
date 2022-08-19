# For the context, use as reference:  https://docs.aws.amazon.com/lambda/latest/dg/python-context.html
# For the environment:  https://docs.aws.amazon.com/lambda/latest/dg/configuration-envvars.html
import json
import os

def lambda_handler(event, context):
    
    print('''This is going to show up in the logs! 
            The ARN of the function is --> {0}.  
            The Memory limit of the function is --> {1}'''
            .format(context.invoked_function_arn, context.memory_limit_in_mb))
            
    return {
        'statusCode': 200,
        "headers": {
            "Content-Type": "application/json"
        },
        "body": json.dumps(
            {
                'ARN': context.invoked_function_arn,
                'Log stream name': context.log_stream_name,
                'Function version': context.function_version,
                'First piece of data': event['data1'],
                'Second piece of data': event['data2'],
                'Region info from the environment': os.environ['AWS_REGION']
            }
        )
    }

### Test JSON
# {
#  "data1": "Useful information",
#  "data2": "{'Key1':'value1', 'Key2':'value2'}"
# }