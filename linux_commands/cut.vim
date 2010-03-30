" -c character position
" -d delimiter
" -f fields specified by delimiter

" show all the file names
ls -l | cut -c 49-100


" show all the file names without extension
ls -l | cut -c 48-100 | cut -d . -f 1
