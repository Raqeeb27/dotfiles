" Set compatibility to vim omly
set nocompatible


" Show line numbers
set number


" Show Statusbar
set laststatus=2


" Automatically wrap text
set wrap


" Encoding
set encoding=utf-8


" Call the .vimrc.plug file
if filereadable(expand("~/.vimrc.plug"))
    source ~/.vimrc.plug
endif
