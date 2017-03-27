'use strict';
console.log('Loading event');

exports.handler = function(event, context, callback) {
  console.log('"Hello":"World"');
  callback(null, {
    statusCode: '200',
    body: JSON.stringify({ 'message': 'hello world' }),
    headers: {
      'Content-Type': 'application/json',
    },
  });
};
