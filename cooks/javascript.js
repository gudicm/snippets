//////////////
// intellinsense 

Instead, we just need a jsconfig.json file at the root directory of your project.



1. jsconfig.json
Create an empty jsconfig.json at the root of your project. You need this jsconfig.json file to get cross-file IntelliSense to work.



2. Install Typings
npm install typings –D

Assuming you have a package.json file, the –D argument will have Typings listed as a dev dependency.



3. Grabs the typings files from the Definitely Typed repository
typings install angular --ambient --save

//////////////
//////////////
// JAVASCRIPT
//////////////// ECMA script standard for java script (current version 7)
// data types
// strings, numbers, objects
// data types
// arrays
a = [1,2,3];
array = new Array('one','two','three');

typeof 'John' // string

a.sort();		// sorting arrays
a.reverse();	// sorting reverse
// arrays
// eval  evaluates and return value of statement
console.log(eval(1+3));
console.log(eval(1+'3'));
console.log(eval('str'+ 5));
// eval 

// imports 
// module.js
export function hello() {
  return "Hello";
}

// main.js
import {hello} from 'module'; // or './module'
let val = hello(); // val is "Hello";
// imports 

// try-catch
try {
    addlert('hello');    
} catch (err) {
    console.log(err.message);
}
// try-catch

// retrieving DOM elements
// note: 
// callback of element by property must be sequentially, after HTML is written
var element = document.getElementById("id");
var element = document.getElementByName("id");
var element = document.getElementsByClassName("className");
// retrieving DOM elements


// events 
// (listeners)
<body name='bodyTag'>
    <h4>Test page for javascript</h4>
    <div id='divFoo' name ='divFoo'>foo</div>
    <button id ='btnTest'>Test</button>
<script lang="javascript">

    var btn = document.getElementById('btnTest');
    console.log(btn.innerText);
    
    var div = document.getElementById('divFoo');
    console.log(div.innerText);

    btn.addEventListener('click',function () {
        btn.innerText='Foo';
    })
    
</script>
</body>
// events 

// JSON
// converts object to string
var strJson = JSON.stringify(student);
console.log(typeof (strJson));

// converts JSON string to JSON object
var objJson= JSON.parse(strJson);

// JSON

//THREAD SLEEP
setTimeout(function() {
   //Do some stuff here
}, 3000);
//THREAD SLEEP

//SYS TIME
console.log(date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds());
//SYS TIME

// callback  with non blocking code example
fs.readFile("input.txt", function(err, data) {
	if (err) return console.error(err);
	console.log(data.toString());
});

//EXIT
process.exit(0); // System.exit(0);
process.exit(1); // System.exit(1);

//EXIT

// callback (for async operation, if result should be return after some condition, time)
// Execute the function "doThis" with another function as parameter, in this case "andThenThis". doThis will execute whatever code it has and when it finishes it should have "andThenThis" being executed.
doThis(andThenThis)
// Inside of "doThis" it's referenced as "callback" which is just a variable that is holding the reference to this function
function andThenThis() {
  console.log('and then this')
}
// You can name it whatever you want, "callback" is common approach
function doThis(callback) {
  console.log('this first')
  
  // the '()' is when you are telling your code to execute the function reference else it will just log the reference
  callback()
}
// promises (for async operation in javascript)


//////////////
// JAVASCRIPT
//////////////


//////////////
// NODE
//////////////

// npm node package manager
npm install 'package'
npm install 'package' --save-dev		
npm install 'package' -g		// install package to global repo

//list
npm ls, npm list
npm ls -g  						// get list of globally installed packages


// require
// part of node.js to load(import modules) 
//////////////
// NODE
//////////////
// with require
// qs		querystring parsing and stringify library
// assert	used for unit test of javascript code

//////////////
//	JQUERY
//////////////
// framework to be used for manipulating html elements
// script example(html elements can be referenced by name, class or id )
$(document).ready(function() {
  alert("... onLoad()...");

  // for all button click (name selector)
  $("button").click(function(params) {
    $("p").text("Some text in ps!!!");
  });

  // btnP1 click( id selector)
  $("#btnP1").click(function() {
    $("#p1").text("Due to btnP1 click!!!");
  });

  
});

//////////////
// bootstrap
//////////////

//////////////
// bootstrap
//////////////

//////////////
//	JQUERY
//////////////

//////////////
// ANGULARJS
//////////////

// project setup
npm init -y							// create package.json
npm install angular --save			// install angular dependencies
-- check my first app

// reserved functions
// to use some initialization during view loading 
activate()
init()

