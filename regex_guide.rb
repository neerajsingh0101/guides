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











