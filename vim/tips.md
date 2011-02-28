5ra => replace first five characters with a

2dw => delete two words

ft => find first character 't'
; => repeat the last f command in forward direction
, => repeat the last f command in backward direction
2dt, => delete upto second ,

gi => go to the last place I was inserting something and get into insert mode. Also the cursor woudld be put at the end of the word so that you can start typing

H puts cursor to the top of page. H is for High.
M puts cursor to the middle of page. M is for Middle.
L puts cursor to the bottom of page. L is for Low.

:source ~/.vimrc to reload .vimrc file

ctrl g => show the status of current file and where I am

d'a => delete from current line to mark a

da{ => delete the {} region around your cursor including {}

shift a => go to the end of line and then go into insert mode
shift i => go to the beginning of line ( non blank character) and then go into insert mode

)  vim knows about sentences. Use ) or ( to jump to sentences.

:substitute command changes only the first occurrence unless the g flag is present.

hello1
hello2
world
goodbye1
goodbye2
following command deletes starting from the first line with hello to the first line that contains goodbye.
:/hello/,/goodbye/delete


# search for word with word boundary.
# Example search for 'for'. It should not match california
# Escaping is done like this:  \<  \>
:/\<for\>

# Decrement a number under the cursor. 100 becomes 99
CTRL x

# Increment a number under the cursor. 99 becomes 100
CTRL a


ctrl b => one page backward
ctrl f => one page forward
ctrl u => half screen up
ctrl d => half screen down
ctrl y => one line up

42gg - go to line 42
42G
:42 - go to line 42

to change || to &&, you would place the cursor on the first pipe character, and type 2r&.

25a*- ESC => appends 50 characters (25 pairs of asterisk and hyphen).
50i*ESC => inserts 50 asterisks

z RETURN => make current line top line
z - ( it is z dash) => make current line bottom line
z . => make current line center of the screen

You can combine :read with a call to UNIX, to read the results of a UNIX command into your file. The following command will insert the output of date where the cursor is
:r !date

<a>Hello</a>
vit => visually select elements within html tag
vat => visually select element within html tag and also select the tag

# visually highlight everythin within the delimeter excluding the delimeter
vi'
vi"
vi[
vi{

+ move to the first character of next line
- move to the first character of previous line
n| move to the column n of current line


line1
line2
line3
you delete line1
then you deleted line2
then you deleted line3
Now you want to insert line1
"3p will restore the third deleted line . Note that it only works with delete line. will not work with deleted word or fragment of word. Each deleted line is put into a register. In this case you are instructing vim to insert line from 3rd register.


g shift j => join two lines without any space in between



\ c space => toggle comment

:! => drops me at the command line. Now do some command line operation.
:! ls



In order to indent large number of lines left or right do. 10>> Next hit dot to do that operation again. Hit u to undo last command.

Ctrl w s => split horizontally
Ctrl w v => split vertically
Ctrl w w => cycle through windows

Remove all empty blank lines
:g/^$/d

Show where line ends
:set list
:set nolist

Make the current tab as the first tab
:tabmove 0

Make the current tab as the last tab
:tabmove

gt => move to next tab
gT => move to last tab
#gt => move to the numbered tab



ea => append new text to the end of a word

3J => join three lines with space between them

dt: => delete until :

df: => delete until : but also delete :

capital x delete the character before the cursor

d$ will delete till the end of line
d0 will delete till the beginning of line

de will delete the word forward. hello wor*d => hello wor
dE will delete till the end of WORD( which includes punctuations). But it will not delete the white space after the word
dw will delete the word and the spaces after that

db will delete till the beginnig of word backward. hello wor*d => hello ld
dB will delete till the beginning of WORD backward. hello wor*d => hello ld

3w will take you to third word

comment a block of code by visually selecting a block of code and then \c space.
now find out how to visually select block from line number 10 to 20 or from mark a to mark b


# if a really really really************************************************************************************************************************************************************************************************************************************************************************************************************************************************************** long line has wrapping and if you want to go to end of first visible line then do
g$
gm for middle
g0 for column 0
g^ for first non blank char

:Rcontroller
:Rjavascript
:Rmodel
:Rview users
:Rinvert => to generate the down part of a migration
:Rextract
:Rtree

:AT for the alternate file in a new tab.

:AV => split the screen vertically showing code version and test version

:Rmig takes you to the last migration file. works only inside an open file.

If you are in one of the migration file then you can execute
:Rake db:create

:Rgenerate scaffold User name:string

:Renv opens application.rb in Rails3 and environment.rb in Rails2

:Rgen migration add_email_to_users

:Rfind car => will take to car.rb

Put the cursor on a model or a  controller name and hit gf.


:Gst for git status
:Gblame

Add <%= %> arround certain text. Write text first. Then select the text using v. Then hit s =
http://stackoverflow.com/questions/4275209/how-to-insert-erb-tags-with-vim

=b*
beg*
case*
def*
defs*
if*
ife*
unless*
cla*
mod*
r*
w*
rw*
defs*
eai*
eaid*
eak*
eakd*
map*

