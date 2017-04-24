'use strict';
var aws = require('aws-sdk');
var lambda = new aws.Lambda({
  region: 'eu-west-1'
});

exports.handler = function(event, context, callback) {

  console.log("start");

  var request = lambda.invoke({
    FunctionName: 'arn:aws:lambda:eu-west-1:586732038447:function:sub_lambda',
    Payload: JSON.stringify(event, null, 2),
    InvocationType: "Event"
  });

  var response = request.send();

  callback();
};
