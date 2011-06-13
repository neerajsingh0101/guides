# extract phone numbers from given string
s = %Q{  (123) 555-1234. }
r = /\((\d{3})\)\s+(\d{3})-(\d{4})/
match_data = s.match(r)
puts m.to_a
#(123) 555-1234
#123
#555
#1234



# edge case
s = "abc"
r = /((.)(.)(.))/
m = r.match(s)
puts m.to_a.inspect #=> ["abc", "abc", "a", "b", "c"]
puts m[1] #=> abc
# question is why value of m[1] is abc and not a. well the regular expression engine see a bracket and continues
# to be in that bracket until that bracket ends. In this case the outer most bracket spans the whole string. So
# the first value is assigned to the full string. Then the engine moves on to the inner brackets and accordingly
# m[2] m[3] and m[4] are assigned.


# greedy case
puts /\d+/.match('there is a digit 3 here')[0] #=> 3
puts /\d+/.match('there is a digit 3456 here')[0] #=> 3456
# + means one ore more matches. In the first line single digit 3 was matched. In the second case 3456 was
# matched. In the second line when regex engine encountered 3 then the condition that there should be one
# or more digit is satisfied was met. Regex engine could have stopped here. But following two regex operators
# are greedy
# + (one or more)
# * (zero or more)
#
# Because they are greedy, it has consequences.
puts /.+!/.match('abc!def!ghi!') #=> abc!def!ghi!
# In the above case I wanted to extract just abc but because + is greedy it gobbled up whole string.
# ? is a way to tell engine to not to be greedy. ? works at a lot of places including
# ‹*?›, ‹+?›, ‹??›, and ‹{7,42}?
puts /.+?!/.match('abc!def!ghi!') #=> abc!
puts /\d+?/.match('there is a digit 3456 here') #=> 3


# another example of greedy case made not greedy by using ?
s = '<p>hello</p><p>world</p>'
regex = /<p>(.*)<\/p>/
puts regex.match(s).to_a #=> ["<p>hello</p><p>world</p>", "hello</p><p>world"]

# In the above case if you want to pick just hello then make the regex non-greedy.
s = '<p>hello</p><p>world</p>'
regex = /<p>(.*?)<\/p>/
puts regex.match(s).to_a #=> ["<p>hello</p>", "hello"]




# number of repetitions
m =  /(\d{3})-(\d{3})-(\d{4})/.match('123-456-7890')
puts m.to_a.inspect #=> ["123-456-7890", "123", "456", "7890"]
#you can also specify
#\d{1,10} between 1 and 10 digits
#\d{7,} 7 ore more digits


# edge case
m = /([A-Z]){5}/.match('David BLACK')
puts m.to_a.inspect #=> ["BLACK", "K"]


m = /([A-Z]{5})/.match('David BLACK')
puts m.to_a.inspect #=> ["BLACK", "BLACK"]
# In the first case the captured value is K. In the second case captured value is BLACK. Pay close
# attention if braces are inside the capture or outside the capture.



# anchors
# ^ matches beginning of line
puts /^rocks/.match('ruby rocks') #=> nil
puts /^ruby/.match('ruby rocks') #=> ruby

# $ matches end of line
puts /rocks$/.match('ruby rocks') #=> rocks
puts /ruby$/.match('ruby rocks') #=> nil


# look ahead assertion
# look ahead means that you want to look ahead to match something but that look ahead should not be part
# counted as a match.
# take following case. In this case I want consecutive digits only if it is ending with a dot. However the dot
# itself should not be part of the counted. What it means is that if I want I can add more regex expression to
# check for dot since it is not counted. Technically this is called zero-width look ahead. zero width means
# that is not counted.
# (?=pattern) positive look-ahead
# (?!pattern) negative look-ahead
s = '123 456. 789'
m = /\d+(?=\.)/.match(s)
puts m.to_a #=> 456
# ruby 1.8 does not support look behind. Ruby 1.9 does.

# capture all text between foo and bar.
foo((?:(?!baz).)*)bar

# i: case sensitive search by default. /i makes it case insensitive
s = 'Abc'
puts /abc/.match(s) #=> nil
puts /abc/i.match(s) #=> Abc

# m: multitline option if the string spans across multiline
# you want to capture everything inside () but the closing ) is on next line
s = %Q{ capture starts here ( ruby on rails \nrocks ) }
m = /\(.*?\)/m.match(s)
puts m.to_a.inspect #=> ["( ruby on rails \nrocks )"]

# x modifier is used to split complex regex into multiline
# previous example could be written like
s = %Q{ capture starts here ( ruby on rails \nrocks ) }
r = /
\(  # start of (
.*? # capture everything inside
\)  # end of )
/xm
m = r.match(s)
puts m.to_a.inspect #=> ["( ruby on rails \nrocks )"]


/foo  # Match starting at foo
(         # Capture
(?:       # Complex expression:
(?!baz) #   make sure we're not at the beginning of baz
.       #   accept any character
)*        # any number of times
)         # End capture
bar  # and ending at bar
/x

