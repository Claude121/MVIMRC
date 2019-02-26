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
"    switchrto other tab
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
set hlsearch
set nu
set fileencoding=utf-8
set fileencodings=utf-8,gb18030,gb2312,gbk,big5
set ts=4
set expandtab
set autoindent
set mouse=n

set nocompatible
filetype off
set syntax=on
let mapleader =','

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Some Quickly Action For Vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Internal Function Define
"

"----------------------------------------------------
nmap <leader>w  :w!<CR>
nmap <leader>wq :wq!<CR>
" remove the blank space
nnoremap <F2> :g/^\s*$/d<CR>

"go to lowest tap
nnoremap <C-l> gt
"go to hightest tap
nnoremap <C-h> Gt
"open the new tab
nnoremap <leader>t :tabe 
"shift from a win to another
nnoremap <S-w> <C-w>w<CR>
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

nnoremap <F5> :!ctags -R --languages=c,c++<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Manager 
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" TagList for Ctags
" Plug 'vim-scripts/taglist.vim'

" Tagbar for Ctags (maybe better than taglist)
Plug 'majutsushi/tagbar'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERD TREE Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDChrismasTree=1 "Beautiful
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeWinpos='left'
let NERDTreeWinSize=31
let NERDTreeShowBookmarks=1 "show bookmark when nerdtree open
"Open the NERDTree
nnoremap <F2> :silent! NERDTreeToggle<CR>

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
" TAGBAR
"""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F3> :TagbarToggle<CR>

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
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" YCM-Generator 
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" add config for YOUCOMPLETEME
" :YcmGenerateConfig or :YcmGenerateConfig
nnoremap <F1> :silent! YcmGenerateConfig<CR>

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
nnoremap <silent> <Leader>f :Files<CR>
" Search the Buffers
nnoremap <silent> <Leader>b :Buffers<CR>

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
nmap <leader>g :norm yiw<CR>:Ag! -t -Q "<C-R>""

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Incsearch
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" usb <TAB> to search the next one
" usb <S-TAB> to search the pre one
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
" doesn't move the cursor
map g/ <Plug>(incsearch-stay)

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" It's great for quick refactoring
"
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
