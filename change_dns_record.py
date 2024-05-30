import requests
import json

with open('./domain_values.json') as f:
    data = json.load(f)

values = {}

values["domain"] = data['domain_name']
values["zoneid"] = data['zoneid']
values["ip"]= data['ip']
api_endpoint = "https://pwu8ro7ay3.execute-api.us-east-1.amazonaws.com/updateDNS"



response = requests.post(api_endpoint, json=values)

print(response.text)