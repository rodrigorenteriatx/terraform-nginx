import json
import boto3

def lambda_handler(event, context):

    client = boto3.client('route53')

    domain = json.loads(event["body"])['domain']
    ip = json.loads(event["body"])['ip']
    zoneid = json.loads(event["body"])['zoneid']

    response = client.change_resource_record_sets(

        ChangeBatch={
            'Changes': [
                {
                    'Action': 'UPSERT',
                    'ResourceRecordSet': {
                        'Name': domain,
                        'ResourceRecords': [
                            {
                                'Value': ip,
                            },
                        ],
                        'TTL': 60,
                        'Type': 'A',
                    },
                },
            ],
            'Comment': 'Web server for rodrigonginx.com',
        },
        HostedZoneId=zoneid,
    )

    return {
        'ChangeInfo': response["Comment"]
    }
