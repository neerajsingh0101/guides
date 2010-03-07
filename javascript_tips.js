// length of a function also denotes its arity
var fn = function(a,b){};
fn.length;


//callee property contains the function that is currently executing. This is useful if the function has no name.
// http://stackoverflow.com/questions/103598/why-was-the-arguments-callee-caller-property-deprecated-in-javascript
[1,2,3,4,5].map(function(n) {
     return (!(n>1))? 1 : arguments.callee(n-1)*n;
 });

// Remember that argument.callee changes the value of this.
var sillyFunction = function (recursed) {
    if (!recursed){
        log('this is ' + this);
        return arguments.callee(true);
     }
      log('this is ' + this);
};
sillyFunction();

(function(){ var retry = arguments.callee setTimeout(function() {
// Do something
retry() }, 1000)
})()


// Also note that argument.callee has been deprecrated and is not included in ES.


//Turn arguments into a true array
var args = Array.prototype.slice.call(arguments);
 
// get time in milliseconds
var t1 = new Date().getTime();
var t2 = +new Date;

//detect if firebug is enabled
// it returns the version of firebug
window.console && console.firebug; //=> 1.5.2

// use a plugin to bind a number of event handlers. Later get rid of all of them in one fell swoop
$('a').bind('click.myplugin',  fn );
$('p').bind('mouserover.myplugin', fn);
jQuery.fn.clearMyPlugin = function(){
  return this.unbind('.myplugin');
};
// safely trigger just the click and not click.myplugin
$('a').bind('click', fn);
$('a').bind('click.myplugin', fn);
$('a').trigger('click!');


//passing dynamic data to event handlers through parameters
$('a').bind('click', function(e, firstName, lastName, age, extra){});
$('a').trigger('click', ['John', 'Doe', 28, {gender: 'M'}]);

//passing dynamic data to event handlers through event
$('a').bind('click', function(e){
  // do something with e.firstName, e.lastName etc
});
$('a').trigger({
  type: 'click',
  firstName: 'John',
  lastName: 'Doe',
  age: 28,
  gender: 'M'
});


// stop rest of the handlers from executing
e.stopImmediatePropogation();
e.isImmediatePropogationStopped();

// ------- prototype
// only functions have prototype methods. Other JavaScript objects do not have prototype method.
// The default prototype value is {}.
// If you want to distinguish between the object's own property versus the prototype properties then 
// use hasOwnProperty() method.

function Person(){
  this.legs = '2';
}
// In the above case every single time an instance of Person is created a new legs property is created just
// for that object. That can take a lot of memory if you are creating a lot of objects.
// One solution is to move this property to prototype. This is a good strategy for the methods which
// do not change from object to object.
function Person(){}
Person.prototype.legs = '2';
Person.prototype.name = 'person';
Person.prototype.getBMI = function(){ return (this.weight * 703)/(this.height * this.height)};

// Also remember that ineheritance should be done first and then prototype should be augmented with
// additional methods otherwise when inheritnace is done then prototype is overridden.
function Developer(){
  this.skills = [];
}
Developer.prototype == new Person(); // inheritance
Developer.prototype.skillSets = function(){ return skills.join(',')}

// inheritance is largely done for code reuse. The main reason why Developer is inheriting from
// Person is to get access to Person.prototype. The way things are currenly implemented
Developer.prototype == new Person(); // inheritance
// every Developer object first look at Person instance itself for a method called getBMI. Once 
// that method is not found then JavaScript engine will look inside Person.prototype.
// In this case the lookup for getBMI method takes 4 steps.
// 1. look for method in the instance of Developer
// 2. look for method in Developer.prototype
// 3. look for method in instance of Person
// 4. look for method in Person.prototype
//
// Since Developer is largely interested in Person.prototype , it is time to cut down the middle man.
Developer.prototype = Person.prototype;
// now JavaScript engine has to do 2 lookups while looking for getBMI method.
// 1. look for method in instance of Developer
// 2. look for method in Developer.prototype.
// that's it. That's 50% reduction.
//
// However there is a problem.
// Remember that in 
// JavaScript all objects are copied only be reference. So in this case Developer.prototype and Person. prototype
// are pointing to the same object
function Manager(){};
Manager.prototype = Person.prototype;
Manager.name = 'manager';
var p = new Person();
p.name # 'manager'
// Since all the prototypes point to the same object if anyone changes the object then all objects get
// the changed value. This is not good.
//
// In the first iteration I did not have this issue because Developer.prototype was linked to Person.prototype. 
// The reason why I decided not to use was I did not want JavaScript engine to go through all the methods of
// person then go to Person.prototype. It seems ,in this case, solution would be to replace the role of 
// Person by an empty function. Since it is empty JavaScript engine will not spend much time going through
// its methods and will quickly move to empty function's prototype.
// Here is the implementation.
var F = function(){};
F.prototype = Person.prototype;
Developer.prototype = new F();

// If there are too many objects then you can create a helper function for yourself.
function extend(Child, Parent){
  var F = function(){};
  F.prototype = Child.prototype;
  Parent.prototype = new F();
}

// Using this helper function
extend(Developer, Person);
extend(Manager, Developer);


