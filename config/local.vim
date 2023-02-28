" Update file. :update is equlivalent to :write, but it only saves the file if the buffer has been modified
imap <Leader>w <esc>:update<CR>

" switch buffer
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> [n :bnext<CR>

" shortcuts to vimdiff, http://stackoverflow.com/questions/7309707/why-does-git-mergetool-opens-4-windows-in-vimdiff-id-expect-3
if &diff
    map <leader>1 :diffget LOCAL<CR>
    map <leader>2 :diffget BASE<CR>
    map <leader>3 :diffget REMOTE<CR>
endif

" change tab
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
" https://stackoverflow.com/questions/15583346/how-can-i-temporarily-make-the-window-im-working-on-to-be-fullscreen-in-vim
nnoremap tt :tab split<CR>

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" add :FormatJSON command, https://coderwall.com/p/faceag/format-json-in-vim
com! FormatJSON %!python3 -c "import json, sys, collections; print(json.dumps(json.load(sys.stdin, object_pairs_hook=collections.OrderedDict), ensure_ascii=False, indent=2))"
com! FormatJSONPy3 %!python3 -m json.tool
com! FormatJSONPy2 %!python -m json.tool
com! FormatJSONPy2Utf8 %!python -c "import json, sys, collections; print json.dumps(json.load(sys.stdin, object_pairs_hook=collections.OrderedDict), ensure_ascii=False, indent=2)"

map <F4> :%retab! <CR> :w <CR>

" use jj as esc
inoremap jj <Esc>`^
" move to next line (insert mode)
inoremap <C-j> <C-o>o
" move to end (insert mode)
inoremap <C-l> <C-o>A
noremap <leader>e :q<cr>
noremap <leader>E :qa!<cr>
" buffer delete
noremap <leader>q :bd<cr>
" jump last last edit position
noremap g<leader> 2g;a
" omni Completion
inoremap <C-Space> <C-x><C-o>

" disable autochdir
set noautochdir
set signcolumn=no
" fix E363: pattern uses more memory than 'maxmempattern'  see: https://github.com/vim/vim/issues/2049
set mmp=5000

" Disable built-in statusline & tabline
let g:tabline_plugin_enable = 0
let g:statusline_plugin_enable = 0

autocmd InsertLeave * :silent !/usr/local/bin/im-select com.apple.keylayout.ABC