// init example
var init  = function() {
  alert("in getUsers()...");
}
// then call
init();

// factory vs service vs provider
// factory returns are object, factory needs to be injected

//////////////
// ANGULARJS
//////////////

//////////////
// ANGULAR2
//////////////

// ng 

ng new app-name			// creates new app with app folder
ng serve [--port <port_number>]		// ng serve --port 4201 // sutom port setting to run app  
ng generate component comp-name // generates new component under application <app> folder

// ng 

// npm
npm start				// starts app server in live mode on default port, any changes immediately propagated  
// npm

// app

app.component.ts— the component class code, written in TypeScript.
app.component.html— the component template, written in HTML.
app.component.css— the component's private CSS styles.

// root configuration example 
import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'Tour of Heroes';
}

// app.module.ts		contains METADATA information for required library in app
// below example for simple configuration that includes 2 way binding (NgModel)


import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms'; // <-- NgModel lives here
import { NgModule } from '@angular/core';


import { AppComponent } from './app.component';
import { HeroesComponent } from './heroes/heroes.component';


@NgModule({
  declarations: [
    AppComponent,
    HeroesComponent
  ],
  imports: [
    BrowserModule, FormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
// app.module.ts


					 		 
// app

//////////////
// ANGULAR2
//////////////

//////////////
// TYPESCRIPT
//////////////

// variable declaration
var name: string;

// function
function greeter(user) {
  return "Hello, " + user;
}

//OPTIONAL PARAM
//function optional param
function function_name (param1[:type], param2[:type], param3[:type])
// example optional
function disp_details(id:number,name:string,mail_id?:string) { 
   console.log("ID:", id); 
   console.log("Name",name); 
   
   if(mail_id!=undefined)  
   console.log("Email Id",mail_id); 
}
disp_details(123,"John");
disp_details(111,"mary","mary@xyz.com");

// Object Number
var var_name = new Number(value)

var month = 0 
if( month<=0 || month >12) { 
   month = Number.NaN 
   console.log("Month is "+ month) 
} else { 
   console.log("Value Accepted..") 
}

// CLASS 
class Greater {
  greeting: string;
  constructor(message: string) {
    this.greeting = message;
  }

  greet() {
    return "Hello " + this.greeting;
  }
}

let greater: Greater;
greater = new Greater("World");

console.log(greater.greet());
// allowed INHERITANCE of classes
class Animal {
    name: string;
    constructor(theName: string) { this.name = theName; }
    move(distanceInMeters: number = 0) {
        console.log(`${this.name} moved ${distanceInMeters}m.`);
    }
}

class Snake extends Animal {
    constructor(name: string) { super(name); }
    move(distanceInMeters = 5) {
        console.log("Slithering...");
        super.move(distanceInMeters);
    }
} 
// visibility by default public, can be protected, private(explicitly defined)
// readonly, member can be readonly meaning that value of member cannot be changed

// CLASS with setters and getters
let passcode = "secret passcode";

class Employee {
    private _fullName: string;

    get fullName(): string {
        return this._fullName;
    }

    set fullName(newName: string) {
        if (passcode && passcode == "secret passcode") {
            this._fullName = newName;
        }
        else {
            console.log("Error: Unauthorized update of employee!");
        }
    }
}

let employee = new Employee();
employee.fullName = "Bob Smith";

// CLASS with interface
class Point {
    x: number;
    y: number;
}

interface Point3d extends Point {
    z: number;
}

let point3d: Point3d = {x: 1, y: 2, z: 3};

// GENERICS
// check in typescrript documentation
// GENERICS

//ENUM
// set of numeric constants
// by default if members is initialized , sequence will be applied on sequential members
enum Directions {
  Up = 2,
  Down = 5,
  Right,
  Left
}

console.log(Directions.Up);
console.log(Directions.Down);
console.log(Directions.Left);
console.log(Directions.Right);

//ENUM

//ARRAYS
//let nums: number[] = [1, 2, 3, 3];

console.log(nums[0]);
console.log(nums[1]);
console.log(nums[2]);
console.log(nums[3]);

let arr_names: number[] = new Array(4);



for (let i = 0; i < arr_names.length; i++) {
  arr_names[i] = i * 2;

  console.log(arr_names[i]);
}
//ARRAYS
//TUPLES collection of different type values

//TUPLES collection of different type values

//////////////
// TYPESCRIPT
//////////////

//////////////
// FRISBY.JS
//////////////
Frisby.js - test framework
//////////////
// FRISBY.JS
//////////////

