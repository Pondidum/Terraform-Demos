#! /bin/sh

PROJECT_PATH="./cs/ExampleLambdaApi/ExampleLambdaApi.csproj"

dotnet restore $PROJECT_PATH
dotnet publish $PROJECT_PATH
dotnet publish $PROJECT_PATH -o ./../published
