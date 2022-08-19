import json
import os
import dateutil.parser
import boto3


def lambda_handler(event, context):
    
    print("We just entered the main function! Yea")
    # Load required properties
    required_instance_properties = json.loads(os.environ['required_instance_properties'])
    
    ec2_client = boto3.client('ec2')
    
    # Load desired region
    if not event or not event['region']:
        regions = [region['RegionName'] for region in ec2_client.describe_regions()['Regions']]
    else:
        regions = []
        regions.append(event['region'])
    
    # Get a list of all available instances
    # regions = [region['RegionName'] for region in ec2_client.describe_regions()['Regions']]
    # regions = ['ca-central-1', 'us-west-2']
    
    #Object to keep the information
    current_instances = []
    
    # Traverse all the regions looking for existing instances... extremely inneficient!
    for region in regions:
        # print('Instances in EC2 Region {0}:'.format(region))
        ec2_resource = boto3.resource('ec2', region_name = region)
        instances= ec2_resource.meta.client.describe_instances()
        
        for instance in instances['Reservations']:
            #Create individual dictionary object
            current_instance = {}
            current_instance['Region'] = region
            for queried_property in instance.get('Instances'):
                for required_instance_property in required_instance_properties: 
                    current_instance[required_instance_property] = queried_property.get(required_instance_property)
            
            # Append the individual instance to the list of instances
            current_instances.append(current_instance)
    
    return current_instances



    