# dynamic find_by methods in ActiveRecord
if method_sym.to_s =~ /^find_by_(.*)$/ 
  find($1.to_sym => arguments.first) 
else 
  super 
end