" VIFM Mappings

noremap ; :
nnoremap q :quit<cr>
nnoremap s :shell<cr>
nnoremap S :sort<cr>
nnoremap w :view<cr>
vnoremap w :view<cr>gv
nnoremap gb :file &<cr>l
nnoremap o :sync<cr>
nnoremap O :invert<cr>
nnoremap xx :move<cr>

" Path
nnoremap yd :!echo %d   | xclip -selection clipboard %i<cr>
nnoremap yf :!echo %c:p | xclip -selection clipboard %i<cr>

" Renaming
nnoremap I cw<c-a>
nnoremap cc cw<c-u>
nnoremap A cw

" Util
vnoremap ,r :rename<cr>
nnoremap ,t :!urxvt &<cr>
nnoremap ,c :write | edit ~/.config/vifm/vifmrc | restart<cr>

" Example of standard two-panel file managers mappings
nnoremap <f3> :!less %f<cr>
nnoremap <f4> :edit<cr>
nnoremap <f5> :copy<cr>
nnoremap <f6> :move<cr>
nnoremap <f7> :mkdir<space>
nnoremap <f8> :delete<cr>

" Evil keys
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
