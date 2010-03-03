" tail multiple files at the same time
tail -f log/development.log log/test.log


" truncate a running log file
cat /dev/null > some_log_file.log

" lists all variables defined in the shell
env

" get history 
history

" last command
!! 

" command number 45
!45

" clear history
history -c 

" see last 10 lines
tail -10 a.out

" see first 10 lines
head -10 a.out 

" change timestamp for all files
touch *

" STDIN  0
" STDOUT 1
" STDERR 2

" send all error messages to a file
root * 2> error.txt

" send output to a file
root * 1> out.txt

" lists all services with port number
cat /etc/services 

" update this file to resolve a hostname to an IP address
/etc/hosts 

# at the end of file add 'Hello World'
echo "Hello World" >> file

" create a file with three lines
cat > foo.txt
line1
line2
line3
^D
