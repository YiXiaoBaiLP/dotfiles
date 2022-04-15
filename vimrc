" __  ____   __  __     _____ __  __ ____   ____
"|  \/  \ \ / /  \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /    \ \ / / | || |\/| | |_) | |
"| |  | | | |      \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|       \_/  |___|_|  |_|_| \_\\____|

" Author: @LiuPeng
"
"


" 判断操作系统类型
if(has('win32') || has('win64'))
    let g:isWIN = 1
    let g:isMAC = 0
	let g:isLinux = 0
elseif(system('uname') == 'Linux')
        let g:isLinux = 1
		let g:isWIN = 0
		let g:isMAC = 0
else
        let g:isWIN = 0
        let g:isMAC = 1
        let g:isLinux = 0
endif

" 判断是否处于 GUI 界面
if has('gui_running')
    let g:isGUI = 1
else
    let g:isGUI = 0
endif

" 自动加载vim-plug插件，如果没有安装的情况下
if has(g:isLinux == 1)
	if empty(glob('~/.config/nvim/autoload/plug.vim'))
		silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif
elseif has(g:isWIN == 1)
	if empty(glob('C:\\Users\\admin\\AppData\\Local\\nvim\\autoload'))
		silent !curl -fLo 'C:\\Users\\admin\\AppData\\Local\\nvim\\autoload\\plug.vim' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif
endif


" #######################################   基本设置    ######################################

set nocompatible                                                    " 不启用vi的键盘模式,关闭兼容模式(必须设置在开头)
set history=2000                                                    " 设置历史操作记录为2000条
syntax enable                                                       " 语法高亮支持
filetype on                                                         " 关闭文件类型自动检测功能,这个功能被filetype plugin indent on代替
filetype plugin indent on                                           " 载入文件类型插件,代替filetype off 

" 设置文件编码和文件格式
set fileencodings=utf-8,gb2312,gbk,gb18030,big5,ucs-bom,cp936,latin-1
set fenc=utf-8
set encoding=utf-8
set termencoding=utf-8
set fileformat=unix
set fileformats=unix,mac,dos

set guifont=JetBrains\ Mono:h11:cANSI                               " 设置字体
set backspace=2                                                     " 设置退格键可用
set autoindent                                                      " 自动对齐
set ai!                                                             " 设置自动缩进
set smartindent                                                     " 智能自动缩进
set relativenumber                                                  " 开启相对行号
set number                                                          " 显示行号
"set ruler                                                           " 右下角显示光标位置的状态行
set incsearch                                                       " 开启实时搜索功能
set hlsearch                                                        " 开启高亮显示结果
set nowrapscan                                                      " 搜索到文件两端时不重新搜索
set hidden                                                          " 允许在有未保存的修改时切换缓冲区
set autochdir                                                       " 设定文件浏览器目录为当前目录
set foldmethod=indent                                               " 选择代码折叠类型
set foldlevel=100                                                   " 禁止自动折叠
set laststatus=2                                                    " 开启状态栏信息
set cmdheight=2                                                     " 命令行的高度，默认为1，这里设为2
set autoread                                                        " 当文件在外部被修改时自动更新该文件
set virtualedit=block                                               " 允许可视列块模式的虚拟编辑
set nrformats=                                                      " 关闭八进制
set list                                                            " 显示特殊字符，其中Tab使用高亮~代替，尾部空白使用高亮点号代替
set listchars=tab:\|\ ,trail:▫
set expandtab                                                       " 将Tab自动转化成空格[需要输入真正的Tab符时，使用 Ctrl+V + Tab]
set showmatch                                                       " 显示括号配对情况

" ------ Vim美化 ------
" 支持真色彩；终端下
set termguicolors
" --------------------------------
" 根据时间动态的切换主题背景颜色
" 白天激活浅色版本（此处定义为7 AM-7PM），晚上激活暗色版本。
" --------------------------------
"if strftime('%H') >= 7 && strftime('%H') < 19
"  set background=light                                         " 设置vim背景为浅色
"  let g:airline_theme= 'gruvbox'                      " 航空公司的配置
"else
"  set background=dark                                          " 设置vim背景为深色
"  let g:airline_theme= 'gruvbox'                      " 航空公司的配置
"endif

" gruvbox 启用透明背景
let g:gruvbox_transparent_bg= 1
let g:gruvbox_contrast_dark= 'hard'
set background=dark                                          " 设置vim背景为深色
packadd! gruvbox                                                " 
colorscheme gruvbox                                             " 设置gruvbox主题

