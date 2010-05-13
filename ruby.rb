# chapter 21
# Rake has FileList for file list manipulation
Rake::FileList
src = FileList["*.rb"]

# rake has option for --dry-run [-n]

# irb has option to require a file using -r
irb -rfoo # this will require foo.rb
