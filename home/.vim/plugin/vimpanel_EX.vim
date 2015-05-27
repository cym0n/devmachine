"Version: 0.1
"Author: Cymon
"
"Better interface to vimpanel plugin, emulating project.vim functions

exec 'let g:VimpanelStorage = ' . "'" . expand('$HOME') . '/' . '.vimpanel' . "'"
function StartVIMPEX(prj)
    wincmd l
    only
    silent vertical new
    set columns=20
    wincmd l
    set columns=80
    wincmd h
    execute "VimpanelLoad " . a:prj
    set nobuflisted
    nnoremap <F2> :bprevious<CR>
    nnoremap <F3> :bnext<CR>
    nnoremap <F4> :set nobuflisted<CR>
    nnoremap <buffer> <F2> :wincmd l<CR>
    nnoremap <buffer> <F3> :wincmd l<CR>
    let l:prjfile = g:VimpanelStorage . "/" . a:prj
    let l:destfile = g:VimpanelStorage . "/recent"
    execute "silent !cp " . l:prjfile . " " . l:destfile
endfunction
