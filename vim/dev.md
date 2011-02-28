#find out version of the vim running
:! vim --version

When executing the map command, Vim will replace "<SID>" with the special
key code <SNR>, followed by a number that's unique for the script, and an
underscore.  Example:
	:map <SID>Add
could define a mapping "<SNR>23_Add".



:map
:map!
The first command displays the maps that work in normal, visual and select and operator pending mode. The second command displays the maps that work in insert and command-line mode.


:nmap - Display normal mode maps
:imap - Display insert mode maps
:vmap - Display visual and select mode maps
:smap - Display select mode maps
:xmap - Display visual mode maps
:cmap - Display command-line mode maps
:omap - Display operator pending mode maps


mapclear  - Clear all normal, visual, select and operating pending mode maps
mapclear! - Clear all insert and command-line mode maps
nmapclear - Clear all normal mode maps
vmapclear - Clear all visual and select mode maps
xmapclear - Clear all visual mode maps
smapclear - Clear all select mode maps
imapclear - Clear all insert mode maps
cmapclear - Clear all command-line mode maps
omapclear - Clear all operating pending mode maps



Shift: <S-...>
Example: Shift s
<S-s>

Ctrl: <C-...>
Example: Ctrl s
<C-s>

Alt and Meta are the same: <A-...> <M-...>
Example: Alt s
<A-s> or <M-s>
Special Characters
Basic
<F1> through <F12>
Enter: <CR> or <Enter> or <Return>
Space bar: <Space>
Esc key: <Esc>


:map x y
:map y z
# in the above case vim will internally map x to z. If you don't want that to happen
# then use noremap.
:noremap x y
:noremap y z


# see a list of currently defined variables
:let

# declare a global variable
:let g:javascript_lint_status = 'enabled'


# where is vim installed
:echo $VIM

# what vim considers to be your home directory
:echo $HOME

# set font to be Arial 12 every time a text file is opened
autocmd BufEnter *.txt set guifont=Arial\ 12

# move to the beginning of paragraph
{

# move to the end of paragraph
}


# list of all defined colors
:highlight

# list of all color groups
:syntax

# Whenever any file is saved call function before saving the file
:autocmd FileWritePre * :call DateInsert()<CR>
# There is also FileReadPre which acts on after reading a file
# BufWritePre - before writing a buffer

