using System;
using Amazon.Lambda.APIGatewayEvents;
using Amazon.Lambda.Core;
using Amazon.Lambda.Serialization.Json;

namespace ExampleLambdaApi
{
	public class Handler
	{
		[LambdaSerializer(typeof(JsonSerializer))]
		public APIGatewayProxyResponse Handle(APIGatewayProxyRequest apigProxyEvent)
		{
			return new APIGatewayProxyResponse
			{
				Body = apigProxyEvent.Body,
				StatusCode = 200,
			};
		}
	}
}
