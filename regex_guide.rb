# fine everything within double quotes
s = %Q{  id: "hello" }
puts /"(.*)"/.match(s)[0] # will give you the string with the double quotes
puts /"(.*)"/.match(s)[1] # will give you the string without the double quotes


# extract last_name,first_name,country, title from a string
s = %Q{Clinton,Bill,USA,President}
m = /([A-Za-z]+),([A-Za-z]+),([A-Za-z]+),([A-Za-z]+)/.match(s)
puts m.to_a


# dynamic find_by methods in ActiveRecord
if method_sym.to_s =~ /^find_by_(.*)$/ 

# extract phone numbers out of string
s = %Q{  (123) 555-1234. }
r = /\((\d{3})\)\s+(\d{3})-(\d{4})/
m = r.match(s)
puts m.to_a

# edge case
s = %Q{abc}
r = /((.)(.)(.))/
m = r.match(s)
puts m.to_a
puts m[1] #=> abc
# question is why value of m[1] is abc and not a. well the regular expression engine see a bracket and continues
# to be in that bracket until that bracket ends. In this case the outer most bracket spans the whole string. So
# the first value is assigned to the full string. Then the engine moves on to the inner brackets and accordingly
# m[2] m[3] and m[4] are assigned.



# begin and end method could be used to debug regex when user finds that group capture is not yielding right
# result
#
# MatchData.begin 
# Returns the offset of the start of the nth element of the match array in the string
s = %Q{THX1138.}
r = /(.)(.)(\d+)(\d)/
m = r.match(s)
puts m[0] #=> HX1138

puts m[1] #=> H
puts  m.begin(1)   #=> 1

puts m[2] #=> X
puts  m.begin(2)   #=> 2

puts m[3] #=> 113
puts  m.begin(3) #=> 3


# greedy case
puts /\d+/.match('there is a digit 3 here') #=> 3
puts /\d+/.match('there is a digit 3456 here') #=> 3456
# + means one ore more matches. In the first line single digit 3 was matched. In the second case 3456 was 
# matched. In the second line when regex engine encountered 3 then the condition that there should be one
# or more digit is satisfied was met. Regex engine could have stopped here. But following two regex operators 
# are greedy
# + (one or more)
# * (zero or more)
#
# Because they are greedy, it has consequences.
puts /.+!/.match('abc!def!ghi!') #=> abc!def!ghi!
# In the above case I wanted to extrac just abc but because + is greedy it gobbled up whole string. 
# There is away to tell engine to not to be greedy
puts /.+?!/.match('abc!def!ghi!') #=> abc!
puts /\d+?/.match('there is a digit 3456 here') #=> 3



# number of repetitions
m =  /(\d{3})-(\d{3})-(\d{4})/.match('123-456-7890')
puts m.to_a.inspect #=> ["123-456-7890", "123", "456", "7890"]
#you can also specify
#\d{1,10} between a and 10 digits
#\d{7,} 7 ore more digits


# edge case
m = /([A-Z]){5}/.match('David BLACK')
puts m.to_a.inspect #=> ["BLACK", "K"]

m = /([A-Z]{5})/.match('David BLACK')
puts m.to_a.inspect #=> ["BLACK", "BLACK"]
# In the first case the captured value is K. In the second case captured value is BLACK. So pay close
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
s = '123 456. 789'
m = /\d+(?=\.)/.match(s)
puts m.to_a.inspect
# ruby 1.8 does not support look behind. Ruby 1.9 does.


# case sensitive search by default
s = 'Abc'
puts /abc/.match(s) #=> nil
puts /abc/i.match(s) #=> Abc

# multitline option if the string spans across multiline
# you want to capture everything inside () but the closing ) is on next line
s = %Q{ capture starts here ( ruby on rails \nrocks ) }
m = /\(.*?\)/.match(s)
puts m.to_a.inspect #=> []

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


# \b matched word boundary
# $` returns the part of string before the matc
s = 'rubyrails rocks. rails rocks'
/rails/.match(s)
puts $` #=> ruby
/\brails/.match(s)
puts $` #=> rubyrails rocks.


# ruby supports POISIX character classes. Following two statements are same
s =~ /[\s]/
s =~ /[[:digit:]]/


# \1 \2 \n can be used in sub and gsub to get the nth matched valued
s = 'Mike:Smith'
puts s.sub(/(\w+):(\w+)/,'\2, \1') #=> Smith, Mike

