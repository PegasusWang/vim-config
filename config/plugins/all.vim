" Plugin Keyboard-Mappings
" ---

if dein#tap('denite.nvim')
	nnoremap <silent><LocalLeader>r :<C-u>Denite -resume -refresh -no-start-filter<CR>
	nnoremap <silent><LocalLeader>f :<C-u>Denite file/rec<CR>
	nnoremap <silent><LocalLeader>g :<C-u>Denite grep -start-filter<CR>
	nnoremap <silent><LocalLeader>b :<C-u>Denite buffer -default-action=switch<CR>
	nnoremap <silent><LocalLeader>i :<C-u>Denite file/old<CR>
	nnoremap <silent><LocalLeader>d :<C-u>Denite directory_rec directory_mru -default-action=cd<CR>
	nnoremap <silent><LocalLeader>v :<C-u>Denite neoyank -buffer-name=register<CR>
	xnoremap <silent><LocalLeader>v :<C-u>Denite neoyank -buffer-name=register -default-action=replace<CR>
	nnoremap <silent><LocalLeader>l :<C-u>Denite location_list -buffer-name=list -no-start-filter<CR>
	nnoremap <silent><LocalLeader>q :<C-u>Denite quickfix -buffer-name=list -no-start-filter<CR>
	nnoremap <silent><LocalLeader>m :<C-u>Denite mark<CR>
	nnoremap <silent><LocalLeader>n :<C-u>Denite dein<CR>
	nnoremap <silent><LocalLeader>j :<C-u>Denite jump change file/point -no-start-filter<CR>
	nnoremap <silent><LocalLeader>u :<C-u>Denite junkfile:new junkfile -buffer-name=list<CR>
	nnoremap <silent><LocalLeader>o :<C-u>Denite outline -no-start-filter<CR>
	nnoremap <silent><LocalLeader>s :<C-u>Denite session -buffer-name=list<CR>
	nnoremap <silent><LocalLeader>t :<C-u>Denite tag<CR>
	nnoremap <silent><LocalLeader>p :<C-u>Denite jump<CR>
	nnoremap <silent><LocalLeader>h :<C-u>Denite help<CR>
	nnoremap <silent><LocalLeader>w :<C-u>Denite file/rec -buffer-name=memo -path=~/docs/blog<CR>
	nnoremap <silent><LocalLeader>x :<C-u>Denite file_mru<CR>
	nnoremap <silent><LocalLeader>z :<C-u>Denite z -buffer-name=list<CR>
	nnoremap <silent><LocalLeader>; :<C-u>Denite command_history command<CR>
	nnoremap <silent><expr><LocalLeader>/ wordcount().chars > 10000 ?
		\ ":\<C-u>Denite -search line/external\<CR>"
		\ : ":\<C-u>Denite -search line\<CR>"
	nnoremap <silent><expr><LocalLeader>* wordcount().chars > 10000 ?
		\ ":\<C-u>DeniteCursorWord -no-start-filter -search line/external\<CR>"
		\ : ":\<C-u>DeniteCursorWord -no-start-filter -search line\<CR>"

	" Open Denite with word under cursor or selection
	nnoremap <silent> <Leader>gt :DeniteCursorWord tag:include -no-start-filter -immediately<CR>
	nnoremap <silent> <Leader>gf :DeniteCursorWord file/rec -no-start-filter<CR>
	nnoremap <silent> <Leader>gg :DeniteCursorWord grep -no-start-filter<CR>
	vnoremap <silent> <Leader>gg
		\ :<C-u>call <SID>get_selection('/')<CR>
		\ :execute 'Denite -no-start-filter grep:::'.escape(@/, ' :')<CR><CR>

	function! s:get_selection(cmdtype)
		let temp = @s
		normal! gv"sy
		let @/ = substitute(escape(@s, '\' . a:cmdtype), '\n', '\\n', 'g')
		let @s = temp
	endfunction
endif

if dein#tap('vim-clap')
	" nnoremap <silent><LocalLeader>f :<C-u>Clap! files<CR>
	" nnoremap <silent><LocalLeader>b :<C-u>Clap! buffers<CR>
	" nnoremap <silent><LocalLeader>g :<C-u>Clap! grep<CR>
	" nnoremap <silent><LocalLeader>j :<C-u>Clap! jumps<CR>
	" nnoremap <silent><LocalLeader>h :<C-u>Clap! help_tags<CR>
	" nnoremap <silent><LocalLeader>t :<C-u>Clap! tags<CR>
	" nnoremap <silent><LocalLeader>l :<C-u>Clap! loclist<CR>
	" nnoremap <silent><LocalLeader>q :<C-u>Clap! quickfix<CR>
	" nnoremap <silent><LocalLeader>m :<C-u>Clap! files ~/docs/books<CR>
	" nnoremap <silent><LocalLeader>y :<C-u>Clap! yanks<CR>
	" nnoremap <silent><LocalLeader>/ :<C-u>Clap! lines<CR>
	" nnoremap <silent><LocalLeader>* :<C-u>Clap! lines ++query=<cword><CR>
	" nnoremap <silent><LocalLeader>; :<C-u>Clap! command_history<CR>

	" nnoremap <silent><Leader>gl :<C-u>Clap! commits<CR>
	" nnoremap <silent><Leader>gt :<C-u>Clap! tags ++query=<cword><CR>
	" xnoremap <silent><Leader>gt :<C-u>Clap! tags ++query=@visual<CR><CR>
	" nnoremap <silent><Leader>gf :<C-u>Clap! files ++query=<cword><CR>
	" xnoremap <silent><Leader>gf :<C-u>Clap! files ++query=@visual<CR><CR>
	" nnoremap <silent><Leader>gg :<C-u>Clap! grep ++query=<cword><CR>
	" xnoremap <silent><Leader>gg :<C-u>Clap! grep ++query=@visual<CR><CR>

	autocmd user_events FileType clap_input call s:clap_mappings()

	function! s:clap_mappings()
		nnoremap <silent> <buffer> <nowait> <Space> :call clap#handler#tab_action()<CR>
		nnoremap <silent> <buffer> <nowait>' :call clap#handler#tab_action()<CR>
		inoremap <silent> <buffer> <Tab>   <C-R>=clap#navigation#linewise('down')<CR>
		inoremap <silent> <buffer> <S-Tab> <C-R>=clap#navigation#linewise('up')<CR>
		nnoremap <silent> <buffer> <C-j> :<C-u>call clap#navigation#linewise('down')<CR>
		nnoremap <silent> <buffer> <C-k> :<C-u>call clap#navigation#linewise('up')<CR>
		nnoremap <silent> <buffer> <C-n> :<C-u>call clap#navigation#linewise('down')<CR>
		nnoremap <silent> <buffer> <C-p> :<C-u>call clap#navigation#linewise('up')<CR>
		nnoremap <silent> <buffer> <C-f> :<c-u>call clap#navigation#scroll('down')<CR>
		nnoremap <silent> <buffer> <C-b> :<c-u>call clap#navigation#scroll('up')<CR>

		nnoremap <silent> <buffer> sg  :<c-u>call clap#handler#try_open('ctrl-v')<CR>
		nnoremap <silent> <buffer> sv  :<c-u>call clap#handler#try_open('ctrl-x')<CR>
		nnoremap <silent> <buffer> st  :<c-u>call clap#handler#try_open('ctrl-t')<CR>

		nnoremap <silent> <buffer> q     :<c-u>call clap#handler#exit()<CR>
		nnoremap <silent> <buffer> <Esc> :call clap#handler#exit()<CR>
		inoremap <silent> <buffer> <Esc> <C-R>=clap#navigation#linewise('down')<CR><C-R>=clap#navigation#linewise('up')<CR><Esc>
		inoremap <silent> <buffer> jj    <C-R>=clap#navigation#linewise('down')<CR><C-R>=clap#navigation#linewise('up')<CR><Esc>
	endfunction
endif

if dein#tap('vim-lsp')
	" Close preview window with Escape
	autocmd User lsp_float_opened
		\ nmap <buffer> <silent> <Esc> <Plug>(lsp-preview-close)
	autocmd User lsp_float_closed silent! nunmap <buffer> <Esc>
	autocmd user_events FileType markdown.lsp-hover
		\ nmap <silent><buffer>q :pclose<CR>| doautocmd <nomodeline> BufWinEnter
endif

if dein#tap('defx.nvim')
	nnoremap <silent> <LocalLeader>e
		\ :<C-u>Defx -toggle -buffer-name=explorer`tabpagenr()`<CR>
	nnoremap <silent> <LocalLeader>a
		\ :<C-u>Defx
		\   -search=`escape(expand('%:p'), ' :')`
		\   -buffer-name=explorer`tabpagenr()`<CR>
endif

if dein#tap('delimitMate')
	imap <buffer><expr> <C-Tab> delimitMate#JumpAny()
endif

if dein#tap('vista.vim')
	nnoremap <silent> <Leader>b :<C-u>Vista!!<CR>
	nnoremap <silent> <Leader>a :<C-u>Vista show<CR>
endif

if dein#tap('emmet-vim')
	autocmd user_events FileType html,css,javascript,javascriptreact,svelte
		\ EmmetInstall
		\ | imap <buffer> <C-Return> <Plug>(emmet-expand-abbr)
endif

if dein#tap('vim-gitgutter')
	nmap ]g <Plug>(GitGutterNextHunk)
	nmap [g <Plug>(GitGutterPrevHunk)
	nmap gS <Plug>(GitGutterStageHunk)
	xmap gS <Plug>(GitGutterStageHunk)
	nmap <Leader>gr <Plug>(GitGutterUndoHunk)
	nmap gs <Plug>(GitGutterPreviewHunk)
endif

if dein#tap('iron.nvim')
	nmap <silent> <Leader>rr :<C-u>IronRepl<CR><Esc>
	nmap <silent> <Leader>rq <Plug>(iron-exit)
	nmap <silent> <Leader>rl <Plug>(iron-send-line)
	vmap <silent> <Leader>rl <Plug>(iron-visual-send)
	nmap <silent> <Leader>rp <Plug>(iron-repeat-cmd)
	nmap <silent> <Leader>rc <Plug>(iron-clear)
	nmap <silent> <Leader>r<CR>  <Plug>(iron-cr)
	nmap <silent> <Leader>r<Esc> <Plug>(iron-interrupt)
endif

if dein#tap('vim-sandwich')
	nmap <silent> sa <Plug>(operator-sandwich-add)
	xmap <silent> sa <Plug>(operator-sandwich-add)
	omap <silent> sa <Plug>(operator-sandwich-g@)
	nmap <silent> sd <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
	xmap <silent> sd <Plug>(operator-sandwich-delete)
	nmap <silent> sr <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
	xmap <silent> sr <Plug>(operator-sandwich-replace)
	nmap <silent> sdb <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
	nmap <silent> srb <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
	omap ir <Plug>(textobj-sandwich-auto-i)
	xmap ir <Plug>(textobj-sandwich-auto-i)
	omap ab <Plug>(textobj-sandwich-auto-a)
	xmap ab <Plug>(textobj-sandwich-auto-a)
	omap is <Plug>(textobj-sandwich-query-i)
	xmap is <Plug>(textobj-sandwich-query-i)
	omap as <Plug>(textobj-sandwich-query-a)
	xmap as <Plug>(textobj-sandwich-query-a)
endif

if dein#tap('vim-operator-replace')
	xmap p <Plug>(operator-replace)
endif

if dein#tap('vim-niceblock')
	silent! xmap I  <Plug>(niceblock-I)
	silent! xmap gI <Plug>(niceblock-gI)
	silent! xmap A  <Plug>(niceblock-A)
endif

if dein#tap('accelerated-jk')
	nmap <silent> j <Plug>(accelerated_jk_gj)
	nmap <silent> k <Plug>(accelerated_jk_gk)
endif

if dein#tap('vim-edgemotion')
	map gj <Plug>(edgemotion-j)
	map gk <Plug>(edgemotion-k)
	xmap gj <Plug>(edgemotion-j)
	xmap gk <Plug>(edgemotion-k)
endif

if dein#tap('vim-quickhl')
	nmap mt <Plug>(quickhl-manual-this)
	nmap mT <Plug>(quickhl-manual-this-whole-word)
	xmap mt <Plug>(quickhl-manual-this)
	nmap mC <Plug>(quickhl-manual-reset)
endif

if dein#tap('vim-sidemenu')
	nmap <Leader>l <Plug>(sidemenu)
	xmap <Leader>l <Plug>(sidemenu-visual)
endif

if dein#tap('vim-indent-guides')
	nmap <silent><Leader>ti :<C-u>IndentGuidesToggle<CR>
endif

if dein#tap('vim-signature')
	let g:SignatureIncludeMarks = 'abcdefghijkloqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
	let g:SignatureMap = {
		\ 'Leader':            'm',
		\ 'ListBufferMarks':   'm/',
		\ 'ListBufferMarkers': 'm?',
		\ 'PlaceNextMark':     'm,',
		\ 'ToggleMarkAtLine':  'mm',
		\ 'PurgeMarksAtLine':  'm-',
		\ 'DeleteMark':        'dm',
		\ 'PurgeMarks':        'm<Space>',
		\ 'PurgeMarkers':      'm<BS>',
		\ 'GotoNextLineAlpha': "']",
		\ 'GotoPrevLineAlpha': "'[",
		\ 'GotoNextSpotAlpha': '`]',
		\ 'GotoPrevSpotAlpha': '`[',
		\ 'GotoNextLineByPos': "]'",
		\ 'GotoPrevLineByPos': "['",
		\ 'GotoNextSpotByPos': 'mn',
		\ 'GotoPrevSpotByPos': 'mp',
		\ 'GotoNextMarker':    ']-',
		\ 'GotoPrevMarker':    '[-',
		\ 'GotoNextMarkerAny': ']=',
		\ 'GotoPrevMarkerAny': '[=',
		\ }
endif

if dein#tap('auto-git-diff')
	autocmd user_events FileType gitrebase
		\  nmap <buffer><CR>  <Plug>(auto_git_diff_scroll_manual_update)
		\| nmap <buffer><C-n> <Plug>(auto_git_diff_scroll_down_page)
		\| nmap <buffer><C-p> <Plug>(auto_git_diff_scroll_up_page)
		\| nmap <buffer><C-d> <Plug>(auto_git_diff_scroll_down_half)
		\| nmap <buffer><C-u> <Plug>(auto_git_diff_scroll_up_half)
endif

if dein#tap('committia.vim')
	let g:committia_hooks = {}
	function! g:committia_hooks.edit_open(info)
		setlocal winminheight=1 winheight=10
		resize 10
		imap <buffer><C-d> <Plug>(committia-scroll-diff-down-half)
		imap <buffer><C-u> <Plug>(committia-scroll-diff-up-half)
		imap <buffer><C-f> <Plug>(committia-scroll-diff-down-page)
		imap <buffer><C-b> <Plug>(committia-scroll-diff-up-page)
		imap <buffer><C-j> <Plug>(committia-scroll-diff-down)
		imap <buffer><C-k> <Plug>(committia-scroll-diff-up)
	endfunction
endif

if dein#tap('python_match.vim')
	autocmd user_events FileType python
		\ nmap <buffer> {{ [%
		\ | nmap <buffer> }} ]%
endif

if dein#tap('goyo.vim')
	nnoremap <Leader>G :Goyo<CR>
endif

if dein#tap('vim-shot-f')
	nmap f  <Plug>(shot-f-f)
	nmap F  <Plug>(shot-f-F)
	nmap t  <Plug>(shot-f-t)
	nmap T  <Plug>(shot-f-T)
	xmap f  <Plug>(shot-f-f)
	xmap F  <Plug>(shot-f-F)
	xmap t  <Plug>(shot-f-t)
	xmap T  <Plug>(shot-f-T)
	omap f  <Plug>(shot-f-f)
	omap F  <Plug>(shot-f-F)
	omap t  <Plug>(shot-f-t)
	omap T  <Plug>(shot-f-T)
endif

if dein#tap('vimwiki')
	nnoremap <silent> <Leader>W :<C-u>VimwikiIndex<CR>
endif

if dein#tap('vim-choosewin')
	nmap -         <Plug>(choosewin)
	nmap <Leader>- :<C-u>ChooseWinSwapStay<CR>
endif

if dein#tap('vimagit')
	nnoremap <silent> <Leader>mg :Magit<CR>
endif

if dein#tap('gina.vim')
	nnoremap <silent> <leader>ga :Gina add %:p<CR>
	nnoremap <silent> <leader>gd :Gina compare<CR>
	nnoremap <silent> <leader>gc :Gina commit<CR>
	nnoremap <silent> <leader>gb :Gina blame --width=40<CR>
	nnoremap <silent> <leader>gs :Gina status -s<CR>
	nnoremap <silent> <leader>gl :Gina log --graph --all<CR>
	nnoremap <silent> <leader>gF :Gina! fetch<CR>
	nnoremap <silent> <leader>gp :Gina! push<CR>
	nnoremap <silent> <leader>go :,Gina browse :<CR>
	vnoremap <silent> <leader>go :Gina browse :<CR>
endif

if dein#tap('vim-altr')
	nmap <leader>n  <Plug>(altr-forward)
	nmap <leader>N  <Plug>(altr-back)
endif

if dein#tap('any-jump.vim')
	" Normal mode: Jump to definition under cursor
	nnoremap <silent> <leader>ii :AnyJump<CR>

	" Visual mode: jump to selected text in visual mode
	xnoremap <silent> <leader>ii :AnyJumpVisual<CR>

	" Normal mode: open previous opened file (after jump)
	nnoremap <silent> <leader>ib :AnyJumpBack<CR>

	" Normal mode: open last closed search window again
	nnoremap <silent> <leader>il :AnyJumpLastResults<CR>
endif

if dein#tap('undotree')
	nnoremap <Leader>gu :UndotreeToggle<CR>
endif

if dein#tap('thesaurus_query.vim')
	nnoremap <silent> <Leader>K :<C-u>ThesaurusQueryReplaceCurrentWord<CR>
endif

if dein#tap('vim-asterisk')
	map *   <Plug>(asterisk-g*)
	map g*  <Plug>(asterisk-*)
	map #   <Plug>(asterisk-g#)
	map g#  <Plug>(asterisk-#)

	map z*  <Plug>(asterisk-z*)
	map gz* <Plug>(asterisk-gz*)
	map z#  <Plug>(asterisk-z#)
	map gz# <Plug>(asterisk-gz#)
endif

if dein#tap('vim-expand-region')
	xmap v <Plug>(expand_region_expand)
	xmap V <Plug>(expand_region_shrink)
endif

if dein#tap('sideways.vim')
	nnoremap <silent> <, :SidewaysLeft<CR>
	nnoremap <silent> >, :SidewaysRight<CR>
	nnoremap <silent> [, :SidewaysJumpLeft<CR>
	nnoremap <silent> ], :SidewaysJumpRight<CR>
	omap <silent> a, <Plug>SidewaysArgumentTextobjA
	xmap <silent> a, <Plug>SidewaysArgumentTextobjA
	omap <silent> i, <Plug>SidewaysArgumentTextobjI
	xmap <silent> i, <Plug>SidewaysArgumentTextobjI
endif

if dein#tap('splitjoin.vim')
	let g:splitjoin_join_mapping = ''
	let g:splitjoin_split_mapping = ''
	nmap sj :SplitjoinJoin<CR>
	nmap sk :SplitjoinSplit<CR>
endif

if dein#tap('linediff.vim')
	vnoremap <Leader>mdf :Linediff<CR>
	vnoremap <Leader>mda :LinediffAdd<CR>
	nnoremap <Leader>mds :<C-u>LinediffShow<CR>
	nnoremap <Leader>mdr :<C-u>LinediffReset<CR>
endif

if dein#tap('dsf.vim')
	nmap dsf <Plug>DsfDelete
	nmap csf <Plug>DsfChange
endif

if dein#tap('caw.vim')
	function! InitCaw() abort
		if &l:modifiable && &buftype ==# '' && &filetype != 'gitrebase'
			xmap <buffer> <Leader>V <Plug>(caw:wrap:toggle)
			nmap <buffer> <Leader>V <Plug>(caw:wrap:toggle)
			xmap <buffer> <Leader>v <Plug>(caw:hatpos:toggle)
			nmap <buffer> <Leader>v <Plug>(caw:hatpos:toggle)
			nmap <buffer> gc <Plug>(caw:prefix)
			xmap <buffer> gc <Plug>(caw:prefix)
			nmap <buffer> gcc <Plug>(caw:hatpos:toggle)
			xmap <buffer> gcc <Plug>(caw:hatpos:toggle)
		else
			silent! nunmap <buffer> <Leader>V
			silent! xunmap <buffer> <Leader>V
			silent! nunmap <buffer> <Leader>v
			silent! xunmap <buffer> <Leader>v
			silent! nunmap <buffer> gc
			silent! xunmap <buffer> gc
			silent! nunmap <buffer> gcc
			silent! xunmap <buffer> gcc
		endif
	endfunction
	autocmd user_events FileType * call InitCaw()
	call InitCaw()
endif

if dein#tap('fin.vim')
	nnoremap <Leader>f :<C-u>Fin<CR>

	function! InitFin() abort
		cmap <buffer><nowait> <Tab>   <Plug>(fin-line-next)
		cmap <buffer><nowait> <S-Tab> <Plug>(fin-line-prev)
		cmap <buffer><nowait> <C-j>   <Plug>(fin-line-next)
		cmap <buffer><nowait> <C-k>   <Plug>(fin-line-prev)
	endfunction
	autocmd user_events FileType fin call InitFin()
endif

if dein#tap('vim-textobj-function')
	omap <silent> af <Plug>(textobj-function-a)
	omap <silent> if <Plug>(textobj-function-i)
	xmap <silent> af <Plug>(textobj-function-a)
	xmap <silent> if <Plug>(textobj-function-i)
endif

if dein#tap('vim-easymotion')
	nmap ss <Plug>(easymotion-s2)
endif

if dein#tap('vim-airline')
	let g:airline_powerline_fonts=1
	let g:airline_theme = 'materialbox'
	let g:airline#extensions#tabline#enabled = 1
endif

if dein#tap('incsearch-fuzzy.vim')
	map z/ <Plug>(incsearch-fuzzy-/)
	map z? <Plug>(incsearch-fuzzy-?)
	map zg/ <Plug>(incsearch-fuzzy-stay)
endif

if dein#tap('python-mode')
	" 注意如果使用了 rope 一般是项目根目录打开文件，不要切到子目录
	" set noautochdir 注意这个自动切换目录会使rope找目录不正确，禁用，坑死我
	" 如果你发现找不到你的 package 或者系统的，编辑你的代码根目录下 .ropeproject/config.py 里的文件就可以了
	" 比如加上 prefs.add('python_path', '/usr/local/lib/python2.7/site-packages/') 就可以找到系统包了

	" when PYTHON_VERSION env variable is set, use python2. default Use python3
	" ch: 如果设置了 export PYTHON_VERSION=2 环境变量使用 python2 ，否则默认 python3
	if $PYTHON_VERSION == '2'
		let g:pymode_python = 'python'  " Values are `python`, `python3`, `disable`.
	else
		let g:pymode_python = 'python3'  " Values are `python`, `python3`, `disable`.
	endif
	let g:pymode_paths = reverse(split(globpath(getcwd().'/eggs', '*'), '\n'))    " support zc.buildout
	let g:pymode_trim_whitespaces = 1
	let g:pymode_quickfix_maxheight = 3
	let g:pymode_indent = 1
	let g:pymode_folding = 1
	let g:pymode_breakpoint = 1
	let g:pymode_breakpoint_bind = "<C-d>"  " NOTE: use ctrl+d insert ipdb
	let g:pymode_breakpoint_cmd = 'import ipdb; ipdb.set_trace()  # BREAKPOINT TODO REMOVE; from nose.tools import set_trace; set_trace()'

	let g:pymode_run = 1
	let g:pymode_run_bind = "<C-e>"
	let g:pymode_virtualenv = 1
	let g:pymode_virtualenv_path = $VIRTUAL_ENV

	" use coc.nvim, disalbe rope
	let g:pymode_rope = 0
	let g:pymode_rope_autoimport = 0
	let g:pymode_rope_complete_on_dot = 0
	let g:pymode_rope_lookup_project = 0
	let g:pymode_rope_goto_definition_bind = "<C-]>"
	let g:pymode_rope_goto_definition_cmd = 'vnew'
	let g:pymode_rope_regenerate_on_write = 0

	let g:pymode_lint = 1
	let g:pymode_lint_on_write = 1
	let g:pymode_lint_on_fly = 0
	let g:pymode_lint_message = 1
	let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe', 'pylint']
	let g:pymode_lint_ignore = ["C0103, C0111, C0301, C0304, C0325, E0702, E1120, R0201, R0903, R0911, R0912, R0913, R1705, W0105, W0108, W0110, W0201, W0221, W0223, W0235, W0403, W0511, W0622, W0703, W1202"]
	let g:pymode_lint_options_mccabe = { 'complexity': 15 }
	let g:pymode_lint_signs = 1
	" if you want use emoji you shoud set : Iterm2->Profiles->Text->Use Unicode versoin 9 widths
	let g:pymode_lint_todo_symbol = '😡'
	let g:pymode_lint_error_symbol = "\U2717"
	let g:pymode_lint_comment_symbol = "\u2757"
	let g:pymode_lint_visual_symbol = "\u0021"

	" 修改默认的红线为浅色，solorized黑色主题
	highlight ColorColumn ctermbg=233
	let g:pymode_lint_cwindow = 0
	let g:pymode_options_max_line_length = 120
	let g:pymode_options_colorcolumn = 1
	" 指定UltiSnips python的docstring风格, sphinx, google, numpy
	let g:ultisnips_python_style = 'sphinx'
	" use coc doc
	let g:pymode_doc = 0
endif

if dein#tap('vim-go')
	autocmd user_events FileType go
		\   nmap <C-]> <Plug>(go-def)
		\ | nmap <Leader>god  <Plug>(go-describe)
		\ | nmap <Leader>goc  <Plug>(go-callees)
		\ | nmap <Leader>goC  <Plug>(go-callers)
		\ | nmap <Leader>goi  <Plug>(go-info)
		\ | nmap <Leader>gom  <Plug>(go-implements)
		\ | nmap <Leader>gos  <Plug>(go-callstack)
		\ | nmap <Leader>goe  <Plug>(go-referrers)
		\ | nmap <Leader>gor  <Plug>(go-run)
		\ | nmap <Leader>gov  <Plug>(go-vet)
		\ | nmap <Leader>got  <Plug>(go-test)
		\ | nmap <Leader>ga  <Plug>(go-alternate-edit)
		\ | nmap <Leader>gf  <Plug>(go-test-func)
		\ | nmap fd  <Plug>(go-def-vertical)
	  \ | nnoremap <Leader>r :GoRun % <CR>
endif

if dein#tap('fzf.vim')
	nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>
	nnoremap <silent> <Leader>s :Ag <CR>
	nnoremap <silent> <Leader>f :Buffers <CR>
	nnoremap <silent> <c-p> :Files <CR>
endif

if dein#tap('vim-json')
	let g:vim_json_syntax_conceal = 0
endif

if dein#tap('vim-translator')
	" Display translation in a window
	nmap <silent> <Leader>t <Plug>TranslateW
	vmap <silent> <Leader>t <Plug>TranslateWV
endif

" vim: set ts=2 sw=2 tw=80 noet :