" -------- 窗口及布局配置 ---------
au GUIEnter * simalt ~x                                             " 启动时自动最大化窗口
"winpos 0 0                                                         " 指定窗口出现的位置，坐标原点在屏幕左上角
"set lines=100 columns=110                                          " 指定窗口大小，lines 为高度，columns 为宽度
set guioptions+=c                                                   " 使用字符提示框
set guioptions-=m                                                   " 隐藏菜单栏
set guioptions-=T                                                   " 隐藏工具栏
set guioptions-=L                                                   " 隐藏左侧滚动条
set guioptions-=r                                                   " 隐藏右侧滚动条
set guioptions-=b                                                   " 隐藏底部滚动条
set showtabline=0                                                   " 隐藏Tab栏
set cursorline                                                      " 高亮突出当前行
"set cursorcolumn                                                   " 高亮突出当前列
set shiftwidth=4                                                    " 设置通用缩进策略 [四空格缩进]
set tabstop=4                                                       " 设置通用缩进策略 [四空格缩进]
set softtabstop=4                                                   "
set scrolloff=4                                                     "
set noexpandtab                                                     "
set ttimeoutlen=0                                                   "
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
"set foldenable=syntax                                              " 让Vim基于语法进行折叠
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set showcmd
set wildmenu
set ignorecase
set smartcase
set shortmess+=c
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell
set clipboard+=unnamedplus
autocmd FilterWritePre * if &diff | setlocal wrap< | endif      " 使用 vimdiff 时，长行自动换行

