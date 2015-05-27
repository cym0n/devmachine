set nocompatible
"source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

" From here my setup
colorscheme cymcolors 
set guifont=Courier\ 12
map <tab> ^i<tab><esc>
map \n :tabnew<cr>
map \q :q!<cr>
map \w :w<cr>
map \e :set wrap!<cr>
map \j :cal StartVIMPEX('recent')<CR>
let do_syntax_sel_menu = 1|runtime! synmenu.vim|aunmenu &Syntax.&Show\ filetypes\ in\ menu
set nobackup
set noswapfile
set tabstop=4
set shiftwidth=4
set expandtab
nnoremap <F2> :bprevious<CR>
nnoremap <F3> :bnext<CR>
set laststatus=2
set statusline=%f\ (%{GitBranch()})\ [%l,%c]

call pathogen#infect()
call guiex#GUI() 


