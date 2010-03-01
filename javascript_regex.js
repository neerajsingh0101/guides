if (/regex pattern/.test(subject)) {
  log('Successful match');
} else {
  log('Match attempt failed');
}

// To make a regular ex-pression case-insensitive in JavaScript, set the /i flag when creating it.
// A dot (.) matches any character except a line break.
// JavaScript unlike ruby uses ^ to signifiy both the start of sentence and start of word.
// JavaScript does not have \A equivalent from Ruby.
regex = /^hello/;

// Match only for but not california. word boundary.
regex = /\bfor\b/;

regex = /regex pattern/im;
regex = new RegExp(userinput, "im");
regex = new RegExp(userinput, "im");
//Caret and dollar match at line breaks: /m
//Case insensitive: /i
//global: /g

var result = subject.match(/\d+/);
if (result) {
  result = result[0];
} else {
  log('no match');
}

// find the index of the match
var matchstart = - 1;
var matchlength = - 1;
var match = /\d+/.exec(subject);
if (match) {
  matchstart = match.index;
  matchlength = match[0].length;
}


// exec returns only the first match. So you need to put a loop to collect all matches
var matches = [];
var regex = /#(\d+)/g;
var text = 'hello #1234 world #5678';

// first solution using exec
while ((match = regex.exec(text)) !== null) {
  matches.push(match[1]);
}

// second solution using replace
text.replace(regex, function(_,f){
    matches.push(f);
});

//third solution using match
matches = text.match(regex);

//-----------------------------------------------------------------------------------------------------
// replace
result = subject.replace(/before/g, "after");

// you want to replace all numbers in a string with the number multiplied by two
result = subject.replace(/\d+/g, function(match) { return match * 2; });

//  hello <b> i am foo </b> world 
//  should become
//  hello <b> i am boo </b> world
result = subject.replace(/<b>.*?<\/b>/g, function(match) { return match.replace(/foo/g, "boo"); } );
//-----------------------------------------------------------------------------------------------------