" 打开文件时自动到文件最后的行
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" 配置输入法 当退出编辑模式时，切换为英文输入法，进入插入模式切换为中文输入法
if has("gui_running")
  set imactivatekey=S-C
  inoremap <ESC> <ESC>:set iminsert=2<CR>
  inoremap <C-[> <C-[>:set iminsert=2<CR>
endif

" --------- 备份文件相关 --------- 
set nobackup                                                        " 不生成备份文件
set noswapfile                                                      " 不生成交换文件
" 创建备份文件存放目录
"silent !mkdir "D:\Program Files (x86)\Vim\vimfiles\tmp\backup"
" 创建交换文件存放目录
"silent !mkdir "D:\Program Files (x86)\Vim\vimfiles\tmp\undo\"							
"silent !mkdir -p ~/.config/nvim/tmp/sessions
" 指定配置文件路径
"set backupdir=D:\Program Files (x86)\Vim\vimfiles\tmp\backup,.
" 指定交换文件路径 
"set directory="D:\Program Files (x86)\Vim\vimfiles\tmp\undo\",.

"if has('persistent_undo')
"	set undofile
"	set undodir=~/.config/nvim/tmp/undo,.							" 指定撤销文件的路径
"endif
" 配置Python虚拟环境
let g:python3_host_prog='C:/Python38/python.exe'
let g:python_host_prog='C:/Python26/python.exe'


" 根据后缀名指定文件类型
au BufRead,BufNewFile *.h        set ft=c
au BufRead,BufNewFile *.i        set ft=c
au BufRead,BufNewFile *.m        set ft=objc
au BufRead,BufNewFile *.di       set ft=d
au BufRead,BufNewFile *.ss       set ft=scheme
au BufRead,BufNewFile *.cl       set ft=lisp
au BufRead,BufNewFile *.phpt     set ft=php
au BufRead,BufNewFile *.inc      set ft=php
au BufRead,BufNewFile *.cson     set ft=coffee
au BufRead,BufNewFile *.sql      set ft=mysql
au BufRead,BufNewFile *.tpl      set ft=smarty
au BufRead,BufNewFile *.txt      set ft=txt
au BufRead,BufNewFile *.log      set ft=conf
au BufRead,BufNewFile hosts      set ft=conf
au BufRead,BufNewFile *.conf     set ft=dosini
au BufRead,BufNewFile http*.conf set ft=apache
au BufRead,BufNewFile *.ini      set ft=dosini

au BufRead,BufNewFile */nginx/*.conf        set ft=nginx
au BufRead,BufNewFile */nginx/**/*.conf     set ft=nginx
au BufRead,BufNewFile */openresty/*.conf    set ft=nginx
au BufRead,BufNewFile */openresty/**/*.conf set ft=nginx

au BufRead,BufNewFile *.yml.bak      set ft=yaml
au BufRead,BufNewFile *.yml.default  set ft=yaml
au BufRead,BufNewFile *.yml.example  set ft=yaml

au BufRead,BufNewFile CMakeLists.txt set ft=cmake

"##################################  按键设置   ##################################
" 重新映射 <LEADER> 按键
let mapleader = ","
let maplocalleader = "\\"

" 将 r 与 R 替换成 虚拟替换模式
noremap R gR

" 退出insert模式
inoremap jk <ESC>

" Copy to system clipboard
noremap y "+y
noremap p "+p

" Copy to system clipboard
vnoremap y "+y
vnoremap p "+p

" 全选 + 复制
noremap <C-A> ggVGy

" 全选 + 复制
noremap! <C-A> <Esc>ggVGy

" 复制一整行
noremap Y yy

" make Y to copy till the end of the line 
" 使用Y复制一整行
"nnoremap Y y$

" 搜索时使光标始终在中间一行。
noremap n nzz
noremap N Nzz

" 删除一整行
noremap <LEADER>d dd
inoremap <LEADER>d <ESC>ddi

" 将当前光标下的单词大写
inoremap <LEADER>U <ESC>viwUA
noremap <LEADER>U viwUe
noremap <LEADER>u viwue

" 添加引号
nnoremap <LEADER>" viw<esc>a"<esc>hbi"<esc>lel

" 添加单引号
nnoremap <LEADER>' viw<esc>a'<esc>hbi'<esc>lel

" 添加括号
nnoremap <LEADER>( viw<esc>a)<esc>hbi(<esc>lel
nnoremap <LEADER>[ viw<esc>a]<esc>hbi[<esc>lel
nnoremap <LEADER>{ viw<esc>a}<esc>hbi{<esc>lel

" Disable the default s key
" 关闭s键的默认功能
"noremap s <nop>

" Save & quit
noremap Q :q<CR>
noremap S :w<CR>

" noremap <C-q> :qa<CR>
noremap <A-R> :source $VIM\vimrc<CR>

" Open the vimrc file anytime
noremap <LEADER>rc :vsplit $VIM\vimrc<CR>

" 使用%% 快捷键，直接显示全路径
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'

" 折叠行
noremap <LEADER>- :lN<CR>
noremap <LEADER>= :lne<CR>

" 关闭高亮显示
noremap <LEADER><CR> :nohlsearch<CR>

" Adjacent duplicate words
noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1

" 替换全局 TAB
nnoremap <LEADER>tt :%s/    /\t/g<CR>
vnoremap <LEADER>tt :s/    /\t/g<CR>

" ,dm                 一键去除全部 ^M 字符
imap <LEADER>dm <esc>:%s/<c-v><c-m>//g<cr>
nmap <LEADER>dm :%s/<c-v><c-m>//g<cr>
vmap <LEADER>dm <esc>:%s/<c-v><c-m>//g<cr>

" 折叠
noremap <silent> <LEADER>o za

" 打开 lazygit
"noremap <LEADER>g :Git 
"noremap <c-g> :tabe<CR>:-tabmove<CR>:term lazygit<CR>

" 格式化
"nnoremap <LEADER>f :Autoformat<CR>

" ----------------------  分屏 ------------------
"  向左分屏，光标移动到新的窗口上
map su :set splitright<CR>:vsplit<CR>
"  向左分屏，光标不动
map si :set nosplitright<CR>:vsplit<CR>
"  向下分屏，光标不动
map sn :set nosplitbelow<CR>:split<CR>
"  向下分屏，光标移动到新的窗口上
map sm :set splitbelow<CR>:split<CR>

" \ /k/l/h <LEADER> = \ 分屏窗口移动 Normal mode
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-l> <C-W>l
noremap <C-h> <C-W>h

" 调整分屏大小
map <A-j> :res +5<CR>
map <A-k> :res -5<CR>
map <A-h> :vertical resize+5<CR>
map <A-l> :vertical resize-5<CR>

" 创建 tabe
map tu :tabe<CR>
map tn :-tabnext<CR>
map tl :+tabnext<CR>

" Ctrl + ]            多选择跳转
nmap <c-]> g<c-]>
vmap <c-]> g<c-]>

" Ctrl + T            跳回原位置
nmap <c-t> :pop<cr>
" ---------------------- 插件快捷键 ----------------------  
"" \nt                 打开文件树窗口，在左侧栏显示 [NERDTree 插件]
"nmap <leader>nt :NERDTree<cr>
"
"" \ut                 打开/关闭文档编辑历史窗口，在左侧栏显示 [Undotree 插件]
"nmap <leader>ut :UndotreeToggle<cr>
"
"" \il                 显示/关闭对齐线 [indentLine 插件]
"nmap <leader>il :IndentLinesToggle<cr>
"
"" \tl                 打开/关闭 Tags 窗口，在右侧栏显示 [Tagbar 插件]
"nmap <leader>tl :TagbarToggle<cr><c-w><c-l>
"
"" \fe                 打开文件编码窗口，在右侧栏显示 [FencView 插件]
"nmap <leader>fe :FencView<cr>
"
"" \mp                 生成 Promptline 脚本文件，用于个性化终端操作 [Promptline 插件]
"nmap <leader>mp :!rm ~/backup/.promptline<cr><esc>:PromptlineSnapshot ~/backup/.promptline airline<cr>
"
"" \gi                 开启或关闭 GitGutter [GitGutter 插件]
"nmap <leader>gi :GitGutterToggle<cr>:GitGutterSignsToggle<cr>:GitGutterLineHighlightsToggle<cr>
"
"" \gd                 打开 Git 文件对比模式 [GitGutter 插件]
"nmap <leader>gd :Gdiff<cr>
"
"" \gl                 调用 Tig 查看提交日志 [tig-explorer 插件]
"nmap <leader>gl :TigOpenCurrentFile<cr>
"
"" \ss                 搜索当前光标下的单词 [ack 插件]
"nmap <leader>ss :Ack! '\b<c-r><c-w>\b'<cr>
"
"" \ff                 搜索当前文件中的类、方法、函数名 [ctrlp-funky 插件]
"nmap <leader>ff :CtrlPFunky<cr>
"
"" \fc                 格式化当前文件的代码 [prettier 插件]
"nmap <LEADER>fc :PrettierAsync<cr>

" ,rb                 一键去除全部尾部空白
imap <LEADER>rb <esc>:let _s=@/<bar>:%s/\s\+$//e<bar>:let @/=_s<bar>:nohl<cr>
nmap <LEADER>rb :let _s=@/<bar>:%s/\s\+$//e<bar>:let @/=_s<bar>:nohl<cr>
vmap <LEADER>rb <esc>:let _s=@/<bar>:%s/\s\+$//e<bar>:let @/=_s<bar>:nohl<cr>

" ,rt                 一键替换全部 Tab 为空格
nmap <LEADER>rt <esc>:retab<cr>

" ,ra                 一键清理当前代码文件
nmap <LEADER>ra <esc>\rt<esc>\rb<esc>gg=G<esc>gg<esc>

" ,th                 一键生成与当前编辑文件同名的 HTML 文件 [不输出行号]
imap <LEADER>th <esc>:set nonumber<cr>:set norelativenumber<cr><esc>:TOhtml<cr><esc>:w %:r.html<cr><esc>:q<cr>:set number<cr>:set relativenumber<cr>
nmap <LEADER>th <esc>:set nonumber<cr>:set norelativenumber<cr><esc>:TOhtml<cr><esc>:w %:r.html<cr><esc>:q<cr>:set number<cr>:set relativenumber<cr>
vmap <LEADER>th <esc>:set nonumber<cr>:set norelativenumber<cr><esc>:TOhtml<cr><esc>:w %:r.html<cr><esc>:q<cr>:set number<cr>:set relativenumber<cr>

" ,wa                 一键编译所有 Vimwiki 源文件
"imap <LEADER>wa <esc>\ww<esc>:VimwikiAll2HTML<cr>:qa<cr>
"nmap <LEADER>wa <esc>\ww<esc>:VimwikiAll2HTML<cr>:qa<cr>
"vmap <LEADER>wa <esc>\ww<esc>:VimwikiAll2HTML<cr>:qa<cr>

"" ,ml                 保留本分支的改动 [git mergetool -t vimdiff 时可用]
"nmap <LEADER>ml :diffget LOCAL<cr>
"
"" ,mr                 保留它分支的改动 [git mergetool -t vimdiff 时可用]
"nmap <LEADER>mr :diffget REMOTE<cr>
"
"" ,mb                 保留基分支的改动 [git mergetool -t vimdiff 时可用]
"nmap <LEADER>mb :diffget BASE<cr>
"
"" ,mu                 刷新比较结果     [git mergetool -t vimdiff 时可用]
"nmap <LEADER>mu :diffupdate<cr>

" ---------------------- 语法切换 ----------------------  
" ,got                一键切换到 gohtmltmpl 语法高亮
imap <LEADER>got <esc>:se ft=gohtmltmpl<cr>li
nmap <LEADER>got <esc>:se ft=gohtmltmpl<cr>

" ,php                一键切换到 PHP 语法高亮
imap <LEADER>php <esc>:se ft=php<cr>li
nmap <LEADER>php <esc>:se ft=php<cr>

" ,ruby               一键切换到 Ruby 语法高亮
imap <LEADER>ruby <esc>:se ft=ruby<cr>li
nmap <LEADER>ruby <esc>:se ft=ruby<cr>

" ,eruby              一键切换到 eRuby 语法高亮
imap <LEADER>eruby <esc>:se ft=eruby<cr>li
nmap <LEADER>eruby <esc>:se ft=eruby<cr>

" ,cf                 一键切换到 Coffee 语法高亮
imap <LEADER>cf <esc>:se ft=coffee<cr>li
nmap <LEADER>cf <esc>:se ft=coffee<cr>

" ,ts                 一键切换到 TypeScript 语法高亮
imap <LEADER>ts <esc>:se ft=typescript<cr>li
nmap <LEADER>ts <esc>:se ft=typescript<cr>

" ,js                 一键切换到 JavaScript 语法高亮
imap <LEADER>js <esc>:se ft=javascript<cr>li
nmap <LEADER>js <esc>:se ft=javascript<cr>

" ,java                一键切换到 Java 语法高亮
imap <LEADER>java <esc>:se ft=java<cr>li
nmap <LEADER>java <esc>:se ft=java<cr>

" ,css                一键切换到 CSS 语法高亮
imap <LEADER>css <esc>:se ft=css<cr>li
nmap <LEADER>css <esc>:se ft=css<cr>

" ,html               一键切换到 HTML 语法高亮
imap <LEADER>html <esc>:se ft=html<cr>li
nmap <LEADER>html <esc>:se ft=html<cr>

" ,sql               一键切换到 SQL 语法高亮
imap <LEADER>sql <esc>:se ft=sql<cr>li
nmap <LEADER>sql <esc>:se ft=sql<cr>

" ##########################   自动编译文件    ######################################

" ,run        一键保存、编译、运行
imap <LEADER>run <esc>:call Compile_Run_Code()<cr>
nmap <LEADER>run :call Compile_Run_Code()<cr>
vmap <LEADER>run <esc>:call Compile_Run_Code()<cr>

" ======= 编译 && 运行 ======= "
" 编译并运行
func! Compile_Run_Code()
    exec 'w'
    if &filetype == 'c'
        if g:isWIN
            exec '!gcc -Wall -std=c11 -o %:r %:t && %:r.exe'
        else
            exec '!clang -Wall -std=c11 -o %:r %:t && ./%:r'
        endif
    elseif &filetype == 'cpp'
        if g:isWIN
            exec '!g++ -Wall -std=c++17 -o %:r %:t && %:r.exe'
        else
            exec '!clang++ -Wall -std=c++17 -o %:r %:t && ./%:r'
        endif
    elseif &filetype == 'objc'
        if g:isMAC
            exec '!clang -fobjc-arc -framework Foundation %:t -o %:r && ./%:r'
        endif
    elseif &filetype == 'swift'
        if g:isWIN
            exec '!swiftc %:t && %:r.exe'
        else
            exec '!swiftc %:t && ./%:r'
        endif
    elseif &filetype == 'd'
        if g:isWIN
            exec '!dmd -wi %:t && del %:r.obj && %:r.exe'
        else
            exec '!dmd -wi %:t && rm %:r.o && ./%:r'
        endif
    elseif &filetype == 'rust'
        if g:isWIN
            exec '!rustc %:t && %:r.exe'
        else
            exec '!rustc %:t && ./%:r'
        endif
    elseif &filetype == 'go'
        if g:isWIN
            exec '!go build %:t && %:r.exe'
        else
            exec '!go build %:t && ./%:r'
        endif
    elseif &filetype == 'nim'
        if g:isWIN
            exec '!nim c %:t && %:r.exe'
        else
            exec '!nim c %:t && ./%:r'
        endif
    elseif &filetype == 'crystal'
        if g:isWIN
            exec '!crystal build %:t && %:r.exe'
        else
            exec '!crystal build %:t && ./%:r'
        endif
    elseif &filetype == 'vala'
        if g:isWIN
            exec '!valac %:t && %:r.exe'
        else
            exec '!valac %:t && ./%:r'
        endif
    elseif &filetype == 'java'
        exec '!javac %:t && java %:r'
    elseif &filetype == 'groovy'
        exec '!groovy %:t'
    elseif &filetype == 'kotlin'
        exec '!kotlinc %:t -include-runtime -d %:r.jar && kotlin %:r.jar'
    elseif &filetype == 'scala'
        exec '!scala %:t'
    elseif &filetype == 'clojure'
        exec '!lein exec %:t'
    elseif &filetype == 'cs'
        if g:isWIN
            exec '!csc %:t && %:r.exe'
        else
            exec '!mcs %:t && mono %:r.exe'
        endif
    elseif &filetype == 'fsharp'
        if g:isWIN
            exec '!fsc %:t && %:r.exe'
        else
            exec '!fsharpc %:t && mono %:r.exe'
        endif
    elseif &filetype == 'erlang'
        exec '!escript %:t'
    elseif &filetype == 'elixir'
        exec '!elixir %:t'
    elseif &filetype == 'lfe'
        exec '!lfe %:t'
    elseif &filetype == 'scheme'
        exec '!chez %:t'
    elseif &filetype == 'racket'
        exec '!racket -fi %:t'
    elseif &filetype == 'lisp'
        exec '!sbcl --load %:t'
    elseif &filetype == 'ocaml'
        if g:isWIN
            exec '!ocamlc -o %:r.exe %:t && %:r.exe'
        else
            exec '!ocamlc -o %:r %:t && ./%:r'
        endif
    elseif &filetype == 'haskell'
        if g:isWIN
            exec '!ghc -o %:r %:t && %:r.exe'
        else
            exec '!ghc -o %:r %:t && ./%:r'
        endif
    elseif &filetype == 'io'
        exec '!io %:t'
    elseif &filetype == 'lua'
        exec '!lua %:t'
    elseif &filetype == 'perl'
        exec '!perl %:t'
    elseif &filetype == 'perl6'
        exec '!perl6 %:t'
    elseif &filetype == 'raku'
        exec '!raku %:t'
    elseif &filetype == 'php'
        exec '!php %:t'
    elseif &filetype == 'python'
        exec '!python3 %:t'
    elseif &filetype == 'ruby'
        exec '!ruby %:t'
    elseif &filetype == 'julia'
        exec '!julia %:t'
    elseif &filetype == 'dart'
        exec '!dart %:t'
    elseif &filetype == 'elm'
        exec '!elm make %:t'
    elseif &filetype == 'haxe'
        exec '!haxe -main %:r --interp'
    elseif &filetype == 'javascript'
        exec '!node %:t'
    elseif &filetype == 'coffee'
        exec '!coffee -c %:t && node %:r.js'
    elseif &filetype == 'typescript'
        exec '!tsc %:t && node %:r.js'
    elseif &filetype == 'ls'
        exec '!lsc -c %:t && node %:r.js'
    elseif &filetype == 'r'
        exec '!Rscript %:t'
    elseif &filetype == 'sh'
        exec '!bash %:t'
    elseif &filetype == 'slim'
        exec '!slimrb -ce %:t > %:r.html.erb'
    elseif &filetype == 'scss'
        exec '!scss %:t > %:r.css'
    elseif &filetype == 'less'
        exec '!lessc %:t > %:r.css'
    elseif &filetype == 'solidity'
        exec '!solc --bin %:t'
    endif
endfunc

" ########################   添加文件Title  #############################

" Python自动插入文件标题
autocmd BufNewFile *.py exec ":call SetPythonTitle()"
function SetPythonTitle()
  call setline(1,"# Copyright (c) StilesYu  All Rights Reserved.")
  call append(line("."), "\# File Name: ".("%"))
  call append(line(".")+1, "\# Author: Stiles Yu")
  call append(line(".")+2, "\# mail: 13891328530@163.com")
  call append(line(".")+3,"\# github:https://github.com/Stilesyu")
  call append(line(".")+4,"\# blog:http://www.stilesyu.com/")
 call append(line(".")+5, "\# Created Time: ".strftime("%Y-%m-%d",localtime()))
	"新建文件后，自动定位到文件末尾
	autocmd BufNewFile * normal G o
endfunc

" ########################    插件配置  #############################

" ------------------ NERDTree插件配置 ------------------
"树形目录开关
map <LEADER>nt :NERDTreeMirror<CR>
map <LEADER>nt :NERDTreeToggle<CR>
" 当只剩 文件窗口管理器时 关闭 vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 更改默认的 箭头 
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" 默认打开NERDTree
let NERDTreeChDirMode=2                                         " 设置当前目录为nerdtree的起始目录
let NERDChristmasTree=1                                         " 使得窗口有更好看的效果
let NERDTreeMouseMode=1                                         " 双击鼠标左键打开文件
let NERDTreeWinSize=25                                          " 设置窗口宽度为25
let NERDTreeQuitOnOpen=1                                        " 打开一个文件时nerdtree分栏自动关闭
" 打开文件默认开启文件树
"autocmd VimEnter * NERDTree
" NERDTree            树形文件浏览器
let g:NERDTreeShowHidden         = 1           " 显示隐藏文件   [NERDTree]
let g:NERDTreeShowIgnoredStatus  = 1           " 显示被忽略图标 [NERDTree-Git-Plugin]
let g:NERDTreeIndicatorMapCustom = {
            \ 'Modified'  : '✹',
            \ 'Staged'    : '✚',
            \ 'Untracked' : '✭',
            \ 'Renamed'   : '➜',
            \ 'Unmerged'  : '═',
            \ 'Deleted'   : '✖',
            \ 'Dirty'     : '✗',
            \ 'Clean'     : '✔︎',
            \ 'Unknown'   : '?'
            \ }                                " 为 NERDTree-Git-Plugin 设定各个状态对应的符号

" NERD_commenter      注释处理插件
let NERDSpaceDelims = 1                        " 自动添加前置空格

" ******************** 航空公司的配置 ********************************
" 开启拓展
let g:airline#extensions#tabline#enabled = 1
" 为标签行配置单独的分隔符
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" 启用默认样式
let g:airline#extensions#tabline#formatter = 'unique_tail'
" 配置样式
let g:airline_theme='papercolor'

let g:airline#extensions#keymap#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
       \ '0': '0 ',
       \ '1': '1 ',
       \ '2': '2 ',
       \ '3': '3 ',
       \ '4': '4 ',
       \ '5': '5 ',
       \ '6': '6 ',
       \ '7': '7 ',
       \ '8': '8 ',
       \ '9': '9 '
       \}
