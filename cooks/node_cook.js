//instanciate node.js component
var comp = require('<component_value_call>');

// HTTP server with response message

var http = require("http");
var port = 8082;

http.createServer(function (request, response) {

   // Send the HTTP header 
   // HTTP Status: 200 : OK
   // Content Type: text/plain
   response.writeHead(200, {'Content-Type': 'text/plain'});
   
   // Send the response body as "Hello World"
   response.end('Hello World\n');
}).listen(port);

// Console will print the message
console.log('Server running at http://127.0.0.1:' + port +'/');

// HTTP server with response message

// HTTP angular
var connect = require('connect'),
    serveStatic = require('serve-static'),
    port = 3000;

var app = connect();

app.use(serveStatic(__dirname + '/angularjs'));
app.listen(port);

console.log('Server running at http://localhost:' + port);
// HTTP angular


//REPL exit with process.exit(1);

//NPM INSTALLER(installing node modules)
npm install express	// installing express module
//NPM INSTALLER(installing node modules)


// callback  with non blocking code example
fs.readFile("input.txt", function(err, data) {
	if (err) return console.error(err);
	console.log(data.toString());
});

//EXPORT-IMPORT  module
// classExam.js
// export by ES5
module.exports =  class Rectangle {
	constructor(height, width) {
		this.height = height;
		this.width = width;
	}
}

//moduleCall.js, call to export class in current directory
var Rectangle = require('./classExam.js');

var rect = new Rectangle(2, 5);

console.log(rect.height);
console.log(rect.width);
//EXPORT-IMPORT  module

// EVENTS and EMITTERS
// Node.js single thread application by default but can support multi-threading via events(emmiters) 

// Import events module
var events = require('events');


// Create an eventEmitter object
var eventEmitter = new events.EventEmitter();

// Create an event handler as follows
var connectHandler = function connected() {
   console.log('connection succesful.');
  
   // Fire the data_received event 
   eventEmitter.emit('data_received');
}

// Bind the connection event with the handler
eventEmitter.on('connection', connectHandler);
 
// Bind the data_received event with the anonymous function
eventEmitter.on('data_received', function(){
   console.log('data received succesfully.');
});

// Fire the connection event 
eventEmitter.emit('connection');

console.log("Program Ended.");

// EVENTS and EMITTERS

//	BUFFER
// global module can be accessed without import
// stores raw data, corresponds to raw data memory allocation(binary data)
// default encoding UTF-8
// 	Methods
//- Buffer.isEncoding(encoding)
//-	Buffer.isBuffer(obj)
//- Buffer.byteLength(string[, encoding])	
//-	Buffer.concat(list[, totalLength])
//- Buffer.compare(buf1, buf2)


//	BUFFER

// STREAMS
// reading and writing data in continuous fashion
// reading, writing, piping streams and chaining streams
  
// STREAMS

// GLOBALS
// __filename
// __dirname
// setTimeout()
// setInterval()
// GLOBALS

//UTILITY modules
OS
Path
Net
DNS
Domain
//UTILITY modules

// REST API
var express = require('express');
var fs = require('fs');

var app = express();

var user = {
		   "user4" : {
		      "name" : "mohit",
		      "password" : "password4",
		      "profession" : "teacher",
		      "id": 4
		   }
		};

// define methods available to server
// root request
app.get('/', function(req, res) {
	console.log("Got a GET request for the homepage");
	res.send('Hello GET');
});

//	GET /listUsers
app.get('/listUsers', function(req,res){
	fs.readFile(__dirname + "/" + "users.json", "utf8",function(err, data) {
		console.log(data);
		res.end(data);
	})
});

// POST - post data
app.post('/addUser', function (req, res) {
	   // First read existing users.
	   fs.readFile( __dirname + "/" + "users.json", 'utf8', function (err, data) {
	       data = JSON.parse( data );
	       data["user4"] = user["user4"];
	       console.log( data );
	       res.end( JSON.stringify(data));
	   });
	})

var id = 2;
var id = 2;

app.delete('/deleteUser', function (req, res) {

   // First read existing users.
   fs.readFile( __dirname + "/" + "users.json", 'utf8', function (err, data) {
       data = JSON.parse( data );
       delete data["user" + 2];
       
       console.log( data );
       res.end( JSON.stringify(data));
   });
});

	
// define server and server configuration
var server = app.listen(8081, function() {
	var addr = server.address().address;
	var port = server.address().port;

	console.log("Example app listening at http://%s:%s", addr, port);
})
// REST API

// SCALING APPLICATION
// parallel processing within application
// child processes always have 3 streams (exec, spawn, fork)

// SCALING APPLICATION
