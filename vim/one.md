#### bash command line operation

:! puts user at the command line. Now do some command line operation.

:! ls

#### delete until

dt: => delete until :

dt" => delete until `"`

#### Repeat search in backward

Search for something. Now you want to search backward.

Just do `?` or `N`.

Now you can start hitting `n` to go to next occurrence in backward direction.

#### Moving to the edge of the window

H puts cursor to the top of page. H is for High.

M puts cursor to the middle of page. M is for Middle.

L puts cursor to the bottom of page. L is for Low.

#### 10 lines from the top of the window

10H

#### 20 lines from the bottom of the viewport

20L

#### Go to the **middle** line of the window

M

#### Move 10 lines below from the current line

10j

# Go to 50th column

50| #=> this is 50 and then small l

#### Two ways to get rid of carriage return ^M. You can't type carriage return directly. Type Ctrl v m .

:1,$s/^M//g

:%s/^M//g

# Show all lines containing ruby

:g/ruby

:g/ruby/p

##### Find version of the vim running

:! vim --version

#### where is vim installed

:echo $VIM

#### What vim considers to be your home directory

:echo $HOME