" 设置切换tab的快捷键 <,> + <i> 切换到第i个 tab
nmap <LEADER>1 <Plug>AirlineSelectTab1
nmap <LEADER>2 <Plug>AirlineSelectTab2
nmap <LEADER>3 <Plug>AirlineSelectTab3
nmap <LEADER>4 <Plug>AirlineSelectTab4
nmap <LEADER>5 <Plug>AirlineSelectTab5
nmap <LEADER>6 <Plug>AirlineSelectTab6
nmap <LEADER>7 <Plug>AirlineSelectTab7
nmap <LEADER>8 <Plug>AirlineSelectTab8
nmap <LEADER>9 <Plug>AirlineSelectTab9
" 设置切换tab的快捷键 <,> + <-> 切换到前一个 tab
nmap <LEADER>- <Plug>AirlineSelectPrevTab
" 设置切换tab的快捷键 <,> + <+> 切换到后一个 tab
nmap <LEADER>+ <Plug>AirlineSelectNextTab
" 设置切换tab的快捷键 <,> + <q> 退出当前的 tab
nmap <LEADER>q :bp<cr>:bd #<cr>
" 修改了一些个人不喜欢的字符
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = "CL" " current line
let g:airline_symbols.whitespace = '|'
let g:airline_symbols.maxlinenr = 'Ml' "maxline
let g:airline_symbols.branch = 'BR'
let g:airline_symbols.readonly = "RO"
let g:airline_symbols.dirty = "DT"
let g:airline_symbols.crypt = "CR"

