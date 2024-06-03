import requests
import json
import boto3
from retrieve_post_route import api_full_post_route


def post_data():
    file = "./domain_values.json"

    endpoint = api_full_post_route()

    with open(file) as f:
        data = json.load(f)

    values = {}

    values["domain"] = data['domain_name']
    values["zoneid"] = data['zoneid']
    values["ip"]= data['ip']
    response = requests.post(endpoint, json=values)

    print(response.text)


if __name__ == "__main__":
    post_data()