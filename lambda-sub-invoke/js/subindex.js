'use strict';
console.log('Loading event');

exports.handler = function(event, context) {
  console.log("start");
  setTimeout(function() {
    console.log("time's up");
  }, 10 * 1000);
};
