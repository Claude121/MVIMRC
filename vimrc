""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable Func
"""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:YCM_FUNCTION_ENABLE=0

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
    " 默认超时是 1000 ms，如果不想那么长的话，你可以在 vimrc 中设置更短一些
    set timeoutlen=500

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
    set mouse=n

    set nocompatible
    filetype off
    set syntax=on
    let g:mapleader =','
    set ignorecase " 忽略大小写

    let g:which_key_map = {}
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Some Quickly Action For Vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""
fu QuicklyActionMap()
    " ++++++++++++++++++++++++++++++++++++++++++++ "
    let g:which_key_map.q = {
      \ 'name' : "+QuicklyCommand 快速命令" ,
      \ 'w' : [':w!', 'quick write file'],
      \ 'q' : [':q!', 'quick close file'],
      \ }
    " saving the file
    nmap <leader>qw!  :w!<CR>
    " exit the file without saving
    nmap <leader>qq   :q!<CR>

    " remove the blank space
    " nnoremap <F2> :g/^\s*$/d<CR>
    "

    " ++++++++++++++++++++++++++++++++++++++++++++ "
    let g:which_key_map.b = {
      \ 'name' : '+BufferManage 缓存管理' ,
      \ '1' : ['b1'        , 'buffer 1，         切换到标号为1的缓存'   ],
      \ '2' : ['b2'        , 'buffer 2，         切换到标号为2的缓存'   ],
      \ 'd' : ['bd'        , 'delete-buffer，    删除缓存'              ],
      \ 'f' : ['bfirst'    , 'first-buffer，     切换到最前面的缓存'    ],
      \ 'l' : ['blast'     , 'last-buffer，      切换到最后的缓存'      ],
      \ 'n' : ['bnext'     , 'next-buffer，      切换到下一个缓存'      ],
      \ 'p' : ['bprevious' , 'previous-buffer  ，切换到上一个缓存'      ],
      \ '?' : ['Buffers'   , 'fzf-buffer，buffer 管理窗口'              ],
      \ }
    nnoremap <leader>b1 :Buffers 1<CR><CR>
    nnoremap <leader>b2 :Buffers 2<CR><CR>
    nnoremap <leader>bd :bdelete<Space>
    nnoremap <leader>bf :bfirst<CR>
    nnoremap <leader>bl :blast<CR>
    nnoremap <leader>bn :bnext<CR>
    nnoremap <leader>bp :bprevious<CR>
    nnoremap <silent> <Leader>b? :Buffers<CR>

    " ++++++++++++++++++++++++++++++++++++++++++++ "
    let g:which_key_map.t = {
      \ 'name' : "+TabManage 标签页管理",
      \ 'a' : [':tabe', 'add a new tab,      添加一个新的标签'],
      \ 'q' : [':tabc', 'close current tab,  关闭当前的标签页'],
      \ }
    nnoremap <leader>ta :tabe
    nnoremap <leader>tq :tabc<CR>
    "switch from one tab to another"
    nnoremap <S-t> gT

    " ++++++++++++++++++++++++++++++++++++++++++++ "
    let g:which_key_map.w = {
      \ 'name' : "+WindowManage 窗口管理",
      \ 'h' : [':sp<CR>'  ,  'split a new horizontal window, 将当前窗口上下分割复制一个新的窗口'],
      \ 'v' : [':vsp<CR>' ,  'split a new vertical window，  将当前窗口左右分割复制一个新的窗口'],
      \ }
    nnoremap <leader>wh :sp<CR>
    nnoremap <leader>wv :vsp<CR>
    "switch from one window to another"
    nnoremap <S-w> <C-w>w<CR>

    " ++++++++++++++++++++++++++++++++++++++++++++ "
    let g:which_key_map.m = {
      \ 'name' : "+MarkManage 便签管理"           ,
      \ 's' : [':MarkSet'                ,  'MarkSet'                 ],
      \ 'm' : [':MarkRegex'              ,  'MarkRegex'               ],
      \ 'n' : [':MarkClear'              ,  'MarkClear'               ],
      \ '*' : [':MarkSearchCurrentNext'  ,  'MarkSearchCurrentNext'   ],
      \ '#' : [':MarkSearchCurrentPrev'  ,  'MarkSearchCurrentPrev'   ],
      \ '/' : [':MarkSearchAnyNext'      ,  'MarkSearchAnyNext'       ],
      \ '?' : [':MarkSearchAnyPrev'      ,  'MarkSearchAnyPrev'       ],
      \ }
    nmap <unique> <Leader>ms <Plug>MarkSet
    nmap <unique> <Leader>mr <Plug>MarkRegex
    nmap <unique> <Leader>mn <Plug>MarkClear
    nmap <unique> <Leader>m* <Plug>MarkSearchCurrentNext
    nmap <unique> <Leader>m# <Plug>MarkSearchCurrentPrev
    nmap <unique> <Leader>m/ <Plug>MarkSearchAnyNext
    nmap <unique> <Leader>m? <Plug>MarkSearchAnyPrev
    
    " ++++++++++++++++++++++++++++++++++++++++++++ "
    let g:which_key_map.f = {
      \ 'name' : "+FilesManage 文件处理"   ,
      \ 'f' : [':LeaderfFile'     ,  'find a files by fuzzy string'                        ],
      \ 'm' : [':Files'           ,  'find a files in most recently used list'             ],
      \ 'a' : [':CtrlSF<Space>'   ,  'search a file which contain a fuzzy string (AG)'     ],
      \ 'l' : [':LeaderfLine<CR>' ,  'Launch LeaderF to search a line in current buffer'   ],
      \ 'la' : [':LeaderfLine<CR>' ,  'Launch LeaderF to search a line in All buffer'      ],
      \ }
    " fuzzy find
    " nnoremap <silent> <Leader>ff :Files<CR>

    " ag
    let g:ackprg = 'ag --nogroup --nocolor --column'
    "  ctrlsf, base on Ag
    "  p: enter Preview windows
    "  C+J: jump to next preview window
    "  C+K: jump to previous preview window
    nmap <Leader>fa :CtrlSF<Space>

    " shift jump
    map <s-j> <c-j>p
    map <s-k> <c-k>p
    let g:ctrlsf_default_view_mode = 'compact'

    " LeaderF
    "   g:Lf_ShowHidden 设置1则显示隐藏文件. 默认值0.
    "   g:Lf_PreviewInPopup 设置成1, 预览(preview)会在弹出(popup)窗口里显示, 而不会在原来的文件所在的窗口里显示. 默认值是0.
    "   g:Lf_WindowHeight 设置窗口高度
    "   g:Lf_CacheDirectory 设置缓存路径
    "   g:Lf_StlColorscheme 设置状态栏配色方案
    "   g:Lf_PreviewResult 设置哪几个功能自动显示preview
    "   g:Lf_ReverseOrder 设置为1, 结果从下到上显示, 跟fzf/CtrlP一致, 默认是0, 从上倒下显示
    if has('nvim')
        let s:cachedir = expand(stdpath('cache'))
        let s:configdir = expand(stdpath('config'))
    else
        "vim will share same folder with nvim
        if has('win32')
            let s:cachedir = expand('~/AppData/Local/Temp/cache/nvim')
            let s:configdir = expand('~/AppData/Local/nvim')
        else
            let s:cachedir = expand('~/.cache/vim')
            let s:configdir = expand('~/.config/vim')
        endif
    endif
    let g:Lf_PreviewInPopup = 1
    let g:Lf_WindowHeight = 0.30
    let g:Lf_CacheDirectory = s:cachedir
    let g:Lf_StlColorscheme = 'powerline'
    let g:Lf_PreviewResult = {
        \ 'File': 0,
        \ 'Buffer': 0,
        \ 'Mru': 0,
        \ 'Tag': 0,
        \ 'BufTag': 1,
        \ 'Function': 1,
        \ 'Line': 1,
        \ 'Colorscheme': 0,
        \ 'Rg': 0,
        \ 'Gtags': 0
        \}
    let g:Lf_ShortcutF = '<Leader>ff'
    let g:Lf_ShortcutB = '<Leader>fb'
    let g:Lf_WorkingDirectoryMode = 'AF'
    let g:Lf_RootMarkers = ['.git', '.svn', '.hg', '.project', '.root']
    let g:Lf_WildIgnore={'file':['*.vcproj', '*.vcxproj', '*.sw*'],'dir':[]}
    let g:Lf_GtagsAutoGenerate = 0
    let g:Lf_GtagsGutentags = 1

    "   <C-C>, <ESC> : 退出
    "   <C-R> : 在模糊查询和正则表达式模式间切换
    "   <C-F> : 在全路径搜索和名字搜索模式间切换
    "   <Tab> : 切换成normal模式
    "   <C-V>, <S-Insert> : 从剪切板里copy字符串进行查询
    "   <C-U> : 清除已经打出的字符
    "   <C-J>, <C-K> : 在结果列表中移动
    "   <Up>, <Down> : 从历史记录里调出上一次/下一次的输入pattern
    "   <2-LeftMouse> or <CR> : 打开在光标处的文件或者被选择的多个文件
    "   <F5>  : 刷新缓存
    "   <C-P> : 预览选中结果
    "   <C-Up> : 在预览popup窗口里滚动向上
    "   <C-Down> : 在预览popup窗口里滚动向下
    "   And模式：g:Lf_AndDelimiter配置，默认为空格，支持匹配多个关键字
    nnoremap <silent> <Leader>ff  :LeaderfFile<CR>
    nnoremap <silent> <Leader>fl  :LeaderfLine<CR>
    nnoremap <silent> <Leader>fla :LeaderfLineAll<CR>
    nnoremap <silent> <Leader>fm  :LeaderfMru<CR>

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
fu CscopeAndCtagsSetting()
    let g:which_key_map.s = {
      \ 'name' : "+CTagsOrCscopeCommand Tag管理器",
      \ 'a' : [':cs add cscope.out<cr>'                     , 'add the cscope to the project'          ],
      \ 's' : [':cs find s <C-R>=expand("<cword>")<cr><cr>' , 'quic'                                   ],
      \ 'g' : [':cs find g <C-R>=expand("<cword>")<cr><cr>' , 'Find this C symbol'                     ],
      \ 'c' : [':cs find c <C-R>=expand("<cword>")<cr><cr>' , 'Find functions calling this function'   ],
      \ 't' : [':cs find t <C-R>=expand("<cword>")<cr><cr>' , 'Find assignments to'                    ],
      \ 'e' : [':cs find e <C-R>=expand("<cword>")<cr><cr>' , 'Find this egrep pattern'                ],
      \ 'f' : [':cs find f <C-R>=expand("<cfile>")<cr><cr>' , 'Find this file and open it'             ],
      \ 'i' : [':cs find i <C-R>=expand("<cfile>")<cr><cr>' , 'Find files #including this file'        ],
      \ 'd' : [':cs find d <C-R>=expand("<cword>")<cr><cr>' , 'Find functions called by this function' ],
      \ }

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

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gtags
"""""""""""""""""""""""""""""""""""""""""""""""""""""
fu GtagsSetting()
"todo
endfunction


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
    " 确定vim当前打开的文件是否需要自动生成tags标签，若需要则通过某种方式确定tag文件的路径，再基于tag标签文件完成函数跳转、结构体定义跳转等功能
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

    Plug 'dyng/ctrlsf.vim'

    Plug 'liuchengxu/vim-which-key'

    Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

    Plug 'jiangmiao/auto-pairs'

    Plug 'tpope/vim-pathogen'

    Plug 'vim-syntastic/syntastic'

    Plug 'scrooloose/nerdcommenter'

    Plug 'airblade/vim-gitgutter'

    Plug 'guns/xterm-color-table.vim'
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

