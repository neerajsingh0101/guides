" add something to the beginning of line. Beginning of line means the first
" non blank character
shift i

" delete all the lines from current line and upto mark q.
" be at current line and hit
d'q

" add something at the end of line
shift a

" show invisible characters
:set list

" hide invisible characters
:set nolist

" toggle between visible and invisible characters
:set list!

" shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>


" show all the indentation rules mvim is shipped with
: e $VIMRUNTIME/indent 

" custom indentation rules can be addded to indent directory next to vimrc
" file


" Folding in vim  ----------------------------------------------------------------
" fold next 10 lines
zf10j 

" create a fold from current line until next <string> is found in search
zf/ <string> 

" moves the cursor to the next fold
zj

" moves the cursor to the previous fold
zk 

" decrease the foldlevel by one
zr 

" decrease the foldlevel to zero
zR 

" opens a fold at the cursor
zo 

" open all folds at the cursor
zO 



" fix the indentation inside curly braces
=i}

" test changes in .vimrc file. This might not work in all cases so the best
" strategy is to close all windows and start a new window
:source ~/.vimrc

" ctags ---------------------------------------------------------------
" after ctags are installed run following command on command prompt to create
" tags
ctags -R -exclude=*.js

" move the cursor over to a method and hit ctrl ] . Hit ctrl t to go backward