" ----------------     Markdown 文档插件的配置      ----------------------------
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 1

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'


"
"******************auto format设置***************
"vim-autopep8设置,关闭diff提示
let g:autopep8_disable_show_diff=1

"****************jedi-vim设置*******************
"let g:jedi#auto_initialization = 1
"let g:jedi#completions_enabled = 0
""如果你想启用这个功能,auto_initialization必须开启
"let g:jedi#show_call_signatures = 1
""  MD 文集实施预览插件配置   vim-instant-markdown
"filetype plugin on
"Uncomment to override defaults:
" 取消注释已覆盖默认值
" ----------- 0：表示关闭；1：表示开启---------------
"let g:instant_markdown_slow = 1
" 手动打开预览窗口 默认值：1
"let g:instant_markdown_autostart = 1
"默认情况下，服务器仅在localhost上侦听。要使服务器可用于网络中的其他人
"let g:instant_markdown_open_to_the_world = 0
" 启用脚本
"let g:instant_markdown_allow_unsafe_content = 1
" 是否允许使用外部资源，例如图像。默认开启
"let g:instant_markdown_allow_external_content = 1
"默认情况下，不会渲染Markdown中嵌入的TeX代码。该选项使用MathJax并以方式启动节点服务器instant-markdown-d --mathjax。
"let g:instant_markdown_mathjax = 1
" 将启动日志保存到文件中，方便查处错误
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
" 默认开启 自动到光标所在的位置
"let g:instant_markdown_autoscroll = 1
" 自定义端口
"let g:instant_markdown_port = 8090
"let g:instant_markdown_python = 1