fu GutentagsSetting()
    "gutentags
    " gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
    let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']

    " 所生成的数据文件的名称 "
    let g:gutentags_ctags_tagfile = '.tags'

    " 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
    let s:vim_tags = expand(g:Lf_CacheDirectory.'\.LfCache\gtags')
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
" Mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""
fu Mapping()
    " Open the NERDTree
    nnoremap <F2> :silent! NERDTreeToggle<CR>

    " TAGBAR
    nmap <F3> :TagbarToggle<CR>

    " Incsearch
    "   usb <TAB> to search the next one
    "   usb <S-TAB> to search the pre one
    map /  <Plug>(incsearch-forward)
    map ?  <Plug>(incsearch-backward)
    " doesn't move the cursor
    map g/ <Plug>(incsearch-stay)

    " YCM
    if g:YCM_FUNCTION_ENABLE==1
    noremap <c-x> <NOP>
    endif

    " vim-easy-align
    " Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap ga <Plug>(EasyAlign)
    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap ga <Plug>(EasyAlign)
endfunction

fu WhichKeyLoad()
    nnoremap <silent> <leader> :WhichKey ','<CR>
    call which_key#register(',', "g:which_key_map")
endfunction

fu SyntasticSetting()
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
endfunction

fu NerdCommenterSetting()
    " Create default mappings
    let g:NERDCreateDefaultMappings = 1

    " Add spaces after comment delimiters by default
    let g:NERDSpaceDelims = 1

    " Use compact syntax for prettified multi-line comments
    let g:NERDCompactSexyComs = 1

    " Align line-wise comment delimiters flush left instead of following code indentation
    let g:NERDDefaultAlign = 'left'

    " Set a language to use its alternate delimiters by default
    let g:NERDAltDelims_java = 1

    " Add your own custom formats or override the defaults
    let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

    " Allow commenting and inverting empty lines (useful when commenting a region)
    let g:NERDCommentEmptyLines = 1

    " Enable trimming of trailing whitespace when uncommenting
    let g:NERDTrimTrailingWhitespace = 1

    " Enable NERDCommenterToggle to check all selected lines is commented or not
    let g:NERDToggleCheckAllLines = 1

    let g:which_key_map.c = {
      \ 'name' : "+NerdCommenter 注释器"   ,
      \ 'a':[":ca", '在可选的注释方式之间切换，比如C/C++ 的块注释/* */和行注释/'],
      \ 'b':[":cb", '注释当前行, 分隔符沿两边对齐'],
      \ 'c':[":cc", '注释当前行'],
      \ 'i':[':ci', '分别切换选定行的注释状态'],
      \ 'l':[":cl", '注释当前行, 分隔符沿左边对齐'],
      \ 'm':[":cm", '多行注释仅用一个注释标签'],
      \ 'n':[":cn", '与cc相同，但会进行强制嵌套'],
      \ 's':[':cs', '以"性感"的方式注释'],
      \ 'y':[':cy', '分别切换选定行的注释状态'],
      \ 'A':[':cA', '在当前行尾添加注释符，并进入Insert模式'],
      \ 'u':[':cu', '取消注释。Normal模式下，几乎所有命令前面都可以指定行数。比如：输入 6,cs。Visual模式下执行命令，会对选中的特定区块进行注释/反注释'],
      \ '$':[':c$', '注释光标到行位的当前行'],
      \ '<Space>':[':c<Space>', '取反操作，取消注释或者进行注释'],
      \ }
endfunction

fu GitGutterSetting()
    let g:which_key_map.h = {
      \ 'name' : "+GitGutter 备注器"   ,
      \ }

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Main
"""""""""""""""""""""""""""""""""""""""""""""""""""""
:call DefaultSetting()
:call QuicklyActionMap()
:call NerdTreeSetting()
:call YcmSetting()
:call VimMultipleSettiing()
:call CscopeAndCtagsSetting()
:call GutentagsSetting()
:call SyntasticSetting()
:call NerdCommenterSetting()
:call GitGutterSetting()
:call Mapping()
:call PluginManagerLoad()
:call WhichKeyLoad()
