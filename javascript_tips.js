//Turn arguments into a true array
var args = Array.prototype.slice.call(arguments);
 
// get time in milliseconds
var t1 = new Date().getTime();
var t2 = +new Date;

//detect if firebug is enabled
// it returns the version of firebug
window.console && console.firebug; //=> 1.5.2

// a plugin binds a number of event handlers. Later get rid of all of them in one fell swoop
$('a').bind('click.myplugin',  fn );
$('p').bind('mouserover.myplugin', fn);
// to get of all these bindings
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

