import json
import boto3
from datetime import datetime

def get_api_endpoint(client , api_id):
    api= client.get_api(ApiId=api_id)
    endpoint = ""
    # We traverse a list of APIs to find the API that contaings the tags Method: POST and ApiId: whatever the id of the API is.
    # This will return the endpoint of the API
    endpoint = api['ApiEndpoint']

    return endpoint  if endpoint else "No endpoint found"

def get_route_from_list(client, api_id):
    # We traverse a list of routes to find the route that is a POST method, then return the route key value
    route_list = client.get_routes(ApiId=api_id)

    route_value = ""

    for route in route_list['Items']:
        if 'POST' in route["RouteKey"]:
            route_value = route['RouteKey'].split(" ")[1]
            break
    return route_value if route_value else "No route found"


def api_full_post_route():

    # class DateTimeEncoder(json.JSONEncoder):
    #     def default(self, o):
    #         if isinstance(o, datetime):
    #             return o.isoformat()

    #         return super().default(o)

    client = boto3.client('apigatewayv2')
    api_id = get_api_id(client)
    endpoint = get_api_endpoint(client, api_id)
    route = get_route_from_list(client, api_id)


    # full_info = client.get_api(ApiId=api_id)['ApiEndpoint']

    #Use this to print api_info. you can alsu vall get_routes, just passs the apiId and it wil list the routes for the api
    # api_info = client.get_apis()
    # print(json.dumps(api_info,cls=DateTimeEncoder ,indent=4))

    # print(endpoint + route)

    # api_endpoint = full_info['ApiEndpoint']
    # route = route_info['RouteKey'].split(" ")[1]
    #https://SOMEURL+ /ROUTE

    return endpoint + route

def get_api_id(client):
    api_id = ""
    api_name = "updateRecordsAPI"
    api_list = client.get_apis()
    for api in api_list['Items']:
        if api['Name'] == api_name:
            api_id = api['ApiId']
            break
    return api_id if api_id else "No api found"


if __name__ == "__main__":
    api_full_post_route()
