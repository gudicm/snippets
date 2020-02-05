-//Node package manager
npm i
npm -g install packahge 
npm install package

npm audit fix

npm info <package> version - returns the latest available version on the package.
npm view <package> version - returns the latest available version on the package.
npm list --depth=0 - returns versions of all installed modules without dependencies.
npm list - returns versions of all modules and dependencies



// @angular/cli@1
npm install -g @angular/cli
npm i @angular/cli@1.7.4 --save-dev
npm i @angular/cli@1.7.4 --D
npm uninstall -g
// @angular/cli@1



// angular-cli
// generate new app with angular specifi version 
ng new {app-name} -ng4
// check amgular version in package.json file

// angular cook
ng generate component {new component name}	// new component
//

// db json server
npm install -g json-server
// run json server json-server --watch <relative-path-to-json-file>
// db json server


// generate angular client with <ng-swagger-gen>
npm install ng-swagger-gen --save-dev
node_modules/.bin/ng-swagger-gen -i <path_to_swagger_json> [-o output_dir]
 
// debug angular projects
// description https://scotch.io/tutorials/debugging-angular-cli-applications-in-visual-studio-code
// summary
// 1. install chrome plugin
// 2. define launch configuration in Debug view, same port as app server
// 3. launch app (ng serve)
// 4. launch debug configuration

// unit testing
// tutorial description https://medium.com/@manivel45/angular-7-unit-testing-code-coverage-5c7a238315b6
// ng test (with angular 7 starts separate version of application in debug mode)
// unit tests - <appName>.component.spec.ts
 

// clean angular project 

// TODO list
// unit karma unit
// angular schematics
// material
// observables 