" #########################    语言服务器配置       #####################################

" ------------------------   COC 代码补全插件配置   ------------------------
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"#####################       安装插件               #########################
"
call plug#begin("D:\\Program Files (x86)\\Vim\\vimfiles\\plugged\\")

" ------------------------------ 美化 ------------------------------ 
"启动vim或nvim你将看到一个酷酷的启动界面
Plug 'mhinz/vim-startify'
" ----- 底部状态栏 -----
" 航空公司
Plug 'vim-airline/vim-airline'
" 航空公司的主题
Plug 'vim-airline/vim-airline-themes'
" gruvbox 主题
Plug 'morhetz/gruvbox'

" 一个不知名的黑色主题
"Plug 'joshdick/onedark.vim'
" 主题安装
"Plug 'ajmwagar/vim-deus'
" 吸血鬼 主题
"Plug 'dracula/vim', { 'as': 'dracula' }

" ------------------------------ 语法高亮包 ------------------------------ 
" HTML, CSS, JavaScript, PHP, JSON, etc.
" Json 文件的语法高亮包
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less', 'js'] }
Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
" JavaScript 文件的语法高亮 
Plug 'pangloss/vim-javascript', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less', 'js'] }
Plug 'yuezk/vim-js', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less', 'js'] }
Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less', 'js'] }
Plug 'jelera/vim-javascript-syntax', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less', 'js'] }
" Vim语言包的集合。
"属于开箱即用型的语法高亮包
Plug 'sheerun/vim-polyglot'
" html5的语法高亮包
Plug 'othree/html5.vim'
" MD 文件的语法高亮包
Plug 'plasticboy/vim-markdown'
" css 文件的语法高亮包
Plug 'JulesWang/css.vim'
" css3 的语法高亮插件
"  与css.vim 有冲突先注释掉
" Plug 'hail2u/vim-css3-syntax'
" Python 文件的语法高亮包
Plug 'mitsuhiko/vim-python-combined'
" 该vim软件包为动态样式表语言LESS添加了语法突出显示，缩进和自动完成功能。
" Plug 'groenewege/vim-less'
" TypeScript的语法文件和其他设置。语法文件来自此博客文章。
" 安装文件后，无论何时编辑.ts文件，都会自动启用语法高亮显示和其他设置。
Plug 'leafgarland/typescript-vim'
" 补充一个 Vue 模板的
" Vue.js组件的语法突出显示
Plug 'posva/vim-vue'
" 色彩高亮，例子: #66CCFF
Plug 'gorodinskiy/vim-coloresque'

" ------------------------------ 代码补全插件 ------------------------------ 
" COC 补全插件
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'wellle/tmux-complete.vim'

" Markdown
" md 时式预览插件
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }

" ------------------------------ Git ------------------------------ 
Plug 'tpope/vim-fugitive'
Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
Plug 'fszymanski/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }

" ------------------------------ 其他工具 ------------------------------ 
"nerdtree 文件树
Plug 'preservim/nerdtree'
"创建HTML文件模板
Plug 'mattn/emmet-vim'
" 符号匹配
Plug 'junegunn/vim-easy-align'
" 文件搜索工具
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"自动引号/括号
Plug 'jiangmiao/auto-pairs'
" LaTeX文件工具
"Plug 'honza/vim-snippets'

"-----------------------------------
" 自动选中括号内的文本
Plug 'gcmt/wildfire.vim'
" 更改包围的引号以及括号
" 1.使用 cs"' 将'替换成"包裹
" 2.整行包裹 使用 cst"
" 3.还原 ds"
" 等等
" 搭配 gcmt/wildfire.vim 插件使用
Plug 'tpope/vim-surround'
"-----------------------------------

call plug#end()