# \b matched word boundary
# $` returns the part of string before the match
s = 'rubyrails rocks. rails rocks'
/rails/.match(s); puts $` #=> ruby
/\brails/.match(s); puts $` #=> rubyrails rocks.


# ruby supports POISIX character classes. Following two statements are same
s =~ /[\s]/
s =~ /[[:digit:]]/


# \1 \2 \n can be used in sub and gsub to get the nth matched valued
s = 'Mike:Smith'
puts s.sub(/(\w+):(\w+)/,'\2, \1') #=> Smith, Mike

# detect html tag
/(<(\w+)\s*>)/
<div>Hello World</div>
<div >Hello World</div>

#capture string within html tag
/<\w+\s*>(.*)<\/\w+\s*>/
<div>Hello World</div>
<div >Hello World</div>


# usage of look ahead in actionpack. simple_format method uses following regex to
# replace all double line breaks into <p>. It converts single line breaks into
# <br /> however it preserves line break for them. And the very first line break is not
# converted into <br />
text = "\nhello \n\n world \n "
puts text.gsub(/([^\n]\n)(?=[^\n])/, '\1<br />')
text.gsub!(/\n\n+/, "</p>\n\n#{start_tag}")

# begin and end method could be used to debug regex when user finds that group capture is not yielding right
# result
#
# MatchData.begin
# Returns the offset of the start of the nth element of the match array in the string
s = %Q{THX1138.}
r = /(.)(.)(\d+)(\d)/
m = r.match(s)
puts m.to_a.inspect #=> ["HX1138", "H", "X", "113", "8"]
puts m[0] #=> HX1138

puts m[1] #=> H
puts  m.begin(1)   #=> 1

puts m[2] #=> X
puts  m.begin(2)   #=> 2

puts m[3] #=> 113
puts  m.begin(3) #=> 3

# Match hello only if it appears at the beginning of subject
regex = /\Ahello/

# Match hello only if it appears at the beginning of line
regex = /^hello/

# Match only for but not california. word boundary.
regex = /\bfor\b/

# ^ $ \A \z are called anchors. They do not match any characters. They match the position.

# Her name is Janet. Regex is /Jane|Janet/ . In this case Jane will be a match note Janet. That is because
# regex engine tries the first word and it matches.


# sentence: my friends are mary, jane and sue .
# I want to find if the sentence has mary or jane or sue.
regex = /\bmary\b|\bjane\b|\bsue\b/
# Above regex will work however it can be written better.
regex = /\b(mary|jane|sue)\b/
# Above refex will work however regex engine has to do extra work to capture groups. Better solution will be
# to use non capturing block
regex = /\b(?:mary|jane|sue)\b/

# Matching previously matched text again
# test if given date is magic date or not. 2008-08-08 is magic date.
regex = /\d\d(\d\d)-\1-\1/

# {10} matches 10 times
# {3,10} matches 3 to 10 times
# {3,} matches 3 or more times

# the complexity of following regex is 2^n (very high)
regex = /(x+x+)+y/
s = 'xxxxx'
# as you increase the number of x the regex engine will have to compute more combinations
# regex engine will take a lot more memory. same regex an also be written as given below
# and it will have a lot less complexity
regex = /(xx+)+y/
s = 'xxxxx'


myregexp = /regex pattern/mix;
myregexp = Regexp.new(userinput, Regexp::EXTENDED or Regexp::IGNORECASE or Regexp::MULTILINE);
#Dot matches line breaks: /m or Regexp::MULTILINE.
#Case insensitive: /i or Regexp::IGNORECASE

# Find the starting position of the match and length of match
#You can use the =~ operator and its magic $~ variable:
if subject =~ /regex pattern/
  matchstart = $~.begin()
  matchlength = $~.end() - matchstart
end
#Alternatively, you can call the match method on a Regexp object:
matchobj = /regex pattern/.match(subject)
if matchobj
  matchstart = matchobj.begin()
  matchlength = matchobj.end() - matchstart
end


#  Iterate over all the matches
subject.scan(/\d+/) {|match|
  # Here you can process the match stored in the match variable
}

# replace
result = subject.gsub(/before/, 'after')

#  hello <b> i am foo </b> world
#  should become
#  hello <b> i am boo </b> world
regex = /foo/
result = subject.gsub(/<b>.*?<\/b>/) {|match| match.gsub(regex, 'boo') }


# use backreference when you need to match something in regex which is previously matched
# "magical" dates are date like 2008-08-08 or 2009-09-09. Will use regex to find if a date
# is magical or not
s = "2008-08-08"
r = /\d\d(\d\d)-\1-\1/
s.match(r) #=> true


ruby 1.8.7 supports atomic grouping
http://www.regular-expressions.info/atomic.html


be careful with regexp.escape if you are using Regexp.escape('git://github.com/(.*)') .It won't work because . is escape too.


non capturing group
extension.scm_location.match(/(?:git|https):\/\/github.com\/(.*)\/(.*)\.git/)

