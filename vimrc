"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable Func
"""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:YCM_FUNCTION_ENABLE=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Necessary Install First Using Vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1. ctags
"   sudo apt-get install ctags
" 2. cscope
"   sudo apt-get install cscope
" 3. fzf
"   git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
"   ~/.fzf/install
" 4. ag
"   sudo apt-get install silversearcher-ag
" 5. ycm
"   sudo apt install build-essential cmake python3-dev
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Advanced Vim Usage
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1. buffer
"   1. :ls
"    list all available buffer
"   2. :bn
"    checkout to releated buffer
"   3. :badd file
"    add a file to buffer
"   4. :bdn
"    delete releated buffer
" 2. window
"   1. :sp filename
"    open a Horizontal window
"   2. :vsp filename
"    open a vertical
"   3. ctrl + w + h/j/k/l
"    move to other window (left/down/up/right)
"   4. :nwinc +/-
"    add/del current window n row
"   5. :nwinc >/<
"    add/del current window n column
" 3. tab
"   1. :tabe file
"    edit the releated file tab
"   2. gT/gt
"    switch to other tab
"   3. :tabe
"    list all tabs
"   4. ngT
"    switch to n tab
"   5. tabc
"    close current tab

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" useful shell command
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" change tab to space :
"    expand -t 4 filename > newfile
" change space to tab :
"    unexpand -t 4 filename > newfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Default Setting For Vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""
fu DefaultSetting()
    set hlsearch " 高亮搜索
    set nu       " 显示行号
    set fileencodings=utf-8,gb18030,gb2312,gbk,big5

    " tab 按键拓展为空格
    set expandtab
    set ts=4

    "自动对齐
    "set autoindent     "自动换行
    "set smartindent    "智能对齐
    set cindent        " c/c++/java对齐
    set shiftwidth=4   "对齐宽度

    " 鼠标模式
    set mouse=a

    set nocompatible
    filetype off
    set syntax=on
    let g:mapleader =','
    set ignorecase " 忽略大小写
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Some Quickly Action For Vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""
fu QuicklyActionMap()
    " saving the file
    nmap <leader>w  :w<CR>
    " exit the file with saving
    nmap <leader>wq :wq<CR>
    " exit the file without saving
    nmap <leader>q :q!<CR>
    " remove the blank space
    nnoremap <F2> :g/^\s*$/d<CR>
    "" MAPPING BUFFER
    nnoremap <leader>ba :babd
    nnoremap <leader>bq :bd
    nnoremap <S-b> :b
    "" MAPPING TAB
    nnoremap <leader>ta :tabe
    nnoremap <leader>tq :tabc<CR>
    nnoremap <S-t> gT
    "" MAPPING WINDOW
    nnoremap <leader>wh :sp<CR>
    nnoremap <leader>wv :vsp<CR>
    nnoremap <S-w> <C-w>w<CR>
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Cscope and Ctags setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""
"   ctags :
"   ctags -R   "create a tags file in recursion
"   vim -t tag "open a file with tag and go to it : vim -t main
"   :ts        "show the tag list to be selected
"   Ctrl+]     "go to the tag where pointer is
"   Ctrl+T     "return
"   shift+k    "find the system function

"   cscope ：
"   cscope -kqb                 "create a cscope file
"   cs add /../../cscope.out    "add the cscope to the project
"   cs f :
"   	c: Find functions calling this function
"   	d: Find functions called by this function
"   	e: Find this egrep pattern
"   	f: Find this file and open it
"   	g: Find this definition
"   	i: Find files #including this file
"   	s: Find this C symbol
"   	t: Find assignments to
"   help:  Show this message(Usage: help)
"   kill:  Kill a connection(Usage: kill #)
"   reset: Reinit all connections(Usage: reset)
"   show:  Show connections (Usage: show)
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Manager 
"""""""""""""""""""""""""""""""""""""""""""""""""""""
fu PluginManagerLoad()
    " Specify a directory for plugins
    call plug#begin('~/.vim/plugged')

    " On-demand loading
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

    " Mark script
    Plug 'dimasg/vim-mark'

    " auto gen ctags tags file
    Plug 'ludovicchabant/vim-gutentags'

    " TagList for Ctags
    " Plug 'vim-scripts/taglist.vim'

    " Tagbar for Ctags (maybe better than taglist)
    Plug 'majutsushi/tagbar'

    " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
    Plug 'junegunn/vim-easy-align'

    " Using a non-master branch
    if g:YCM_FUNCTION_ENABLE==1
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer',  'for': ['c', 'cpp'] }
    endif

    " Plugin outside ~/.vim/plugged with post-update hook
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'

    " Ag vim script to search string ,like ack ,but faster
    Plug 'vim-scripts/ag.vim'

    " Incress ? and / vim default command
    Plug 'haya14busa/incsearch.vim'

    " vim-multiple-cursors
    Plug 'terryma/vim-multiple-cursors'

    " Initialize plugin system
    call plug#end()
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERD TREE Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""
fu NerdTreeSetting()
    let NERDChrismasTree=1 "Beautiful
    let NERDTreeShowFiles=1
    let NERDTreeShowHidden=1
    let NERDTreeShowLineNumbers=1
    let NERDTreeWinpos='left'
    let NERDTreeWinSize=31
    let NERDTreeShowBookmarks=1 "show bookmark when nerdtree open
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" TAGLIST
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" o :open new win to show current tag
" u :refresh the tag in current window
" s :change the order of tag (show time or name)
" x :boom or smaller the tag window
" [[:to the before file
" ]]:to the next file
" q :close the current file
" = :same as zM fold all the tag
" zo:open a folding
" zc:close a folding
"
"let Tlist_Ctag_Cmd         ='ctags'
"let Tlist_Show_One_File    =1     "if different ,show multi file tag,or itself
"let Tlist_WinWidt          =28    "window width
"let Tlist_Exit_OnlyWindow  =1     "the last win is Taglist ,exit vim
"let Tlist_Use_Right_Window =1     "show on the right
"let Tlist_Use_Left_Window  =0     "show on the left
"nnoremap <F3> :silent! TlistToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-easy-align
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" align the code
" sample:
"
"     apple = red = a
"     grass += green = b
"     sky -= blue = c
"
" try follow commands:
"    1. vipga= , vipga2= , vipga*=
"      visual-select inner paragraph
"      Start EasyAlign command (ga)
"      Align around
"    2. gaip= , gaip2= , gaip*=
"      Start EasyAlign command (ga) for inner paragraph
"      Align around =
"
" commands:
"   =       : Around the 1st occurrences
"   2=      : Around the 2nd occurrences
"   *=      : Around all occurrences
"   **=     : Left/Right alternating alignment around all occurrences
"   <Enter> : Switching between left/right/center alignment modes
"
"   <Space>  : Around the 1st occurrences of whitespaces
"   2<Space> : Around the 2nd occurrences
"   -<Space> : Around the last occurrences
"   <Enter><Enter>2<Space> :Center-alignment around the 2nd occurrences
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" YCM
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" add config for YOUCOMPLETEME
fu  YcmSetting()
    let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
    let g:ycm_add_preview_to_completeopt = 0
    let g:ycm_show_diagnostics_ui = 0
    let g:ycm_server_log_level = 'info'
    let g:ycm_min_num_identifier_candidate_chars = 2
    let g:ycm_collect_identifiers_from_comments_and_strings = 1
    let g:ycm_complete_in_strings=1
    let g:ycm_key_invoke_completion = '<c-x>'
    set completeopt=menu,menuone

    let g:ycm_semantic_triggers =  {
                \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
                \ 'cs,lua,javascript': ['re!\w{2}'],
                \ }
    let g:ycm_filetype_whitelist = {
                \ "c":1,
                \ "cpp":1,
                \ "objc":1,
                \ "sh":1,
                \ "zsh":1,
                \ "zimbu":1,
                \ }
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf (fuzzy finder)
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" a find file script based on go language
"
" Find the file in this project
" Look for files under current directory
" 	:FZF
" Look for files under your home directory
" 	:FZF ~

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ag Search (Like Ack , But faster)
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Usage
" :Ag [options] {pattern} [{directory}]
" In the quickfix window, you can use:
"	o    to open (same as enter)
"	go   to preview file (open but maintain focus on ag.vim results)
"	t    to open in new tab
"	T    to open in new tab silently
"	h    to open in horizontal split
"	H    to open in horizontal split silently
"	v    to open in vertical split
"	gv   to open in vertical split silently
"	q    to close the quickfix window

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" It's great for quick refactoring
"
fu VimMultipleSettiing()
    let g:multi_cursor_use_default_mapping=0

    " Default mapping
    let g:multi_cursor_start_word_key      = '<C-n>'
    let g:multi_cursor_select_all_word_key = '<A-n>'
    let g:multi_cursor_start_key           = 'g<C-n>'
    let g:multi_cursor_select_all_key      = 'g<A-n>'
    " select the next key like first
    let g:multi_cursor_next_key            = '<C-n>'
    " return the pre one key
    let g:multi_cursor_prev_key            = '<C-p>'
    let g:multi_cursor_skip_key            = '<C-x>'
    let g:multi_cursor_quit_key            = '<Esc>'
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""
fu Mapping()
    " Cscope
    nmap <C-]> g]
    nmap <leader>sa :cs add cscope.out<cr>
    nmap <leader>ss :cs find s <C-R>=expand("<cword>")<cr><cr>
    nmap <leader>sg :cs find g <C-R>=expand("<cword>")<cr><cr>
    nmap <leader>sc :cs find c <C-R>=expand("<cword>")<cr><cr>
    nmap <leader>st :cs find t <C-R>=expand("<cword>")<cr><cr>
    nmap <leader>se :cs find e <C-R>=expand("<cword>")<cr><cr>
    nmap <leader>sf :cs find f <C-R>=expand("<cfile>")<cr><cr>
    nmap <leader>si :cs find i <C-R>=expand("<cfile>")<cr><cr>
    nmap <leader>sd :cs find d <C-R>=expand("<cword>")<cr><cr>

    " Ctags
    nnoremap <F5> :!ctags -R --languages=c,c++ &> /dev/null &<cr>
    " preview current tags
    nnoremap <c-p> <C-W>}

    " Open the NERDTree
    nnoremap <F2> :silent! NERDTreeToggle<CR>

    " TAGBAR
    nmap <F3> :TagbarToggle<CR>

    " Ag
    nmap <leader>g :norm yiw<CR>:Ag! -t -Q "<C-R>""

    " Incsearch
    "   usb <TAB> to search the next one
    "   usb <S-TAB> to search the pre one
    map /  <Plug>(incsearch-forward)
    map ?  <Plug>(incsearch-backward)
    " doesn't move the cursor
    map g/ <Plug>(incsearch-stay)

    " fuzzy find
    nnoremap <silent> <Leader>f :Files<CR>
    " Search the Buffers
    nnoremap <silent> <Leader>b :Buffers<CR>

    " YCM
    if g:YCM_FUNCTION_ENABLE==1
    noremap <c-x> <NOP>
    endif

    " vim-easy-align
    " Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap ga <Plug>(EasyAlign)
    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap ga <Plug>(EasyAlign)

    "gutentags
    " gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
    let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']

    " 所生成的数据文件的名称 "
    let g:gutentags_ctags_tagfile = '.tags'

    " 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
    let s:vim_tags = expand('~/.cache/tags')
    let g:gutentags_cache_dir = s:vim_tags
    " 检测 ~/.cache/tags 不存在就新建 "
    if !isdirectory(s:vim_tags)
       silent! call mkdir(s:vim_tags, 'p')
       endif

       " 配置 ctags 的参数 "
       let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
       let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
       let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Main
"""""""""""""""""""""""""""""""""""""""""""""""""""""
:call DefaultSetting()
:call QuicklyActionMap()
:call PluginManagerLoad()
:call NerdTreeSetting()
:call YcmSetting()
:call VimMultipleSettiing()
:call Mapping()
