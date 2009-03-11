# dynamic find_by methods in ActiveRecord
if method_sym.to_s =~ /^find_by_(.*)$/ 
  find($1.to_sym => arguments.first) 
else 
  super 
end


# fine everything within double quotes
#   id: "hello" 
tmp = '  id: "hello" '
puts Regexp.new('"(.*)"').match(tmp)[0] # will give you the string with the double quotes
puts Regexp.new('"(.*)"').match(tmp)[1] # will give you the string without the double quotes

